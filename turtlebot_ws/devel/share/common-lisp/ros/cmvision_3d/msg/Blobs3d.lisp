; Auto-generated. Do not edit!


(cl:in-package cmvision_3d-msg)


;//! \htmlinclude Blobs3d.msg.html

(cl:defclass <Blobs3d> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (blob_count
    :reader blob_count
    :initarg :blob_count
    :type cl:integer
    :initform 0)
   (blobs
    :reader blobs
    :initarg :blobs
    :type (cl:vector cmvision_3d-msg:Blob3d)
   :initform (cl:make-array 0 :element-type 'cmvision_3d-msg:Blob3d :initial-element (cl:make-instance 'cmvision_3d-msg:Blob3d))))
)

(cl:defclass Blobs3d (<Blobs3d>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Blobs3d>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Blobs3d)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cmvision_3d-msg:<Blobs3d> is deprecated: use cmvision_3d-msg:Blobs3d instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Blobs3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:header-val is deprecated.  Use cmvision_3d-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'blob_count-val :lambda-list '(m))
(cl:defmethod blob_count-val ((m <Blobs3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:blob_count-val is deprecated.  Use cmvision_3d-msg:blob_count instead.")
  (blob_count m))

(cl:ensure-generic-function 'blobs-val :lambda-list '(m))
(cl:defmethod blobs-val ((m <Blobs3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cmvision_3d-msg:blobs-val is deprecated.  Use cmvision_3d-msg:blobs instead.")
  (blobs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Blobs3d>) ostream)
  "Serializes a message object of type '<Blobs3d>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blob_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'blob_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'blob_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'blob_count)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'blobs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'blobs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Blobs3d>) istream)
  "Deserializes a message object of type '<Blobs3d>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'blob_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'blob_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'blob_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'blob_count)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'blobs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'blobs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cmvision_3d-msg:Blob3d))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Blobs3d>)))
  "Returns string type for a message object of type '<Blobs3d>"
  "cmvision_3d/Blobs3d")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Blobs3d)))
  "Returns string type for a message object of type 'Blobs3d"
  "cmvision_3d/Blobs3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Blobs3d>)))
  "Returns md5sum for a message object of type '<Blobs3d>"
  "869bbddc0459864dc4de06329dfb061b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Blobs3d)))
  "Returns md5sum for a message object of type 'Blobs3d"
  "869bbddc0459864dc4de06329dfb061b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Blobs3d>)))
  "Returns full string definition for message of type '<Blobs3d>"
  (cl:format cl:nil "Header header~%uint32 blob_count~%Blob3d[] blobs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cmvision_3d/Blob3d~%string name~%uint32 red~%uint32 green~%uint32 blue~%uint32 area~%geometry_msgs/Point center~%geometry_msgs/Point top_left~%geometry_msgs/Point bottom_right~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Blobs3d)))
  "Returns full string definition for message of type 'Blobs3d"
  (cl:format cl:nil "Header header~%uint32 blob_count~%Blob3d[] blobs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cmvision_3d/Blob3d~%string name~%uint32 red~%uint32 green~%uint32 blue~%uint32 area~%geometry_msgs/Point center~%geometry_msgs/Point top_left~%geometry_msgs/Point bottom_right~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Blobs3d>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'blobs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Blobs3d>))
  "Converts a ROS message object to a list"
  (cl:list 'Blobs3d
    (cl:cons ':header (header msg))
    (cl:cons ':blob_count (blob_count msg))
    (cl:cons ':blobs (blobs msg))
))
