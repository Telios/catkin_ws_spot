; Auto-generated. Do not edit!


(cl:in-package stairdetection-msg)


;//! \htmlinclude Staircase.msg.html

(cl:defclass <Staircase> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (height
    :reader height
    :initarg :height
    :type cl:float
    :initform 0.0)
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0)
   (nr_steps
    :reader nr_steps
    :initarg :nr_steps
    :type cl:integer
    :initform 0)
   (start_pose
    :reader start_pose
    :initarg :start_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (going_vector
    :reader going_vector
    :initarg :going_vector
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass Staircase (<Staircase>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Staircase>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Staircase)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stairdetection-msg:<Staircase> is deprecated: use stairdetection-msg:Staircase instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:type-val is deprecated.  Use stairdetection-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:id-val is deprecated.  Use stairdetection-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:width-val is deprecated.  Use stairdetection-msg:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:height-val is deprecated.  Use stairdetection-msg:height instead.")
  (height m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:depth-val is deprecated.  Use stairdetection-msg:depth instead.")
  (depth m))

(cl:ensure-generic-function 'nr_steps-val :lambda-list '(m))
(cl:defmethod nr_steps-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:nr_steps-val is deprecated.  Use stairdetection-msg:nr_steps instead.")
  (nr_steps m))

(cl:ensure-generic-function 'start_pose-val :lambda-list '(m))
(cl:defmethod start_pose-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:start_pose-val is deprecated.  Use stairdetection-msg:start_pose instead.")
  (start_pose m))

(cl:ensure-generic-function 'going_vector-val :lambda-list '(m))
(cl:defmethod going_vector-val ((m <Staircase>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairdetection-msg:going_vector-val is deprecated.  Use stairdetection-msg:going_vector instead.")
  (going_vector m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Staircase>)))
    "Constants for message type '<Staircase>"
  '((:ASCENDING . 0)
    (:DESCENDING . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Staircase)))
    "Constants for message type 'Staircase"
  '((:ASCENDING . 0)
    (:DESCENDING . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Staircase>) ostream)
  "Serializes a message object of type '<Staircase>"
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'nr_steps)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'going_vector) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Staircase>) istream)
  "Deserializes a message object of type '<Staircase>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'height) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nr_steps) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'going_vector) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Staircase>)))
  "Returns string type for a message object of type '<Staircase>"
  "stairdetection/Staircase")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Staircase)))
  "Returns string type for a message object of type 'Staircase"
  "stairdetection/Staircase")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Staircase>)))
  "Returns md5sum for a message object of type '<Staircase>"
  "328f707a0f226253d43b60994d17c07a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Staircase)))
  "Returns md5sum for a message object of type 'Staircase"
  "328f707a0f226253d43b60994d17c07a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Staircase>)))
  "Returns full string definition for message of type '<Staircase>"
  (cl:format cl:nil "uint8 ASCENDING=0~%uint8 DESCENDING=1~%~%int32 type~%int32 id~%float32 width~%float32 height~%float32 depth~%int32 nr_steps~%geometry_msgs/Pose start_pose~%geometry_msgs/Vector3 going_vector~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Staircase)))
  "Returns full string definition for message of type 'Staircase"
  (cl:format cl:nil "uint8 ASCENDING=0~%uint8 DESCENDING=1~%~%int32 type~%int32 id~%float32 width~%float32 height~%float32 depth~%int32 nr_steps~%geometry_msgs/Pose start_pose~%geometry_msgs/Vector3 going_vector~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Staircase>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'going_vector))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Staircase>))
  "Converts a ROS message object to a list"
  (cl:list 'Staircase
    (cl:cons ':type (type msg))
    (cl:cons ':id (id msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':depth (depth msg))
    (cl:cons ':nr_steps (nr_steps msg))
    (cl:cons ':start_pose (start_pose msg))
    (cl:cons ':going_vector (going_vector msg))
))
