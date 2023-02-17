#include "cloud_processor.h"

CloudProcessor::CloudProcessor(pcl::PointCloud<pcl::PointXYZ>::Ptr input)
{
    this->cloud.swap(input);
}

CloudProcessor::~CloudProcessor()
{
}

void CloudProcessor::downsample(float leafSize)
{
  this->filtered_clouds.push_back(*cloud);
  voxelgrid.setInputCloud(cloud);
  voxelgrid.setLeafSize(leafSize, leafSize, leafSize);
  voxelgrid.filter(*cloud);
  this->filtered_clouds.push_back(*cloud);
}

void CloudProcessor::setParams(double x_offset, double y_offset, line_extraction::Params params)
{
  this->x_offset = x_offset;
  this->y_offset = y_offset;
  this->params = params;
}

void CloudProcessor::filter(std::string axis, float min, float max)
{
  pcl::PassThrough<pcl::PointXYZ> pass;
  pass.setInputCloud(cloud);
  pass.setFilterFieldName(axis);
  pass.setFilterLimits(min, max);
  pass.filter(*cloud);
}

std::vector<line_extraction::Line> CloudProcessor::extractEdges(double z_division_size, int angle_divisions)
{
  voxelgrid.initializeVoxelGrid();
  auto start = std::chrono::high_resolution_clock::now();
  std::vector<pcl::PointXYZ> z_points;
  Eigen::Vector3i min_b = voxelgrid.getMinBoxCoordinates();
  Eigen::Vector3i max_b = voxelgrid.getMaxBoxCoordinates();
  Eigen::Vector3i div   = voxelgrid.getNrDivisions();
  std::vector<int> leafLayout = voxelgrid.getLeafLayout();
  for (std::size_t i = 0; i < cloud->size(); i++)
  {
    pcl::PointXYZ p = cloud->points[i];
    Eigen::Vector3i ijk = voxelgrid.getGridCoordinates(p.x, p.y, p.z);
    bool found_above = false;
    unsigned int counter = 0;
    while (counter++ < 3 && !found_above)
    {
      ijk.z() = fmin(max_b.z(), ijk.z() + 1);
      unsigned int lookup_idx = (ijk.x() - min_b.x()) + (ijk.y() - min_b.y()) * div.x() + (ijk.z() - min_b.z()) * div.x() * div.y();
      int idx = leafLayout[lookup_idx];
      if (idx != -1) found_above = true;
    }
    if (!found_above) z_points.push_back(p);
  }
  auto finish = std::chrono::high_resolution_clock::now();
  auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(finish - start);
  ROS_INFO("Time for max z filter: %d ms", elapsed.count());
  cloud->points.clear();
  cloud->points.insert(cloud->points.end(), z_points.begin(), z_points.end());
  cloud->width = cloud->points.size();

  this->filtered_clouds.push_back(*cloud);
  
  pcl::PointXYZ min, max;
  pcl::getMinMax3D(*cloud, min, max);

  int z_divisions = abs(min.z - max.z) / z_division_size + 1;
  std::vector<pcl::PointXYZ> azimuth_array[z_divisions][angle_divisions];
  for (int i = 0; i < cloud->size(); i++)
  {
    pcl::PointXYZ point = cloud->points[i];
    int z_index = std::min((int) ((point.z - min.z) / z_division_size), z_divisions - 1);
    int azimuth_index = std::min((int) (((atan2(point.y - y_offset, point.x - x_offset)) + M_PI) * angle_divisions / (2 * M_PI)), angle_divisions - 1);
    azimuth_array[z_index][azimuth_index].push_back(point);
  }

  std::vector<pcl::PointXYZ> new_points;
  start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < z_divisions; i++)
  {
    for (int j = 0; j < angle_divisions; j++)
    {
      if(azimuth_array[i][j].size() <= 1)
      {
        new_points.insert(new_points.end(), azimuth_array[i][j].begin(), azimuth_array[i][j].end());
        continue;
      }
      if(azimuth_array[i][j].size() > 1)
      {
        int starting_points = azimuth_array[i][j].size();
        for (int k = 0; k < starting_points - 1; k++)
        {
          float distance1 = sqrt(pow(azimuth_array[i][j][0].x - x_offset, 2) + pow(azimuth_array[i][j][0].y - y_offset, 2));
          float distance2 = sqrt(pow(azimuth_array[i][j][1].x - x_offset, 2) + pow(azimuth_array[i][j][1].y - y_offset, 2));
          distance1 >= distance2 ? azimuth_array[i][j].erase(azimuth_array[i][j].begin() + 0) : 
                                        azimuth_array[i][j].erase(azimuth_array[i][j].begin() + 1);

        }
      }
      new_points.insert(new_points.end(), azimuth_array[i][j].begin(), azimuth_array[i][j].end());
    }
  }
  finish = std::chrono::high_resolution_clock::now();
  elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(finish - start);
  ROS_INFO("Time for filtering edges: %d ms", elapsed.count());
  cloud->points.clear();
  cloud->points.insert(cloud->points.end(), new_points.begin(), new_points.end());
  cloud->width = cloud->points.size();
  this->filtered_clouds.push_back(*cloud);
  // publish filtered cloud for every entry in azimuth array
  line_extraction::LineExtraction lineExtractor;
  lineExtractor.setParams(this->params);
  visualization_msgs::MarkerArray marker_array;
  std::vector<line_extraction::Line> all_lines;
  int markerIdCounter = 0;
  for (int i = 0; i < z_divisions; i++)
  {
    std::vector<pcl::PointXYZ> z_points;
    for (int j = 0; j < angle_divisions; j++)
    {
      std::vector<pcl::PointXYZ> points = azimuth_array[i][j];
      if(points.size() < 1) continue;
      z_points.insert(z_points.end(), points.begin(), points.end());
    }
    if (z_points.size() < 1) continue;
    lineExtractor.setPoints(z_points);
    lineExtractor.calcDataFromPoints();
    std::vector<line_extraction::Line> lines;
    lineExtractor.extractLines(lines);
    all_lines.insert(all_lines.end(), lines.begin(), lines.end());
    // visualize lines with markers
    for (int k = 0; k < lines.size(); k++)
    {
      visualization_msgs::Marker marker = lines[k].getMarker();
      marker.id = markerIdCounter++;
      marker_array.markers.push_back(marker);
    }
    lines.clear();
    z_points.clear();
  }
  this->linesMarker = marker_array;
  return all_lines;
}

visualization_msgs::MarkerArray CloudProcessor::getLinesMarker()
{
  return this->linesMarker;
}

void CloudProcessor::toROSPoint(const pcl::PointXYZ &input, geometry_msgs::Point &output)
{
  output.x = input.x;
  output.y = input.y;
  output.z = input.z;
}

std::vector<sensor_msgs::PointCloud2> CloudProcessor::getPointCloud2Msgs()
{
  std::vector<sensor_msgs::PointCloud2> output_vec;
  for (std::size_t i = 0; i < this->filtered_clouds.size(); i++)
  {
    pcl::PointCloud<pcl::PointXYZ> filtered_cloud = filtered_clouds[i];
    sensor_msgs::PointCloud2 output;
    pcl::toROSMsg(filtered_cloud, output);
    output_vec.push_back(output);
  }
  return output_vec;
}