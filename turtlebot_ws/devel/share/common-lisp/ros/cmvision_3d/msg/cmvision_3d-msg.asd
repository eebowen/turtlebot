
(cl:in-package :asdf)

(defsystem "cmvision_3d-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Blobs3d" :depends-on ("_package_Blobs3d"))
    (:file "_package_Blobs3d" :depends-on ("_package"))
    (:file "Blob3d" :depends-on ("_package_Blob3d"))
    (:file "_package_Blob3d" :depends-on ("_package"))
  ))