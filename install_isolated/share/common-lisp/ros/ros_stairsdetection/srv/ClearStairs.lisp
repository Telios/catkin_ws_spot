; Auto-generated. Do not edit!


(cl:in-package ros_stairsdetection-srv)


;//! \htmlinclude ClearStairs-request.msg.html

(cl:defclass <ClearStairs-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClearStairs-request (<ClearStairs-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearStairs-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearStairs-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_stairsdetection-srv:<ClearStairs-request> is deprecated: use ros_stairsdetection-srv:ClearStairs-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearStairs-request>) ostream)
  "Serializes a message object of type '<ClearStairs-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearStairs-request>) istream)
  "Deserializes a message object of type '<ClearStairs-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearStairs-request>)))
  "Returns string type for a service object of type '<ClearStairs-request>"
  "ros_stairsdetection/ClearStairsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearStairs-request)))
  "Returns string type for a service object of type 'ClearStairs-request"
  "ros_stairsdetection/ClearStairsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearStairs-request>)))
  "Returns md5sum for a message object of type '<ClearStairs-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearStairs-request)))
  "Returns md5sum for a message object of type 'ClearStairs-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearStairs-request>)))
  "Returns full string definition for message of type '<ClearStairs-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearStairs-request)))
  "Returns full string definition for message of type 'ClearStairs-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearStairs-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearStairs-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearStairs-request
))
;//! \htmlinclude ClearStairs-response.msg.html

(cl:defclass <ClearStairs-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClearStairs-response (<ClearStairs-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearStairs-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearStairs-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_stairsdetection-srv:<ClearStairs-response> is deprecated: use ros_stairsdetection-srv:ClearStairs-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearStairs-response>) ostream)
  "Serializes a message object of type '<ClearStairs-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearStairs-response>) istream)
  "Deserializes a message object of type '<ClearStairs-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearStairs-response>)))
  "Returns string type for a service object of type '<ClearStairs-response>"
  "ros_stairsdetection/ClearStairsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearStairs-response)))
  "Returns string type for a service object of type 'ClearStairs-response"
  "ros_stairsdetection/ClearStairsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearStairs-response>)))
  "Returns md5sum for a message object of type '<ClearStairs-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearStairs-response)))
  "Returns md5sum for a message object of type 'ClearStairs-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearStairs-response>)))
  "Returns full string definition for message of type '<ClearStairs-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearStairs-response)))
  "Returns full string definition for message of type 'ClearStairs-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearStairs-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearStairs-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearStairs-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClearStairs)))
  'ClearStairs-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClearStairs)))
  'ClearStairs-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearStairs)))
  "Returns string type for a service object of type '<ClearStairs>"
  "ros_stairsdetection/ClearStairs")