#ifndef LINE_EXTRACTION_LINE_H
#define LINE_EXTRACTION_LINE_H

#include <vector>
#include <boost/array.hpp>
#include <pcl/point_types.h>
#include "utilities.h"
#include "visualization_msgs/Marker.h"
#include "Eigen/Core"

namespace line_extraction
{

class Line
{

public:
  // Constructor / destructor
  Line(const CachedData&, const RangeData&, const Params&, std::vector<unsigned int>);
  Line(double angle, double radius, const boost::array<double, 4> &covariance,
       const boost::array<double, 2> &start, const boost::array<double, 2> &end,
       const std::vector<unsigned int> &indices);
  ~Line();
  // Get methods for the line parameters
  double                           getAngle() const;
  const boost::array<double, 4>&   getCovariance() const;
  const boost::array<double, 2>&   getEnd() const;
  const std::vector<unsigned int>& getIndices() const;
  double                           getRadius() const;
  const boost::array<double, 2>&   getStart() const;
  // Methods for line fitting
  double       distToPoint(unsigned int);
  void         endpointFit();
  void         leastSqFit();
  double       length() const;
  unsigned int numPoints() const;
  void         projectEndpoints();
  void         setPoints(const std::vector<pcl::PointXYZ>& points);
  void setStart(double x, double y);
  void setEnd(double x, double y);

  /// @brief Returns the vector from the middle point to the end point.
  /// @return Eigen::Vector2f from mid to end point.
  Eigen::Vector2f getMidToEndVec();
  
  /// @brief Get the average z value of the points in the line
  /// @return The average z value of the points in the line
  double       getAverageZ();

  /// @brief Calculate the average z value of the points in the line
  void         calcAverageZ();

  /// @brief Set the average z value of the points in the line
  void         setAverageZ(double average_z);

  /// @brief Get the marker for visualizing the line
  visualization_msgs::Marker getMarker();

  /// @brief Get the middle point of the line
  /// @return The middle point of the line
  Eigen::Vector2f getMiddlePoint();

private:
  std::vector<unsigned int> indices_;
  std::vector<pcl::PointXYZ> points;
  // Data structures
  CachedData c_data_;
  RangeData r_data_;
  Params params_;
  PointParams p_params_;
  double average_z;
  // Point variances used for least squares
  std::vector<double> point_scalar_vars_;
  std::vector<boost::array<double, 4> > point_covs_;
  double p_rr_;
  // Line parameters
  double angle_;
  double radius_;
  boost::array<double, 2> start_;
  boost::array<double, 2> end_;
  boost::array<double, 4> covariance_;
  // Methods
  void    angleFromEndpoints();
  void    angleFromLeastSq();
  double  angleIncrement();
  void    calcCovariance();
  void    calcPointCovariances();
  void    calcPointParameters();
  void    calcPointScalarCovariances();
  void    radiusFromEndpoints();
  void    radiusFromLeastSq();
  void    calcDataFromPoints();
}; // class Line

} // namespace line_extraction

#endif
