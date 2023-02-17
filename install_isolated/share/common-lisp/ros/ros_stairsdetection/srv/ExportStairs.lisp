; Auto-generated. Do not edit!


(cl:in-package ros_stairsdetection-srv)


;//! \htmlinclude ExportStairs-request.msg.html

(cl:defclass <ExportStairs-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass ExportStairs-request (<ExportStairs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExportStairs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExportStairs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_stairsdetection-srv:<ExportStairs-request> is deprecated: use ros_stairsdetection-srv:ExportStairs-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <ExportStairs-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_stairsdetection-srv:path-val is deprecated.  Use ros_stairsdetection-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExportStairs-request>) ostream)
  "Serializes a message object of type '<ExportStairs-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExportStairs-request>) istream)
  "Deserializes a message object of type '<ExportStairs-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExportStairs-request>)))
  "Returns string type for a service object of type '<ExportStairs-request>"
  "ros_stairsdetection/ExportStairsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExportStairs-request)))
  "Returns string type for a service object of type 'ExportStairs-request"
  "ros_stairsdetection/ExportStairsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExportStairs-request>)))
  "Returns md5sum for a message object of type '<ExportStairs-request>"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExportStairs-request)))
  "Returns md5sum for a message object of type 'ExportStairs-request"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExportStairs-request>)))
  "Returns full string definition for message of type '<ExportStairs-request>"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExportStairs-request)))
  "Returns full string definition for message of type 'ExportStairs-request"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExportStairs-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExportStairs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExportStairs-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude ExportStairs-response.msg.html

(cl:defclass <ExportStairs-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass ExportStairs-response (<ExportStairs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExportStairs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExportStairs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_stairsdetection-srv:<ExportStairs-response> is deprecated: use ros_stairsdetection-srv:ExportStairs-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ExportStairs-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_stairsdetection-srv:result-val is deprecated.  Use ros_stairsdetection-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExportStairs-response>) ostream)
  "Serializes a message object of type '<ExportStairs-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExportStairs-response>) istream)
  "Deserializes a message object of type '<ExportStairs-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExportStairs-response>)))
  "Returns string type for a service object of type '<ExportStairs-response>"
  "ros_stairsdetection/ExportStairsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExportStairs-response)))
  "Returns string type for a service object of type 'ExportStairs-response"
  "ros_stairsdetection/ExportStairsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExportStairs-response>)))
  "Returns md5sum for a message object of type '<ExportStairs-response>"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExportStairs-response)))
  "Returns md5sum for a message object of type 'ExportStairs-response"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExportStairs-response>)))
  "Returns full string definition for message of type '<ExportStairs-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExportStairs-response)))
  "Returns full string definition for message of type 'ExportStairs-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExportStairs-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExportStairs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExportStairs-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExportStairs)))
  'ExportStairs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExportStairs)))
  'ExportStairs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExportStairs)))
  "Returns string type for a service object of type '<ExportStairs>"
  "ros_stairsdetection/ExportStairs")