; Auto-generated. Do not edit!


(cl:in-package ros_adder-msg)


;//! \htmlinclude Adder.msg.html

(cl:defclass <Adder> (roslisp-msg-protocol:ros-message)
  ((arg_x
    :reader arg_x
    :initarg :arg_x
    :type cl:integer
    :initform 0)
   (arg_y
    :reader arg_y
    :initarg :arg_y
    :type cl:integer
    :initform 0))
)

(cl:defclass Adder (<Adder>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Adder>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Adder)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_adder-msg:<Adder> is deprecated: use ros_adder-msg:Adder instead.")))

(cl:ensure-generic-function 'arg_x-val :lambda-list '(m))
(cl:defmethod arg_x-val ((m <Adder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_adder-msg:arg_x-val is deprecated.  Use ros_adder-msg:arg_x instead.")
  (arg_x m))

(cl:ensure-generic-function 'arg_y-val :lambda-list '(m))
(cl:defmethod arg_y-val ((m <Adder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_adder-msg:arg_y-val is deprecated.  Use ros_adder-msg:arg_y instead.")
  (arg_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Adder>) ostream)
  "Serializes a message object of type '<Adder>"
  (cl:let* ((signed (cl:slot-value msg 'arg_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'arg_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Adder>) istream)
  "Deserializes a message object of type '<Adder>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arg_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arg_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Adder>)))
  "Returns string type for a message object of type '<Adder>"
  "ros_adder/Adder")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Adder)))
  "Returns string type for a message object of type 'Adder"
  "ros_adder/Adder")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Adder>)))
  "Returns md5sum for a message object of type '<Adder>"
  "e786a8255416662901d0f10732f9d69a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Adder)))
  "Returns md5sum for a message object of type 'Adder"
  "e786a8255416662901d0f10732f9d69a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Adder>)))
  "Returns full string definition for message of type '<Adder>"
  (cl:format cl:nil "int32 arg_x~%int32 arg_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Adder)))
  "Returns full string definition for message of type 'Adder"
  (cl:format cl:nil "int32 arg_x~%int32 arg_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Adder>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Adder>))
  "Converts a ROS message object to a list"
  (cl:list 'Adder
    (cl:cons ':arg_x (arg_x msg))
    (cl:cons ':arg_y (arg_y msg))
))
