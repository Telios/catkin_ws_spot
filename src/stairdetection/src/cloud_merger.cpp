#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <tf/transform_listener.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/transforms.h>
#include <chrono>
#include <message_filters/sync_policies/approximate_time.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/subscriber.h>
#include <pcl/filters/voxel_grid.h>
#include <tf2_ros/transform_listener.h>

typedef message_filters::sync_policies::ApproximateTime<sensor_msgs::PointCloud2, sensor_msgs::PointCloud2,
                                                        sensor_msgs::PointCloud2, sensor_msgs::PointCloud2,
                                                        sensor_msgs::PointCloud2, sensor_msgs::PointCloud2> MySyncPolicy;
ros::Publisher pub;
auto start = std::chrono::high_resolution_clock::now();
int nr_accumulations = 4;
int received_clouds_left = nr_accumulations;
pcl::PointCloud<pcl::PointXYZ>::Ptr merged_cloud(new pcl::PointCloud<pcl::PointXYZ>);
std::string frame_id = "base_link";

tf2_ros::Buffer tfBuffer;

void cloud_cb(const sensor_msgs::PointCloud2ConstPtr& lidar,
  const sensor_msgs::PointCloud2ConstPtr& camera_front_left, 
  const sensor_msgs::PointCloud2ConstPtr& camera_front_right,
  const sensor_msgs::PointCloud2ConstPtr& camera_left, 
  const sensor_msgs::PointCloud2ConstPtr& camera_right,
  const sensor_msgs::PointCloud2ConstPtr& camera_back)
{
  pcl::PointCloud<pcl::PointXYZ>::Ptr lidar_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr camera_front_left_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr camera_front_right_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr camera_left_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr camera_right_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr camera_back_cloud (new pcl::PointCloud<pcl::PointXYZ>);
  
  pcl::fromROSMsg(*lidar, *lidar_cloud);
  pcl::fromROSMsg(*camera_front_left, *camera_front_left_cloud);
  pcl::fromROSMsg(*camera_front_right, *camera_front_right_cloud);
  pcl::fromROSMsg(*camera_left, *camera_left_cloud);
  pcl::fromROSMsg(*camera_right, *camera_right_cloud);
  pcl::fromROSMsg(*camera_back, *camera_back_cloud);

  auto start1 = std::chrono::high_resolution_clock::now();
  float leafSize = 0.02;
  pcl::VoxelGrid<pcl::PointXYZ> voxelgrid;
  voxelgrid.setInputCloud(lidar_cloud);
  voxelgrid.setLeafSize(leafSize, leafSize, leafSize);
  voxelgrid.filter(*lidar_cloud);
  voxelgrid.setInputCloud(camera_front_left_cloud);
  voxelgrid.filter(*camera_front_left_cloud);
  voxelgrid.setInputCloud(camera_front_right_cloud);
  voxelgrid.filter(*camera_front_right_cloud);
  voxelgrid.setInputCloud(camera_left_cloud);
  voxelgrid.filter(*camera_left_cloud);
  voxelgrid.setInputCloud(camera_right_cloud);
  voxelgrid.filter(*camera_right_cloud);
  voxelgrid.setInputCloud(camera_back_cloud);
  voxelgrid.filter(*camera_back_cloud);
  auto end = std::chrono::high_resolution_clock::now();
  auto time_elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(end - start1);
  ROS_INFO("Time for voxelgrid filtering: %d ms", time_elapsed.count());

  auto tf_start = std::chrono::high_resolution_clock::now();

  geometry_msgs::Transform transform;
  transform.translation.x =  -0.255;
  transform.translation.y =  0.000;
  transform.translation.z =  0.191;
  transform.rotation.x =  0.000;
  transform.rotation.y =  0.000;
  transform.rotation.z =  0.000;
  transform.rotation.w =  1.000;
  pcl_ros::transformPointCloud(*lidar_cloud, *lidar_cloud, transform);

  transform.translation.x =  0.413;
  transform.translation.y =  0.032;
  transform.translation.z =  0.023;
  transform.rotation.x =  0.144;
  transform.rotation.y =  0.809;
  transform.rotation.z = -0.228;
  transform.rotation.w =  0.522;
  pcl_ros::transformPointCloud(*camera_front_left_cloud, *camera_front_left_cloud, transform);

  transform.translation.x =  0.413;
  transform.translation.y = -0.042;
  transform.translation.z =  0.022;
  transform.rotation.x =  -0.146;
  transform.rotation.y =  0.809;
  transform.rotation.z =  0.230;
  transform.rotation.w =  0.521;
  pcl_ros::transformPointCloud(*camera_front_right_cloud, *camera_front_right_cloud, transform);

  transform.translation.x = -0.167;
  transform.translation.y =  0.109;
  transform.translation.z =  0.037;
  transform.rotation.x = -0.798;
  transform.rotation.y =  -0.003;
  transform.rotation.z =  0.002;
  transform.rotation.w =  0.602;
  pcl_ros::transformPointCloud(*camera_left_cloud, *camera_left_cloud, transform);

  transform.translation.x = -0.165;
  transform.translation.y = -0.108;
  transform.translation.z =  0.038;
  transform.rotation.x =  0.796;
  transform.rotation.y =  -0.008;
  transform.rotation.z = -0.001;
  transform.rotation.w =  0.606;
  pcl_ros::transformPointCloud(*camera_right_cloud, *camera_right_cloud, transform);

  transform.translation.x = -0.416;
  transform.translation.y = -0.034;
  transform.translation.z =  0.009;
  transform.rotation.x =  0.564;
  transform.rotation.y =  0.566;
  transform.rotation.z = -0.426;
  transform.rotation.w = -0.426;
  pcl_ros::transformPointCloud(*camera_back_cloud, *camera_back_cloud, transform);

  auto tf_end = std::chrono::high_resolution_clock::now();
  auto tf_elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(tf_end - tf_start);
  ROS_INFO("Time for transforming clouds: %d ms", tf_elapsed.count());

  tf_start = std::chrono::high_resolution_clock::now();
  geometry_msgs::TransformStamped transformStamped;
  try
  {
    transformStamped = tfBuffer.lookupTransform("map", frame_id, ros::Time::now(), ros::Duration(1.0));
    pcl_ros::transformPointCloud(*lidar_cloud, *lidar_cloud, transformStamped.transform);
    pcl_ros::transformPointCloud(*camera_front_left_cloud, *camera_front_left_cloud, transformStamped.transform);
    pcl_ros::transformPointCloud(*camera_front_right_cloud, *camera_front_right_cloud, transformStamped.transform);
    pcl_ros::transformPointCloud(*camera_left_cloud, *camera_left_cloud, transformStamped.transform);
    pcl_ros::transformPointCloud(*camera_right_cloud, *camera_right_cloud, transformStamped.transform);
    pcl_ros::transformPointCloud(*camera_back_cloud, *camera_back_cloud, transformStamped.transform);
  }
  catch (tf2::TransformException &ex)
  {
    ROS_WARN("%s",ex.what());
  }
  
  tf_end = std::chrono::high_resolution_clock::now();
  tf_elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(tf_end - tf_start);
  ROS_INFO("Time for transforming clouds from base_link to map: %d ms", tf_elapsed.count());

  received_clouds_left--;

  tf_start = std::chrono::high_resolution_clock::now();
  *merged_cloud += *lidar_cloud;
  *merged_cloud += *camera_front_left_cloud;
  *merged_cloud += *camera_front_right_cloud;
  *merged_cloud += *camera_left_cloud;
  *merged_cloud += *camera_right_cloud;
  *merged_cloud += *camera_back_cloud;
  tf_end = std::chrono::high_resolution_clock::now();
  tf_elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(tf_end - tf_start);
  ROS_INFO("Time for concatenating clouds: %d ms", tf_elapsed.count());
  if(received_clouds_left == 0)
  {
    merged_cloud->header = lidar_cloud->header;
    merged_cloud->header.frame_id = "map";
    sensor_msgs::PointCloud2 output;
    pcl::toROSMsg(*merged_cloud, output);
    pub.publish(output);
    received_clouds_left = nr_accumulations;
    merged_cloud->clear();
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    ROS_INFO("Time for merging clouds: %d ms", elapsed.count());
    start = std::chrono::high_resolution_clock::now();
  }
}
int main(int argc, char** argv)
{
  ros::init(argc, argv, "cloud_merger");
  ros::NodeHandle nh;
  tf2_ros::TransformListener tfListener(tfBuffer);

  message_filters::Subscriber<sensor_msgs::PointCloud2> lidar(nh, "/velodyne_points", 1);
  message_filters::Subscriber<sensor_msgs::PointCloud2> depth_front_left(nh, "/camera_front_left/depth/points", 1);
  message_filters::Subscriber<sensor_msgs::PointCloud2> depth_front_right(nh, "/camera_front_right/depth/points", 1);
  message_filters::Subscriber<sensor_msgs::PointCloud2> depth_left(nh, "/camera_left/depth/points", 1);
  message_filters::Subscriber<sensor_msgs::PointCloud2> depth_right(nh, "/camera_right/depth/points", 1);
  message_filters::Subscriber<sensor_msgs::PointCloud2> depth_back(nh, "/camera_back/depth/points", 1);

  message_filters::Synchronizer<MySyncPolicy> *sync = new message_filters::Synchronizer<MySyncPolicy> (MySyncPolicy(10), lidar, depth_front_left, depth_front_right, depth_left, depth_right, depth_back);
  sync->registerCallback(boost::bind(&cloud_cb, _1, _2, _3, _4, _5, _6));

  pub = nh.advertise<sensor_msgs::PointCloud2>("merged_cloud", 1);
  ros::spin();
  delete sync;
}