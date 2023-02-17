; Auto-generated. Do not edit!


(cl:in-package core_msgs-msg)


;//! \htmlinclude MapInfo.msg.html

(cl:defclass <MapInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (size
    :reader size
    :initarg :size
    :type cl:integer
    :initform 0)
   (initialized
    :reader initialized
    :initarg :initialized
    :type cl:boolean
    :initform cl:nil)
   (volume
    :reader volume
    :initarg :volume
    :type cl:float
    :initform 0.0))
)

(cl:defclass MapInfo (<MapInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name core_msgs-msg:<MapInfo> is deprecated: use core_msgs-msg:MapInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MapInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_msgs-msg:header-val is deprecated.  Use core_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <MapInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_msgs-msg:size-val is deprecated.  Use core_msgs-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'initialized-val :lambda-list '(m))
(cl:defmethod initialized-val ((m <MapInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_msgs-msg:initialized-val is deprecated.  Use core_msgs-msg:initialized instead.")
  (initialized m))

(cl:ensure-generic-function 'volume-val :lambda-list '(m))
(cl:defmethod volume-val ((m <MapInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader core_msgs-msg:volume-val is deprecated.  Use core_msgs-msg:volume instead.")
  (volume m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapInfo>) ostream)
  "Serializes a message object of type '<MapInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'initialized) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'volume))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapInfo>) istream)
  "Deserializes a message object of type '<MapInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'size)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'initialized) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volume) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapInfo>)))
  "Returns string type for a message object of type '<MapInfo>"
  "core_msgs/MapInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapInfo)))
  "Returns string type for a message object of type 'MapInfo"
  "core_msgs/MapInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapInfo>)))
  "Returns md5sum for a message object of type '<MapInfo>"
  "7c3dc73401a0398b17fe75c574b69332")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapInfo)))
  "Returns md5sum for a message object of type 'MapInfo"
  "7c3dc73401a0398b17fe75c574b69332")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapInfo>)))
  "Returns full string definition for message of type '<MapInfo>"
  (cl:format cl:nil "# Information associated to Map~%# Header~%Header header~%~%# Size of map~%uint64 size~%~%# Mapper Initialised~%bool initialized~%~%# Volume ~%float32 volume~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapInfo)))
  "Returns full string definition for message of type 'MapInfo"
  (cl:format cl:nil "# Information associated to Map~%# Header~%Header header~%~%# Size of map~%uint64 size~%~%# Mapper Initialised~%bool initialized~%~%# Volume ~%float32 volume~%~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'MapInfo
    (cl:cons ':header (header msg))
    (cl:cons ':size (size msg))
    (cl:cons ':initialized (initialized msg))
    (cl:cons ':volume (volume msg))
))
