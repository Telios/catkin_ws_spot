;; Auto-generated. Do not edit!


(when (boundp 'stairdetection::StaircaseArray)
  (if (not (find-package "STAIRDETECTION"))
    (make-package "STAIRDETECTION"))
  (shadow 'StaircaseArray (find-package "STAIRDETECTION")))
(unless (find-package "STAIRDETECTION::STAIRCASEARRAY")
  (make-package "STAIRDETECTION::STAIRCASEARRAY"))

(in-package "ROS")
;;//! \htmlinclude StaircaseArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass stairdetection::StaircaseArray
  :super ros::object
  :slots (_header _staircases ))

(defmethod stairdetection::StaircaseArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:staircases __staircases) (let (r) (dotimes (i 0) (push (instance stairdetection::Staircase :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _staircases __staircases)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:staircases
   (&rest __staircases)
   (if (keywordp (car __staircases))
       (send* _staircases __staircases)
     (progn
       (if __staircases (setq _staircases (car __staircases)))
       _staircases)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; stairdetection/Staircase[] _staircases
    (apply #'+ (send-all _staircases :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; stairdetection/Staircase[] _staircases
     (write-long (length _staircases) s)
     (dolist (elem _staircases)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; stairdetection/Staircase[] _staircases
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _staircases (let (r) (dotimes (i n) (push (instance stairdetection::Staircase :init) r)) r))
     (dolist (elem- _staircases)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get stairdetection::StaircaseArray :md5sum-) "f9e6db9a4c0a52ac0899470f521a12d7")
(setf (get stairdetection::StaircaseArray :datatype-) "stairdetection/StaircaseArray")
(setf (get stairdetection::StaircaseArray :definition-)
      "Header header
Staircase[] staircases
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: stairdetection/Staircase
uint8 ASCENDING=0
uint8 DESCENDING=1

int32 type
int32 id
float32 width
float32 height
float32 depth
int32 nr_steps
geometry_msgs/Pose start_pose
geometry_msgs/Vector3 going_vector

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :stairdetection/StaircaseArray "f9e6db9a4c0a52ac0899470f521a12d7")


