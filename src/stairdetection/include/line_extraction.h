#ifndef LINE_EXTRACTION_H
#define LINE_EXTRACTION_H

#include <cmath>
#include <vector>
#include <boost/array.hpp>
#include <Eigen/Dense>
#include "utilities.h"
#include "line.h"

namespace line_extraction
{

class LineExtraction
{

public:
  // Constructor / destructor
  LineExtraction();
  ~LineExtraction();
  // Run
  void extractLines(std::vector<Line>&);
  // Data setting
  void setCachedData(const std::vector<double>&, const std::vector<double>&,
                     const std::vector<double>&, const std::vector<unsigned int>&);
  void setRangeData(const std::vector<double>&);
  // Parameter setting
  void setBearingVariance(double);
  void setRangeVariance(double);
  void setLeastSqAngleThresh(double);
  void setLeastSqRadiusThresh(double);
  void setMaxLineGap(double);
  void setMinLineLength(double);
  void setMinLinePoints(unsigned int);
  void setMinRange(double);
  void setMaxRange(double);
  void setMinSplitDist(double);
  void setOutlierDist(double);
  void setPoints(const std::vector<pcl::PointXYZ>& points);
  void calcDataFromPoints();
  static std::vector<Line> mergeLines(std::vector<Line> linesA, std::vector<Line> linesB);
  void setParams(line_extraction::Params params);
  
private:
  // Data structures
  CachedData c_data_;
  RangeData r_data_;
  Params params_;
  double average_z;
  // Indices after filtering
  std::vector<unsigned int> filtered_indices_;
  std::vector<pcl::PointXYZ> points;
  // Line data
  std::vector<Line> lines_;
  // Methods
  static double chiSquaredStatic(const Eigen::Vector2d&, const Eigen::Matrix2d&,
                    const Eigen::Matrix2d&);
  double chiSquared(const Eigen::Vector2d&, const Eigen::Matrix2d&,
                    const Eigen::Matrix2d&);
  double distBetweenPoints(unsigned int index_1, unsigned int index_2);
  void   filterCloseAndFarPoints();
  void   filterOutlierPoints();
  void   filterLines();
  void   mergeLines();
  void   split(const std::vector<unsigned int>&);
};

} // namespace line_extraction

#endif
