; Auto-generated. Do not edit!


(cl:in-package cmvision_3d-msg)


;//! \htmlinclude Blob3d.msg.html

(cl:defclass <Blob3d> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (red
    :reader red
    :initarg :red
    :type cl:integer
    :initform 0)
   (green
    :reader green
    :initarg :green
    :type cl:integer
    :initform 0)
   (blue
    :reader blue
    :initarg :blue
    :type cl:integer
    :initform 0)
   (area
    :reader area
    :initarg :area
    :type cl:integer
    :initform 0)
   (center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (top_left
    :reader top_left
    :initarg :top_left
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (bottom_right
    :reader bottom_right
    :initarg :bottom_right
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass Blob3d (<Blob3d>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Blob3d>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Blob3d)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cmvision_3d-msg:<Blob3d> is deprecated: use cmvision_3d-msg:Blob3d instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:name-val is deprecated.  Use cmvision_3d-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'red-val :lambda-list '(m))
(cl:defmethod red-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:red-val is deprecated.  Use cmvision_3d-msg:red instead.")
  (red m))

(cl:ensure-generic-function 'green-val :lambda-list '(m))
(cl:defmethod green-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:green-val is deprecated.  Use cmvision_3d-msg:green instead.")
  (green m))

(cl:ensure-generic-function 'blue-val :lambda-list '(m))
(cl:defmethod blue-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:blue-val is deprecated.  Use cmvision_3d-msg:blue instead.")
  (blue m))

(cl:ensure-generic-function 'area-val :lambda-list '(m))
(cl:defmethod area-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:area-val is deprecated.  Use cmvision_3d-msg:area instead.")
  (area m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:center-val is deprecated.  Use cmvision_3d-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'top_left-val :lambda-list '(m))
(cl:defmethod top_left-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:top_left-val is deprecated.  Use cmvision_3d-msg:top_left instead.")
  (top_left m))

(cl:ensure-generic-function 'bottom_right-val :lambda-list '(m))
(cl:defmethod bottom_right-val ((m <Blob3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:bottom_right-val is deprecated.  Use cmvision_3d-msg:bottom_right instead.")
  (bottom_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Blob3d>) ostream)
  "Serializes a message object of type '<Blob3d>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'red)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'red)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'red)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'red)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'green)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'green)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'green)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'green)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'blue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'blue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'blue)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'area)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'area)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'area)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'area)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'top_left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bottom_right) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Blob3d>) istream)
  "Deserializes a message object of type '<Blob3d>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'red)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'red)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'red)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'red)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'green)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'green)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'green)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'green)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'blue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'blue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'blue)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'area)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'area)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'area)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'area)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'top_left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bottom_right) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Blob3d>)))
  "Returns string type for a message object of type '<Blob3d>"
  "cmvision_3d/Blob3d")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Blob3d)))
  "Returns string type for a message object of type 'Blob3d"
  "cmvision_3d/Blob3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Blob3d>)))
  "Returns md5sum for a message object of type '<Blob3d>"
  "b7ac1acee51124a3194784be5dd98a9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Blob3d)))
  "Returns md5sum for a message object of type 'Blob3d"
  "b7ac1acee51124a3194784be5dd98a9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Blob3d>)))
  "Returns full string definition for message of type '<Blob3d>"
  (cl:format cl:nil "string name~%uint32 red~%uint32 green~%uint32 blue~%uint32 area~%geometry_msgs/Point center~%geometry_msgs/Point top_left~%geometry_msgs/Point bottom_right~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Blob3d)))
  "Returns full string definition for message of type 'Blob3d"
  (cl:format cl:nil "string name~%uint32 red~%uint32 green~%uint32 blue~%uint32 area~%geometry_msgs/Point center~%geometry_msgs/Point top_left~%geometry_msgs/Point bottom_right~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Blob3d>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'top_left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bottom_right))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Blob3d>))
  "Converts a ROS message object to a list"
  (cl:list 'Blob3d
    (cl:cons ':name (name msg))
    (cl:cons ':red (red msg))
    (cl:cons ':green (green msg))
    (cl:cons ':blue (blue msg))
    (cl:cons ':area (area msg))
    (cl:cons ':center (center msg))
    (cl:cons ':top_left (top_left msg))
    (cl:cons ':bottom_right (bottom_right msg))
))
