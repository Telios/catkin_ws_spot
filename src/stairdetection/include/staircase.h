#include "line.h"
#include <visualization_msgs/MarkerArray.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <Eigen/Core>
#include "stairdetection/StaircaseArray.h"

enum class StaircaseType
{
    ASCENDING,
    DESCENDING
};

class Staircase

{
private:
    /// @brief Average height of the steps of the staircase.
    double height;

    /// @brief Average width of the steps of the staircase.
    double width;

    /// @brief Average depth of the steps of the staircase.
    double depth;

    /// @brief Steps of the staircase.
    std::vector<line_extraction::Line> steps;
    
    /// @brief Type of the staircase.
    StaircaseType type;

    /// @brief The going vector of the staircase. 
    /// Points upwards for ascending staircases and downwards for descending staircases.
    Eigen::Vector2f going_vector;

    /// @brief The starting pose of the staircase.
    geometry_msgs::Pose starting_pose;

    /// @brief Calculates the going vector of the staircase.
    void calcGoingVector();

    /// @brief Calculates the starting pose of the staircase.
    void calcStartingPose();
public:
    /// @brief Default constructor.
    Staircase();

    /// @brief Constructor.
    /// @param height Average height of the steps of the staircase.
    /// @param width Average width of the steps of the staircase.
    /// @param depth Average depth of the steps of the staircase.
    Staircase(double height, double width, double depth);

    /// @brief Add a step to the staircase.
    /// @param line The step to add.
    void addLine(line_extraction::Line line);

    /// @brief Estimates the dimensions of the staircase.
    void estimateDimensions();

    /// @brief Returns the last step of the staircase. If ascending, the last step is the top step. 
    /// If descending, the last step is the bottom step.
    line_extraction::Line getLastStep();

    /// @brief Returns the number of steps of the staircase.
    /// @return number of steps of the staircase.
    int getNrSteps();

    /// @brief Sets the type of the staircase.
    /// @param type to set.
    void setType(StaircaseType type);

    /// @brief Sets the steps of the staircase.
    /// @param steps to set.
    void setSteps(std::vector<line_extraction::Line> steps);

    /// @brief Returns the type of the staircase.
    /// @return type of the staircase.
    StaircaseType getType();

    /// @brief Returns the MarkerArray of the staircase. (steps illustrated quads)
    /// @return the MarkerArray of the staircase.
    std::vector<visualization_msgs::Marker> getMarkerVector();

    /// @brief Returns the steps of the staircase.
    /// @return the steps of the staircase.
    std::vector<line_extraction::Line> getSteps();

    /// @brief Returns the starting pose of the staircase.
    /// @return Pose of the staircase.
    geometry_msgs::Pose getStartingPose();

    /// @brief Returns the staircase as a ROS message.
    /// @return ROS message of the staircase.
    stairdetection::Staircase getStaircaseMsg();
};
