#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid_occlusion_estimation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/features/normal_3d.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/moment_of_inertia_estimation.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <move_base_msgs/MoveBaseGoal.h>
#include <chrono>
#include "line_extraction.h"
#include "stair_detector.h"
#include <pcl/common/distances.h>

/// @brief Class representing plane extraction from a pointcloud.
class CloudProcessor
{
private:
    /// @brief Cloud to be processed.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud;

    /// @brief filtered pointcloud.
    std::vector<pcl::PointCloud<pcl::PointXYZ>> filtered_clouds;

    /// @brief The voxel grid object
    pcl::VoxelGridOcclusionEstimation<pcl::PointXYZ> voxelgrid;

    /// @brief X and Y offset for initializing azimuth array.
    double x_offset, y_offset;

    /// @brief Parameters for line extraction.
    line_extraction::Params params;

    /// @brief MarkerArray for detected lines.
    visualization_msgs::MarkerArray linesMarker;

    /// @brief Convert pcl::PointXYZ to ROS Point msg.
    /// @param input pcl::PointXYZ to be converted.
    /// @param output constructed geometry_msgs::Point.
    void toROSPoint(const pcl::PointXYZ &input, geometry_msgs::Point &output);

public:
    /// @brief Constructor for CloudProcessor with pcl pointcloud as input.
    /// @param input pcl PointCloud to extract planes/steps.
    CloudProcessor(pcl::PointCloud<pcl::PointXYZ>::Ptr input);

    /// @brief Default deconstructor.
    ~CloudProcessor();

    /// @brief Downsamples given pointcloud to speed up plane extraction.
    /// @param leafSize determines how much to downsample, the bigger the more values are discarded.
    void downsample(float leafSize);

    /// @brief Filters the pointcloud on a given axis with min and max values. 
    /// @param axis axis for min/max values.
    /// @param min minimal allowed value.
    /// @param max maximal allowed value.
    void filter(std::string axis, float min, float max);

    /// @brief Extracts edges from pointcloud.
    /// @param z_division_size height of z division cell size.
    /// @param angle_divisions number of subspaces in angle direction.
    /// @return vector of edges as lines.
    std::vector<line_extraction::Line> extractEdges(double z_division_size, int angle_divisions);

    /// @brief Sets parameters of x and y offset for initializing azimuth array correctly.
    /// @param x_offset offset in x direction.
    /// @param y_offset offset in y direction.
    /// @param params parameters for line extraction.
    void setParams(double x_offset, double y_offset, line_extraction::Params params);

    /// @brief Returns the pointclouds at different filtering stages.
    /// @return vector of ROS PointCloud2 msg.
    std::vector<sensor_msgs::PointCloud2> getPointCloud2Msgs();

    /// @brief Builds ROS MarkerArray for visualization of steps.
    /// @return ROS MarkerArray of steps.
    visualization_msgs::MarkerArray getMarkerArray();

    /// @brief Builds ROS MarkerArray for visualization of lines.
    /// @return ROS MarkerArray of lines.
    visualization_msgs::MarkerArray getLinesMarker();

    /// @brief Builds ROS MarkerArray for starting positions of stairs.
    /// @return ROS MarkerArray of starting positions.
    visualization_msgs::MarkerArray getStairsStartMarkers();

    /// @brief Returns ROS pose right before staircase.
    /// @return ROS pose.
    geometry_msgs::PoseStamped getStaircasePose();
};
