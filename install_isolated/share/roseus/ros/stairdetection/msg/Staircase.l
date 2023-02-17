;; Auto-generated. Do not edit!


(when (boundp 'stairdetection::Staircase)
  (if (not (find-package "STAIRDETECTION"))
    (make-package "STAIRDETECTION"))
  (shadow 'Staircase (find-package "STAIRDETECTION")))
(unless (find-package "STAIRDETECTION::STAIRCASE")
  (make-package "STAIRDETECTION::STAIRCASE"))

(in-package "ROS")
;;//! \htmlinclude Staircase.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*ASCENDING*" (find-package "STAIRDETECTION::STAIRCASE"))
(shadow '*ASCENDING* (find-package "STAIRDETECTION::STAIRCASE"))
(defconstant stairdetection::Staircase::*ASCENDING* 0)
(intern "*DESCENDING*" (find-package "STAIRDETECTION::STAIRCASE"))
(shadow '*DESCENDING* (find-package "STAIRDETECTION::STAIRCASE"))
(defconstant stairdetection::Staircase::*DESCENDING* 1)
(defclass stairdetection::Staircase
  :super ros::object
  :slots (_type _id _width _height _depth _nr_steps _start_pose _going_vector ))

(defmethod stairdetection::Staircase
  (:init
   (&key
    ((:type __type) 0)
    ((:id __id) 0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:depth __depth) 0.0)
    ((:nr_steps __nr_steps) 0)
    ((:start_pose __start_pose) (instance geometry_msgs::Pose :init))
    ((:going_vector __going_vector) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _id (round __id))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _depth (float __depth))
   (setq _nr_steps (round __nr_steps))
   (setq _start_pose __start_pose)
   (setq _going_vector __going_vector)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:nr_steps
   (&optional __nr_steps)
   (if __nr_steps (setq _nr_steps __nr_steps)) _nr_steps)
  (:start_pose
   (&rest __start_pose)
   (if (keywordp (car __start_pose))
       (send* _start_pose __start_pose)
     (progn
       (if __start_pose (setq _start_pose (car __start_pose)))
       _start_pose)))
  (:going_vector
   (&rest __going_vector)
   (if (keywordp (car __going_vector))
       (send* _going_vector __going_vector)
     (progn
       (if __going_vector (setq _going_vector (car __going_vector)))
       _going_vector)))
  (:serialization-length
   ()
   (+
    ;; int32 _type
    4
    ;; int32 _id
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; float32 _depth
    4
    ;; int32 _nr_steps
    4
    ;; geometry_msgs/Pose _start_pose
    (send _start_pose :serialization-length)
    ;; geometry_msgs/Vector3 _going_vector
    (send _going_vector :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _type
       (write-long _type s)
     ;; int32 _id
       (write-long _id s)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _nr_steps
       (write-long _nr_steps s)
     ;; geometry_msgs/Pose _start_pose
       (send _start_pose :serialize s)
     ;; geometry_msgs/Vector3 _going_vector
       (send _going_vector :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _nr_steps
     (setq _nr_steps (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Pose _start_pose
     (send _start_pose :deserialize buf ptr-) (incf ptr- (send _start_pose :serialization-length))
   ;; geometry_msgs/Vector3 _going_vector
     (send _going_vector :deserialize buf ptr-) (incf ptr- (send _going_vector :serialization-length))
   ;;
   self)
  )

(setf (get stairdetection::Staircase :md5sum-) "328f707a0f226253d43b60994d17c07a")
(setf (get stairdetection::Staircase :datatype-) "stairdetection/Staircase")
(setf (get stairdetection::Staircase :definition-)
      "uint8 ASCENDING=0
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



(provide :stairdetection/Staircase "328f707a0f226253d43b60994d17c07a")


