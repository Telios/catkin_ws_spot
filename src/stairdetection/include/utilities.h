#ifndef LINE_EXTRACTION_UTILITIES_H
#define LINE_EXTRACTION_UTILITIES_H

#include <vector>
#include <cmath>

namespace line_extraction
{

struct CachedData
{
  std::vector<unsigned int> indices;
  std::vector<double> bearings;
  std::vector<double> cos_bearings;
  std::vector<double> sin_bearings;
};

struct RangeData
{
  std::vector<double> ranges;
  std::vector<double> xs;
  std::vector<double> ys;
  std::vector<double> zs;
};

struct Params
{
  double bearing_var = 0.001 * 0.001;
  double range_var = 0.02 * 0.02;
  double least_sq_angle_thresh = 1e-4;
  double least_sq_radius_thresh = 1e-4;
  double max_line_gap = 0.3;
  double min_line_length = 0.6;
  double min_range = 0.4;
  double max_range = 9999;
  double min_split_dist = 0.05;
  double outlier_dist = 0.05;
  unsigned int min_line_points = 7;
};

struct PointParams
{
  std::vector<double> a;
  std::vector<double> ap;
  std::vector<double> app;
  std::vector<double> b;
  std::vector<double> bp;
  std::vector<double> bpp;
  std::vector<double> c;
  std::vector<double> s;
};

// Inlining this function will be faster
// and also get rid of multiple definitions
// error
inline double pi_to_pi(double angle)
{
  angle = fmod(angle, 2 * M_PI);
  if (angle >= M_PI)
    angle -= 2 * M_PI;
  return angle;
}

} // namespace line_extraction

namespace stair_detection
{
struct Params
{
  double min_height = 0.11;
  double max_height = 0.3;
  double min_depth = 0.15;
  double max_depth = 0.45;
  double min_slope = 25.0;
  double max_slope = 60.0;
  double max_orientation_diff = 10.0;
  double min_offset_angle = 60;
  double max_offset_angle = 120;
  int nr_steps = 3;
};

inline double xy_dist(double x1, double y1, double x2, double y2)
{
  return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
};

}
#endif
