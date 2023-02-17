;; Auto-generated. Do not edit!


(when (boundp 'ros_stairsdetection::ImportStairs)
  (if (not (find-package "ROS_STAIRSDETECTION"))
    (make-package "ROS_STAIRSDETECTION"))
  (shadow 'ImportStairs (find-package "ROS_STAIRSDETECTION")))
(unless (find-package "ROS_STAIRSDETECTION::IMPORTSTAIRS")
  (make-package "ROS_STAIRSDETECTION::IMPORTSTAIRS"))
(unless (find-package "ROS_STAIRSDETECTION::IMPORTSTAIRSREQUEST")
  (make-package "ROS_STAIRSDETECTION::IMPORTSTAIRSREQUEST"))
(unless (find-package "ROS_STAIRSDETECTION::IMPORTSTAIRSRESPONSE")
  (make-package "ROS_STAIRSDETECTION::IMPORTSTAIRSRESPONSE"))

(in-package "ROS")





(defclass ros_stairsdetection::ImportStairsRequest
  :super ros::object
  :slots (_path ))

(defmethod ros_stairsdetection::ImportStairsRequest
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

(defclass ros_stairsdetection::ImportStairsResponse
  :super ros::object
  :slots (_result ))

(defmethod ros_stairsdetection::ImportStairsResponse
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

(defclass ros_stairsdetection::ImportStairs
  :super ros::object
  :slots ())

(setf (get ros_stairsdetection::ImportStairs :md5sum-) "b232266867e934f58d024196cb4b3a8d")
(setf (get ros_stairsdetection::ImportStairs :datatype-) "ros_stairsdetection/ImportStairs")
(setf (get ros_stairsdetection::ImportStairs :request) ros_stairsdetection::ImportStairsRequest)
(setf (get ros_stairsdetection::ImportStairs :response) ros_stairsdetection::ImportStairsResponse)

(defmethod ros_stairsdetection::ImportStairsRequest
  (:response () (instance ros_stairsdetection::ImportStairsResponse :init)))

(setf (get ros_stairsdetection::ImportStairsRequest :md5sum-) "b232266867e934f58d024196cb4b3a8d")
(setf (get ros_stairsdetection::ImportStairsRequest :datatype-) "ros_stairsdetection/ImportStairsRequest")
(setf (get ros_stairsdetection::ImportStairsRequest :definition-)
      "string path
---
string result

")

(setf (get ros_stairsdetection::ImportStairsResponse :md5sum-) "b232266867e934f58d024196cb4b3a8d")
(setf (get ros_stairsdetection::ImportStairsResponse :datatype-) "ros_stairsdetection/ImportStairsResponse")
(setf (get ros_stairsdetection::ImportStairsResponse :definition-)
      "string path
---
string result

")



(provide :ros_stairsdetection/ImportStairs "b232266867e934f58d024196cb4b3a8d")


