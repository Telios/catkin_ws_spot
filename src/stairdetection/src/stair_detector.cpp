#include "stair_detector.h"

StairDetector::StairDetector(std::vector<Line> lines, std::vector<Staircase>* staircases)
{
    this->staircases = staircases;
    if (lines.size() < 1) return;
    // subdivide lines into above, ground and below depending on z value of line
    for (std::size_t i = 0; i < lines.size(); i++)
    {
        Line line = lines[i];
        if (line.getAverageZ() > 0.05)
        {
            above_lines.push_back(line);
        }
        else if (line.getAverageZ() < -0.05)
        {
            below_lines.push_back(line);
        }
        else
        {
            ground_lines.push_back(line);
        }
    }
}

StairDetector::~StairDetector()
{
}

void StairDetector::detectStairs()
{
    detectStairs(StaircaseType::ASCENDING);
    detectStairs(StaircaseType::DESCENDING);
}

void StairDetector::detectStairs(StaircaseType type)
{
    std::vector<Line> filtered_lines;
    bool ascending = type == StaircaseType::ASCENDING;
    ascending ? filtered_lines = above_lines : filtered_lines = below_lines;
    if (filtered_lines.size() < 2) return;
    std::vector<Line> starting_lines;
    // sort lines by z distance ascending or descending depending on staircase type
    ascending ? std::sort(filtered_lines.begin(), filtered_lines.end(), [](Line line1, Line line2) { return line1.getAverageZ() < line2.getAverageZ(); }) :
                std::sort(filtered_lines.begin(), filtered_lines.end(), [](Line line1, Line line2) { return line1.getAverageZ() > line2.getAverageZ(); });
    // filter out lines that are less or equal to 2.5 * max_height
    for (std::size_t i = 0; i < filtered_lines.size(); i++)
    {
        Line line = filtered_lines[i];
        if (ascending && line.getAverageZ() <= 2.5 * params.max_height)
        {
            starting_lines.push_back(line);
        }
        else if (!ascending && line.getAverageZ() >= -4 * params.max_height)
        {
            starting_lines.push_back(line);
        }
    }
    int lines_left = starting_lines.size();
    std::vector<int> init_indices;
    // find init steps
    while (lines_left > 2)
    {
        Staircase staircase;
        bool found_starting_step = false;
        // choose all possible combinations of 2 lines
        for (std::size_t i = 0; i < starting_lines.size(); i++)
        {
            if (found_starting_step) break;
            if (std::find(init_indices.begin(), init_indices.end(), i) != init_indices.end()) continue;
            Line line1 = starting_lines[i];
            for (std::size_t j = 0; j < starting_lines.size(); j++)
            {
                if (i == j || std::find(init_indices.begin(), init_indices.end(), j) != init_indices.end()) continue;
                Line line2 = starting_lines[j];
                double height = abs(line1.getAverageZ() - line2.getAverageZ()); 
                double depth = stair_detection::xy_dist(line1.getMiddlePoint()[0], line1.getMiddlePoint()[1], line2.getMiddlePoint()[0], line2.getMiddlePoint()[1]);
                double slope = atan(height / depth) * 180 / M_PI;
                double orientation_diff = abs(line1.getAngle() - line2.getAngle());
                Eigen::Vector2f midToEndVec = line1.getMidToEndVec();
                Eigen::Vector2f mid1ToMid2 = line2.getMiddlePoint() - line1.getMiddlePoint();
                double offsetAngle = this->calcAngleBetween(midToEndVec, mid1ToMid2);
                if (height >= params.min_height && height <= params.max_height && depth >= params.min_depth 
                && depth <= params.max_depth && slope >= params.min_slope && slope <= params.max_slope 
                && orientation_diff <= params.max_orientation_diff && offsetAngle <= params.max_offset_angle && offsetAngle >= params.min_offset_angle)
                {
                    staircase.addLine(line1);
                    staircase.addLine(line2);
                    init_indices.push_back(i);
                    init_indices.push_back(j);
                    found_starting_step = true;
                    break;
                }
            }
        }
        // extension
        if (!found_starting_step) return;
        for (std::size_t i = 0; i < filtered_lines.size(); i++)
        {
            Line prev_line = staircase.getLastStep();
            Line curr_line = filtered_lines[i];
            if ((ascending && curr_line.getAverageZ() <= prev_line.getAverageZ()) 
            || (!ascending && curr_line.getAverageZ() >= prev_line.getAverageZ())) continue;
            double height = abs(prev_line.getAverageZ() - curr_line.getAverageZ());
            double depth = stair_detection::xy_dist(prev_line.getMiddlePoint()[0], prev_line.getMiddlePoint()[1], curr_line.getMiddlePoint()[0], curr_line.getMiddlePoint()[1]);
            double slope = atan(height / depth) * 180 / M_PI;
            double orientation_diff = abs(prev_line.getAngle() - curr_line.getAngle());
            Eigen::Vector2f midToEndVec = curr_line.getMidToEndVec();
            Eigen::Vector2f mid1ToMid2 = prev_line.getMiddlePoint() - curr_line.getMiddlePoint();
            double offsetAngle = this->calcAngleBetween(midToEndVec, mid1ToMid2);
            if (height >= params.min_height && height <= params.max_height && depth >= params.min_depth && depth <= params.max_depth 
            && slope >= params.min_slope && slope <= params.max_slope && orientation_diff <= params.max_orientation_diff  
            && offsetAngle <= params.max_offset_angle && offsetAngle >= params.min_offset_angle)
            {
                staircase.addLine(curr_line);
            }
        }
        if (staircase.getNrSteps() >= params.nr_steps)
        {
            staircase.setType(type);
            staircase.estimateDimensions();
            bool merged = false;
            if (staircases->size() > 0) merged = mergeStaircase(staircase);
            if (!merged && distinct(staircase)) staircases->push_back(staircase);
            return;
        }
        else
        {
            lines_left -= 2;
        }
    }
}

bool StairDetector::distinct(Staircase staircase)
{
    for (std::size_t i = 0; i < staircases->size(); i++)
    {
        Staircase current_staircase = (*staircases)[i];
        if (staircase.getType() != current_staircase.getType()) continue;
        geometry_msgs::Pose current_pose = current_staircase.getStartingPose();
        geometry_msgs::Pose incoming_pose = staircase.getStartingPose();
        if (abs(hypot(current_pose.position.x, current_pose.position.y) - 
                hypot(incoming_pose.position.x, incoming_pose.position.y)) < 1.0) return false;
    }
    return true;
}

bool StairDetector::mergeStaircase(Staircase staircase)
{
    std::vector<Line> incoming_steps = staircase.getSteps();
    for (std::size_t i = 0; i < staircases->size(); i++)
    {
        Staircase merge_staircase = (*staircases)[i];
        std::vector<Line> current_steps = merge_staircase.getSteps();
        if (staircase.getType() != merge_staircase.getType()) continue;
        for (std::size_t k = 0; k < current_steps.size(); k++)
        {
            Line step1 = current_steps[k];
            for (std::size_t l = 0; l < incoming_steps.size(); l++)
            {
                Line step2 = incoming_steps[l];
                double height_diff = abs(step1.getAverageZ() - step2.getAverageZ());
                double depth_diff = stair_detection::xy_dist(step1.getMiddlePoint()[0], step1.getMiddlePoint()[1], step2.getMiddlePoint()[0], step2.getMiddlePoint()[1]);
                double orientation_diff = abs(step1.getAngle() - step2.getAngle());
                if (height_diff <= 0.05 && depth_diff <= 0.05 && orientation_diff <= 10)
                {
                    std::vector<Line> merging_steps = {current_steps.begin() + k, current_steps.end()};
                    std::vector<Line> new_steps = {incoming_steps.begin() + l, incoming_steps.end()};
                    std::vector<Line> merged_steps;
                    if (new_steps.size() > merging_steps.size()) merged_steps = LineExtraction::mergeLines(new_steps, merging_steps);
                    else merged_steps = LineExtraction::mergeLines(merging_steps, new_steps);

                    if (k < l) merged_steps.insert(merged_steps.begin(), incoming_steps.begin(), incoming_steps.begin() + l);
                    else merged_steps.insert(merged_steps.begin(), current_steps.begin(), current_steps.begin() + k);
                    
                    (*staircases)[i].setSteps(merged_steps);
                    (*staircases)[i].estimateDimensions();
                    std::cout << "Merged staircase now has " << (*staircases)[i].getNrSteps() << " steps" << std::endl;
                    return true;
                }
            }
        }
    }
    return false;    
}

visualization_msgs::MarkerArray StairDetector::getMarkerArray()
{
    if (staircases->size() < 1) return visualization_msgs::MarkerArray();
    std::vector<visualization_msgs::Marker> marker_vector;
    for (std::size_t i = 0; i < staircases->size(); i++)
    {
        Staircase staircase = staircases->at(i);
        std::vector<visualization_msgs::Marker> markers = staircase.getMarkerVector();
        marker_vector.insert(marker_vector.end(), markers.begin(), markers.end());
    }
    visualization_msgs::MarkerArray marker_array;
    for (std::size_t i = 0; i < marker_vector.size(); i++)
    {
        visualization_msgs::Marker marker = marker_vector[i];
        marker.id = i;
        marker_array.markers.push_back(marker);
    }
    return marker_array;
}

geometry_msgs::PoseArray StairDetector::getStartingPoses()
{
    geometry_msgs::PoseArray poses;
    poses.header.frame_id = "map";
    poses.header.stamp = ros::Time::now();
    for (std::size_t i = 0; i < staircases->size(); i++)
    {
        poses.poses.push_back(staircases->at(i).getStartingPose());
    }
    return poses;
}

double StairDetector::calcAngleBetween(Eigen::Vector2f a, Eigen::Vector2f b)
{
    return acos(a.dot(b) / (a.norm() * b.norm())) * 180 / M_PI;
}

int StairDetector::getNrStaircases()
{
    return staircases->size();
}

std::vector<Staircase> StairDetector::getStaircases()
{
    return *staircases;
}

stairdetection::StaircaseArray StairDetector::getStaircaseArray()
{
    stairdetection::StaircaseArray staircase_array;
    for (std::size_t i = 0; i < staircases->size(); i++)
    {
        stairdetection::Staircase staircase_msg = staircases->at(i).getStaircaseMsg();
        staircase_msg.id = i;
        staircase_array.header.frame_id = "map";
        staircase_array.header.stamp = ros::Time::now();
        staircase_array.staircases.push_back(staircase_msg);
    }
    return staircase_array;
}

void StairDetector::setParams(stair_detection::Params params)
{
    this->params = params;
}

