; Auto-generated. Do not edit!


(cl:in-package stairdetection-msg)


;//! \htmlinclude StaircaseArray.msg.html

(cl:defclass <StaircaseArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (staircases
    :reader staircases
    :initarg :staircases
    :type (cl:vector stairdetection-msg:Staircase)
   :initform (cl:make-array 0 :element-type 'stairdetection-msg:Staircase :initial-element (cl:make-instance 'stairdetection-msg:Staircase))))
)

(cl:defclass StaircaseArray (<StaircaseArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StaircaseArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StaircaseArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stairdetection-msg:<StaircaseArray> is deprecated: use stairdetection-msg:StaircaseArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <StaircaseArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:header-val is deprecated.  Use stairdetection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'staircases-val :lambda-list '(m))
(cl:defmethod staircases-val ((m <StaircaseArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:staircases-val is deprecated.  Use stairdetection-msg:staircases instead.")
  (staircases m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StaircaseArray>) ostream)
  "Serializes a message object of type '<StaircaseArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'staircases))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'staircases))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StaircaseArray>) istream)
  "Deserializes a message object of type '<StaircaseArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'staircases) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'staircases)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'stairdetection-msg:Staircase))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StaircaseArray>)))
  "Returns string type for a message object of type '<StaircaseArray>"
  "stairdetection/StaircaseArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StaircaseArray)))
  "Returns string type for a message object of type 'StaircaseArray"
  "stairdetection/StaircaseArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StaircaseArray>)))
  "Returns md5sum for a message object of type '<StaircaseArray>"
  "f9e6db9a4c0a52ac0899470f521a12d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StaircaseArray)))
  "Returns md5sum for a message object of type 'StaircaseArray"
  "f9e6db9a4c0a52ac0899470f521a12d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StaircaseArray>)))
  "Returns full string definition for message of type '<StaircaseArray>"
  (cl:format cl:nil "Header header~%Staircase[] staircases~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: stairdetection/Staircase~%uint8 ASCENDING=0~%uint8 DESCENDING=1~%~%int32 type~%int32 id~%float32 width~%float32 height~%float32 depth~%int32 nr_steps~%geometry_msgs/Pose start_pose~%geometry_msgs/Vector3 going_vector~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StaircaseArray)))
  "Returns full string definition for message of type 'StaircaseArray"
  (cl:format cl:nil "Header header~%Staircase[] staircases~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: stairdetection/Staircase~%uint8 ASCENDING=0~%uint8 DESCENDING=1~%~%int32 type~%int32 id~%float32 width~%float32 height~%float32 depth~%int32 nr_steps~%geometry_msgs/Pose start_pose~%geometry_msgs/Vector3 going_vector~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StaircaseArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'staircases) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StaircaseArray>))
  "Converts a ROS message object to a list"
  (cl:list 'StaircaseArray
    (cl:cons ':header (header msg))
    (cl:cons ':staircases (staircases msg))
))
