;; Auto-generated. Do not edit!


(when (boundp 'ros_stairsdetection::ExportStairs)
  (if (not (find-package "ROS_STAIRSDETECTION"))
    (make-package "ROS_STAIRSDETECTION"))
  (shadow 'ExportStairs (find-package "ROS_STAIRSDETECTION")))
(unless (find-package "ROS_STAIRSDETECTION::EXPORTSTAIRS")
  (make-package "ROS_STAIRSDETECTION::EXPORTSTAIRS"))
(unless (find-package "ROS_STAIRSDETECTION::EXPORTSTAIRSREQUEST")
  (make-package "ROS_STAIRSDETECTION::EXPORTSTAIRSREQUEST"))
(unless (find-package "ROS_STAIRSDETECTION::EXPORTSTAIRSRESPONSE")
  (make-package "ROS_STAIRSDETECTION::EXPORTSTAIRSRESPONSE"))

(in-package "ROS")





(defclass ros_stairsdetection::ExportStairsRequest
  :super ros::object
  :slots (_path ))

(defmethod ros_stairsdetection::ExportStairsRequest
  (:init
   (&key
    ((:path __path) "")
    )
   (send-super :init)
   (setq _path (string __path))
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; string _path
    4 (length _path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ros_stairsdetection::ExportStairsResponse
  :super ros::object
  :slots (_result ))

(defmethod ros_stairsdetection::ExportStairsResponse
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ros_stairsdetection::ExportStairs
  :super ros::object
  :slots ())

(setf (get ros_stairsdetection::ExportStairs :md5sum-) "b232266867e934f58d024196cb4b3a8d")
(setf (get ros_stairsdetection::ExportStairs :datatype-) "ros_stairsdetection/ExportStairs")
(setf (get ros_stairsdetection::ExportStairs :request) ros_stairsdetection::ExportStairsRequest)
(setf (get ros_stairsdetection::ExportStairs :response) ros_stairsdetection::ExportStairsResponse)

(defmethod ros_stairsdetection::ExportStairsRequest
  (:response () (instance ros_stairsdetection::ExportStairsResponse :init)))

(setf (get ros_stairsdetection::ExportStairsRequest :md5sum-) "b232266867e934f58d024196cb4b3a8d")
(setf (get ros_stairsdetection::ExportStairsRequest :datatype-) "ros_stairsdetection/ExportStairsRequest")
(setf (get ros_stairsdetection::ExportStairsRequest :definition-)
      "string path
---
string result

")

(setf (get ros_stairsdetection::ExportStairsResponse :md5sum-) "b232266867e934f58d024196cb4b3a8d")
(setf (get ros_stairsdetection::ExportStairsResponse :datatype-) "ros_stairsdetection/ExportStairsResponse")
(setf (get ros_stairsdetection::ExportStairsResponse :definition-)
      "string path
---
string result

")



(provide :ros_stairsdetection/ExportStairs "b232266867e934f58d024196cb4b3a8d")


