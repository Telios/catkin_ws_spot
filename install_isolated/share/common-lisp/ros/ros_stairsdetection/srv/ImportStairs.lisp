; Auto-generated. Do not edit!


(cl:in-package ros_stairsdetection-srv)


;//! \htmlinclude ImportStairs-request.msg.html

(cl:defclass <ImportStairs-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass ImportStairs-request (<ImportStairs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImportStairs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImportStairs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_stairsdetection-srv:<ImportStairs-request> is deprecated: use ros_stairsdetection-srv:ImportStairs-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <ImportStairs-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_stairsdetection-srv:path-val is deprecated.  Use ros_stairsdetection-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImportStairs-request>) ostream)
  "Serializes a message object of type '<ImportStairs-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImportStairs-request>) istream)
  "Deserializes a message object of type '<ImportStairs-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImportStairs-request>)))
  "Returns string type for a service object of type '<ImportStairs-request>"
  "ros_stairsdetection/ImportStairsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImportStairs-request)))
  "Returns string type for a service object of type 'ImportStairs-request"
  "ros_stairsdetection/ImportStairsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImportStairs-request>)))
  "Returns md5sum for a message object of type '<ImportStairs-request>"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImportStairs-request)))
  "Returns md5sum for a message object of type 'ImportStairs-request"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImportStairs-request>)))
  "Returns full string definition for message of type '<ImportStairs-request>"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImportStairs-request)))
  "Returns full string definition for message of type 'ImportStairs-request"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImportStairs-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImportStairs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ImportStairs-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude ImportStairs-response.msg.html

(cl:defclass <ImportStairs-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass ImportStairs-response (<ImportStairs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImportStairs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImportStairs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_stairsdetection-srv:<ImportStairs-response> is deprecated: use ros_stairsdetection-srv:ImportStairs-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ImportStairs-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_stairsdetection-srv:result-val is deprecated.  Use ros_stairsdetection-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImportStairs-response>) ostream)
  "Serializes a message object of type '<ImportStairs-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImportStairs-response>) istream)
  "Deserializes a message object of type '<ImportStairs-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImportStairs-response>)))
  "Returns string type for a service object of type '<ImportStairs-response>"
  "ros_stairsdetection/ImportStairsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImportStairs-response)))
  "Returns string type for a service object of type 'ImportStairs-response"
  "ros_stairsdetection/ImportStairsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImportStairs-response>)))
  "Returns md5sum for a message object of type '<ImportStairs-response>"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImportStairs-response)))
  "Returns md5sum for a message object of type 'ImportStairs-response"
  "b232266867e934f58d024196cb4b3a8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImportStairs-response>)))
  "Returns full string definition for message of type '<ImportStairs-response>"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImportStairs-response)))
  "Returns full string definition for message of type 'ImportStairs-response"
  (cl:format cl:nil "string result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImportStairs-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImportStairs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ImportStairs-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ImportStairs)))
  'ImportStairs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ImportStairs)))
  'ImportStairs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImportStairs)))
  "Returns string type for a service object of type '<ImportStairs>"
  "ros_stairsdetection/ImportStairs")