#include "line.h"
#include "utilities.h"
#include "staircase.h"
#include <geometry_msgs/PoseArray.h>
#include "line_extraction.h"
#include <chrono>

using namespace line_extraction;
class StairDetector
{
private:
    /// @brief lines above the ground.
    std::vector<Line> above_lines;

    /// @brief lines below the ground.
    std::vector<Line> ground_lines;

    /// @brief lines below the ground.
    std::vector<Line> below_lines;

    /// @brief Current detected staircases.
    std::vector<Staircase>* staircases;

    /// @brief Parameters for the stair detection.
    stair_detection::Params params;

    /// @brief Sets the type of the staircase.
    /// @param type Type of the staircase
    void detectStairs(StaircaseType type);

    /// @brief Tries to merge the new incoming staircase with the existing staircases.
    /// @param staircase incoming Staircase to be merged
    bool mergeStaircase(Staircase staircase);

    /// @brief Returns angle between two vectors in degrees.
    /// @param a vector 1
    /// @param b vector 2
    /// @return angle between the vectors in degrees.
    double calcAngleBetween(Eigen::Vector2f a, Eigen::Vector2f b);

    /// @brief Returns true if the given staircase is distinct from the existing staircases.
    /// @param staircase Staircase to check if distinct.
    /// @return true if the staircase is distinct.
    bool distinct(Staircase staircase);

public:
    /// @brief Constructor.
    /// @param lines Lines to be used for stair detection
    /// @param staircases Current detected staircases
    StairDetector(std::vector<Line> lines, std::vector<Staircase>* staircases);
    
    /// @brief Destructor.
    ~StairDetector();

    /// @brief Detects the staircases with the given lines.
    void detectStairs();

    /// @brief Returns the marker array for the detected staircases.
    /// @return Marker array for the detected staircases
    visualization_msgs::MarkerArray getMarkerArray();

    /// @brief Returns the number of detected staircases.
    /// @return number of detected staircases
    int getNrStaircases();

    /// @brief Returns the detected staircases.
    /// @return detected staircases
    std::vector<Staircase> getStaircases();

    /// @brief Returns the starting poses for the detected staircases.
    /// @return starting poses for the detected staircases
    geometry_msgs::PoseArray getStartingPoses();

    /// @brief Returns the staircase ROS msg array for the detected staircases.
    /// @return staircase ROS msg array for the detected staircases
    stairdetection::StaircaseArray getStaircaseArray();

    /// @brief Sets the parameters for the stair detection.
    /// @param params Parameters for the stair detection.
    void setParams(stair_detection::Params params);
};