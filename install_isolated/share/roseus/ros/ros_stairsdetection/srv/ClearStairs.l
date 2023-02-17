;; Auto-generated. Do not edit!


(when (boundp 'ros_stairsdetection::ClearStairs)
  (if (not (find-package "ROS_STAIRSDETECTION"))
    (make-package "ROS_STAIRSDETECTION"))
  (shadow 'ClearStairs (find-package "ROS_STAIRSDETECTION")))
(unless (find-package "ROS_STAIRSDETECTION::CLEARSTAIRS")
  (make-package "ROS_STAIRSDETECTION::CLEARSTAIRS"))
(unless (find-package "ROS_STAIRSDETECTION::CLEARSTAIRSREQUEST")
  (make-package "ROS_STAIRSDETECTION::CLEARSTAIRSREQUEST"))
(unless (find-package "ROS_STAIRSDETECTION::CLEARSTAIRSRESPONSE")
  (make-package "ROS_STAIRSDETECTION::CLEARSTAIRSRESPONSE"))

(in-package "ROS")





(defclass ros_stairsdetection::ClearStairsRequest
  :super ros::object
  :slots ())

(defmethod ros_stairsdetection::ClearStairsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ros_stairsdetection::ClearStairsResponse
  :super ros::object
  :slots ())

(defmethod ros_stairsdetection::ClearStairsResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass ros_stairsdetection::ClearStairs
  :super ros::object
  :slots ())

(setf (get ros_stairsdetection::ClearStairs :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_stairsdetection::ClearStairs :datatype-) "ros_stairsdetection/ClearStairs")
(setf (get ros_stairsdetection::ClearStairs :request) ros_stairsdetection::ClearStairsRequest)
(setf (get ros_stairsdetection::ClearStairs :response) ros_stairsdetection::ClearStairsResponse)

(defmethod ros_stairsdetection::ClearStairsRequest
  (:response () (instance ros_stairsdetection::ClearStairsResponse :init)))

(setf (get ros_stairsdetection::ClearStairsRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_stairsdetection::ClearStairsRequest :datatype-) "ros_stairsdetection/ClearStairsRequest")
(setf (get ros_stairsdetection::ClearStairsRequest :definition-)
      "---
")

(setf (get ros_stairsdetection::ClearStairsResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get ros_stairsdetection::ClearStairsResponse :datatype-) "ros_stairsdetection/ClearStairsResponse")
(setf (get ros_stairsdetection::ClearStairsResponse :definition-)
      "---
")



(provide :ros_stairsdetection/ClearStairs "d41d8cd98f00b204e9800998ecf8427e")


