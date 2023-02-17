#include "staircase.h"

StaircaseType type;
Staircase::Staircase(double height, double width, double depth)
{
    this->height = height;
    this->width = width;
    this->depth = depth;
}

Staircase::Staircase()
{
}

void Staircase::addLine(line_extraction::Line line)
{
    steps.push_back(line);
}

line_extraction::Line Staircase::getLastStep()
{
    return steps.back();
}

int Staircase::getNrSteps()
{
    return steps.size();
}

void Staircase::setType(StaircaseType type)
{
    this->type = type;
}

std::vector<line_extraction::Line> Staircase::getSteps()
{
    return this->steps;
}

StaircaseType Staircase::getType()
{
    return this->type;
}

void Staircase::setSteps(std::vector<line_extraction::Line> steps)
{
    this->steps = steps;
}

void Staircase::estimateDimensions()
{
    // sort steps by z value ascending if type ascending else descending
    type == StaircaseType::ASCENDING ? 
        std::sort(steps.begin(), steps.end(), [](line_extraction::Line a, line_extraction::Line b) { return a.getAverageZ() < b.getAverageZ(); }) :
        std::sort(steps.begin(), steps.end(), [](line_extraction::Line a, line_extraction::Line b) { return a.getAverageZ() > b.getAverageZ(); });
    double height_sum = 0;
    for (int i = 0; i < steps.size() - 1; i++)
    {
        line_extraction::Line line1 = steps[i];
        line_extraction::Line line2 = steps[i + 1];
        height_sum += abs(line1.getAverageZ() - line2.getAverageZ());
    }
    height = height_sum / (steps.size() - 1);

    double depth_sum = 0;
    for (int i = 0; i < steps.size() - 1; i++)
    {
        line_extraction::Line line1 = steps[i];
        line_extraction::Line line2 = steps[i + 1];
        depth_sum += stair_detection::xy_dist(line1.getMiddlePoint()[0], line1.getMiddlePoint()[1], line2.getMiddlePoint()[0], line2.getMiddlePoint()[1]);
    }
    depth = depth_sum / steps.size();
   
    double width_sum = 0;
    for (int i = 0; i < steps.size(); i++)
    {
        line_extraction::Line line = steps[i];
        width_sum += line.length();
    }
    width = width_sum / steps.size();
    calcGoingVector();
    calcStartingPose();
}

void Staircase::calcGoingVector()
{
    line_extraction::Line line1 = steps[0];
    line_extraction::Line line2 = steps[1];
    going_vector = line2.getMiddlePoint() - line1.getMiddlePoint();
}

void Staircase::calcStartingPose()
{
    line_extraction::Line step = steps[0];
    Eigen::Vector2f mid_point = step.getMiddlePoint();
    Eigen::Vector2f step_vector = Eigen::Vector2f(step.getEnd()[0] - step.getStart()[0], step.getEnd()[1] - step.getStart()[1]);
    Eigen::Vector2f normal_vector = Eigen::Vector2f(-step_vector[1], step_vector[0]);
    normal_vector.normalize();
    int stairs_missing = 0;
    if (type == StaircaseType::ASCENDING)
    {
        float curr_height = step.getAverageZ();
        while (curr_height > 0.05 + height)
        {
            curr_height -= height;
            stairs_missing++;
        }
    }
    else
    {
        float curr_height = step.getAverageZ();
        while (curr_height < -0.06)
        {
            curr_height += height;
            stairs_missing++;
        }
    }
    starting_pose.position.x = mid_point[0] + normal_vector[0] * depth * (1 + stairs_missing) + normal_vector[0];
    starting_pose.position.y = mid_point[1] + normal_vector[1] * depth * (1 + stairs_missing) + normal_vector[1];
    starting_pose.position.z = type == StaircaseType::ASCENDING ? step.getAverageZ() - (height * (1 + stairs_missing)) :
                                                                  step.getAverageZ() + (height * (stairs_missing));

    tf2::Quaternion q;
    q.setRPY(0, 0, atan2(mid_point[1] - starting_pose.position.y, mid_point[0] - starting_pose.position.x));
    q.normalize();
    tf2::convert(q, starting_pose.orientation);
}

geometry_msgs::Pose Staircase::getStartingPose()
{
    return starting_pose;
}

std::vector<visualization_msgs::Marker> Staircase::getMarkerVector()
{
    bool ascending = type == StaircaseType::ASCENDING;
    std::vector<visualization_msgs::Marker> marker_vector;
    for (int i = 0; i < steps.size(); i++)
    {
        line_extraction::Line line = steps[i];
        visualization_msgs::Marker marker;
        marker.header.frame_id = "map";
        marker.header.stamp = ros::Time();
        marker.ns = "staircase";
        marker.id = 0;
        marker.type = visualization_msgs::Marker::CUBE;
        marker.action = visualization_msgs::Marker::ADD;
        marker.pose.position.x = line.getMiddlePoint()[0] + (ascending ? going_vector[0] * 0.5 : -going_vector[0] * 0.5);
        marker.pose.position.y = line.getMiddlePoint()[1] + (ascending ? going_vector[1] * 0.5 : -going_vector[1] * 0.5);
        marker.pose.position.z = line.getAverageZ() - 0.5 * height;

        tf2::Quaternion q;
        q.setRPY(0, 0, line.getAngle() + M_PI / 2);
        q.normalize();
        tf2::convert(q, marker.pose.orientation);
        marker.scale.x = width;
        marker.scale.y = depth;
        marker.scale.z = height;

        marker.color.r = this->type == StaircaseType::ASCENDING ? 0.5 : 0.2;
        marker.color.g = this->type == StaircaseType::ASCENDING ? 0.0 : 0.6;
        marker.color.b = this->type == StaircaseType::ASCENDING ? 0.5 : 0.8;
        marker.color.a = 1.0;
        marker.lifetime = ros::Duration(0.5);

        marker_vector.push_back(marker);
    }
    return marker_vector;
}

stairdetection::Staircase Staircase::getStaircaseMsg()
{
    stairdetection::Staircase msg;
    msg.type = type == StaircaseType::ASCENDING ? 0 : 1;
    msg.width = width;
    msg.height = height;
    msg.depth = depth;
    msg.nr_steps = steps.size();
    msg.start_pose = starting_pose;
    msg.going_vector.x = going_vector[0];
    msg.going_vector.y = going_vector[1];
    return msg;
}
