; Auto-generated. Do not edit!


(cl:in-package gobang_motion-srv)


;//! \htmlinclude RobotMove-request.msg.html

(cl:defclass <RobotMove-request> (roslisp-msg-protocol:ros-message)
  ((row
    :reader row
    :initarg :row
    :type cl:fixnum
    :initform 0)
   (col
    :reader col
    :initarg :col
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotMove-request (<RobotMove-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotMove-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotMove-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gobang_motion-srv:<RobotMove-request> is deprecated: use gobang_motion-srv:RobotMove-request instead.")))

(cl:ensure-generic-function 'row-val :lambda-list '(m))
(cl:defmethod row-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gobang_motion-srv:row-val is deprecated.  Use gobang_motion-srv:row instead.")
  (row m))

(cl:ensure-generic-function 'col-val :lambda-list '(m))
(cl:defmethod col-val ((m <RobotMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gobang_motion-srv:col-val is deprecated.  Use gobang_motion-srv:col instead.")
  (col m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotMove-request>) ostream)
  "Serializes a message object of type '<RobotMove-request>"
  (cl:let* ((signed (cl:slot-value msg 'row)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'col)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotMove-request>) istream)
  "Deserializes a message object of type '<RobotMove-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'row) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'col) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotMove-request>)))
  "Returns string type for a service object of type '<RobotMove-request>"
  "gobang_motion/RobotMoveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove-request)))
  "Returns string type for a service object of type 'RobotMove-request"
  "gobang_motion/RobotMoveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotMove-request>)))
  "Returns md5sum for a message object of type '<RobotMove-request>"
  "e85690eba9eeffee9ca1b40bb8b34292")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotMove-request)))
  "Returns md5sum for a message object of type 'RobotMove-request"
  "e85690eba9eeffee9ca1b40bb8b34292")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotMove-request>)))
  "Returns full string definition for message of type '<RobotMove-request>"
  (cl:format cl:nil "int8 row~%int8 col~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotMove-request)))
  "Returns full string definition for message of type 'RobotMove-request"
  (cl:format cl:nil "int8 row~%int8 col~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotMove-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotMove-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotMove-request
    (cl:cons ':row (row msg))
    (cl:cons ':col (col msg))
))
;//! \htmlinclude RobotMove-response.msg.html

(cl:defclass <RobotMove-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass RobotMove-response (<RobotMove-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotMove-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotMove-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gobang_motion-srv:<RobotMove-response> is deprecated: use gobang_motion-srv:RobotMove-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotMove-response>) ostream)
  "Serializes a message object of type '<RobotMove-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotMove-response>) istream)
  "Deserializes a message object of type '<RobotMove-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotMove-response>)))
  "Returns string type for a service object of type '<RobotMove-response>"
  "gobang_motion/RobotMoveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove-response)))
  "Returns string type for a service object of type 'RobotMove-response"
  "gobang_motion/RobotMoveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotMove-response>)))
  "Returns md5sum for a message object of type '<RobotMove-response>"
  "e85690eba9eeffee9ca1b40bb8b34292")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotMove-response)))
  "Returns md5sum for a message object of type 'RobotMove-response"
  "e85690eba9eeffee9ca1b40bb8b34292")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotMove-response>)))
  "Returns full string definition for message of type '<RobotMove-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotMove-response)))
  "Returns full string definition for message of type 'RobotMove-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotMove-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotMove-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotMove-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotMove)))
  'RobotMove-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotMove)))
  'RobotMove-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove)))
  "Returns string type for a service object of type '<RobotMove>"
  "gobang_motion/RobotMove")