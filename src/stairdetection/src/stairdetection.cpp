#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include "cloud_processor.h"
#include "stairdetection/stairdetectionConfig.h"
#include <dynamic_reconfigure/server.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/subscriber.h>
#include <tf/transform_listener.h>
#include <pcl_ros/transforms.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <chrono>
#include <geometry_msgs/PoseArray.h>
#include <tf2_ros/transform_listener.h>
#include <pcl_ros/transforms.h>

ros::Publisher pub_pass;
ros::Publisher pub_voxel;
ros::Publisher pub_max_z;
ros::Publisher pub_angle;
ros::Publisher start_pos_pub;
ros::Publisher staircases_pose_pub;
ros::Publisher cloud_pub;
ros::Publisher lines_pub;
ros::Publisher staircases_pub;
ros::Publisher staircases_pub_vis;

std::vector<Staircase> staircases;

line_extraction::Params line_params;
stair_detection::Params stair_detector_params;
float window = 2;
float x_min = -window;
float x_max =  window;
float y_min = -window;
float y_max =  window;
float leafsize = 0.04;
float z_min = -2;
float z_max = 2;
float z_division_size = 0.1;
int angle_divisions = 120;

tf2_ros::Buffer tfBuffer;

void cloud_cb(const sensor_msgs::PointCloud2ConstPtr& merged_cloud_msg)
{
  pcl::PointCloud<pcl::PointXYZ>::Ptr merged_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromROSMsg(*merged_cloud_msg, *merged_cloud);
  geometry_msgs::Transform transform;
  try
  {
    geometry_msgs::TransformStamped transformStamped = tfBuffer.lookupTransform("map", "base_link", ros::Time(0));
    transform = transformStamped.transform;
    x_min = transform.translation.x - window;
    x_max = transform.translation.x + window;
    y_min = transform.translation.y - window;
    y_max = transform.translation.y + window;
  }
  catch (tf2::TransformException &ex)
  {
    ROS_WARN("%s",ex.what());
  }
  CloudProcessor* cloud_processor = new CloudProcessor(merged_cloud);
  cloud_processor->setParams(transform.translation.x, transform.translation.y, line_params);
  auto start = std::chrono::high_resolution_clock::now();
  cloud_processor->filter("x", x_min, x_max);
  cloud_processor->filter("y", y_min, y_max);
  cloud_processor->filter("z", z_min, z_max);
  auto end = std::chrono::high_resolution_clock::now();
  auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
  ROS_INFO("Time for pass through filter: %d ms", elapsed.count());
  
  start = std::chrono::high_resolution_clock::now();
  cloud_processor->downsample(leafsize);
  end = std::chrono::high_resolution_clock::now();
  elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
  ROS_INFO("Time for voxel grid filter: %d ms", elapsed.count());

  std::vector<line_extraction::Line> lines = cloud_processor->extractEdges(z_division_size, angle_divisions);
  StairDetector* stair_detector = new StairDetector(lines, &staircases);
  stair_detector->setParams(stair_detector_params);
  start = std::chrono::high_resolution_clock::now();
  stair_detector->detectStairs();
  ROS_INFO("Nr of staircases: %d", staircases.size());
  end = std::chrono::high_resolution_clock::now();
  elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
  ROS_INFO("Time for stair detection: %d ms", elapsed.count());
  
  std::vector<sensor_msgs::PointCloud2> clouds = cloud_processor->getPointCloud2Msgs();
  pub_pass.publish(clouds[0]);
  pub_voxel.publish(clouds[1]);
  pub_max_z.publish(clouds[2]);
  pub_angle.publish(clouds[3]);
  lines_pub.publish(cloud_processor->getLinesMarker());
  staircases_pub_vis.publish(stair_detector->getMarkerArray());
  staircases_pub.publish(stair_detector->getStaircaseArray());
  staircases_pose_pub.publish(stair_detector->getStartingPoses());
  
  delete cloud_processor;
  delete stair_detector;
}

void reconfig_cb(stairdetection::stairdetectionConfig &config, uint32_t level)
{
  window = config.window_size;
  leafsize = config.leafsize;
  z_min = config.z_min_filter;
  z_max = config.z_max_filter;
  z_division_size = config.z_division_size;
  angle_divisions = config.angle_divisions;

  line_params.bearing_var = config.min_line_length;
  line_params.range_var = config.max_line_gap;
  line_params.least_sq_angle_thresh = config.least_sq_angle_thresh;
  line_params.least_sq_radius_thresh = config.least_sq_radius_thresh;
  line_params.max_line_gap = config.max_line_gap;
  line_params.min_line_length = config.min_line_length;
  line_params.min_range = config.min_range;
  line_params.max_range = config.max_range;
  line_params.min_split_dist = config.min_split_dist;
  line_params.outlier_dist = config.outlier_dist;
  line_params.min_line_points = config.min_line_points;

  stair_detector_params.min_height = config.min_height;
  stair_detector_params.max_height = config.max_height;
  stair_detector_params.nr_steps = config.nr_steps;
  stair_detector_params.min_depth = config.min_depth;
  stair_detector_params.max_depth = config.max_depth;
  stair_detector_params.min_slope = config.min_slope;
  stair_detector_params.max_slope = config.max_slope;
  stair_detector_params.max_orientation_diff = config.max_orientation_diff;
  stair_detector_params.min_offset_angle = config.min_offset_angle;
  stair_detector_params.max_offset_angle = config.max_offset_angle;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "stairdetection");
  ros::NodeHandle nh;
  tf2_ros::TransformListener tfListener(tfBuffer);

  dynamic_reconfigure::Server<stairdetection::stairdetectionConfig> server;
  dynamic_reconfigure::Server<stairdetection::stairdetectionConfig>::CallbackType f;
  f = boost::bind(&reconfig_cb, _1, _2);
  server.setCallback(f);

  ros::Subscriber sub = nh.subscribe("/merged_cloud", 1, cloud_cb);

  pub_pass = nh.advertise<sensor_msgs::PointCloud2>("filtered_cloud_pass", 1);
  pub_voxel = nh.advertise<sensor_msgs::PointCloud2>("filtered_cloud_voxel", 1);
  pub_max_z = nh.advertise<sensor_msgs::PointCloud2>("filtered_cloud_max_z", 1);
  pub_angle = nh.advertise<sensor_msgs::PointCloud2>("filtered_cloud_angle", 1);
  staircases_pose_pub = nh.advertise<geometry_msgs::PoseArray>("ascending_staircase_pose", 1);
  cloud_pub = nh.advertise<sensor_msgs::PointCloud2>("flat_cloud", 1); 
  lines_pub = nh.advertise<visualization_msgs::MarkerArray>("lines", 1); 
  staircases_pub_vis = nh.advertise<visualization_msgs::MarkerArray>("staircases_marker", 1);
  staircases_pub = nh.advertise<stairdetection::StaircaseArray>("staircases", 1);
  ros::spin();
}