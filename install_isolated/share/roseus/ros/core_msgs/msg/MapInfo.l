;; Auto-generated. Do not edit!


(when (boundp 'core_msgs::MapInfo)
  (if (not (find-package "CORE_MSGS"))
    (make-package "CORE_MSGS"))
  (shadow 'MapInfo (find-package "CORE_MSGS")))
(unless (find-package "CORE_MSGS::MAPINFO")
  (make-package "CORE_MSGS::MAPINFO"))

(in-package "ROS")
;;//! \htmlinclude MapInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass core_msgs::MapInfo
  :super ros::object
  :slots (_header _size _initialized _volume ))

(defmethod core_msgs::MapInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:size __size) 0)
    ((:initialized __initialized) nil)
    ((:volume __volume) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _size (round __size))
   (setq _initialized __initialized)
   (setq _volume (float __volume))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:initialized
   (&optional __initialized)
   (if __initialized (setq _initialized __initialized)) _initialized)
  (:volume
   (&optional __volume)
   (if __volume (setq _volume __volume)) _volume)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _size
    8
    ;; bool _initialized
    1
    ;; float32 _volume
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint64 _size
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _size (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _size) (= (length (_size . bv)) 2)) ;; bignum
              (write-long (ash (elt (_size . bv) 0) 0) s)
              (write-long (ash (elt (_size . bv) 1) -1) s))
             ((and (class _size) (= (length (_size . bv)) 1)) ;; big1
              (write-long (elt (_size . bv) 0) s)
              (write-long (if (>= _size 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _size s)(write-long (if (>= _size 0) 0 #xffffffff) s)))
     ;; bool _initialized
       (if _initialized (write-byte -1 s) (write-byte 0 s))
     ;; float32 _volume
       (sys::poke _volume (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint64 _size
     
#+(or :alpha :irix6 :x86_64)
      (setf _size (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _size (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; bool _initialized
     (setq _initialized (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _volume
     (setq _volume (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get core_msgs::MapInfo :md5sum-) "7c3dc73401a0398b17fe75c574b69332")
(setf (get core_msgs::MapInfo :datatype-) "core_msgs/MapInfo")
(setf (get core_msgs::MapInfo :definition-)
      "# Information associated to Map
# Header
Header header

# Size of map
uint64 size

# Mapper Initialised
bool initialized

# Volume 
float32 volume



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

")



(provide :core_msgs/MapInfo "7c3dc73401a0398b17fe75c574b69332")


