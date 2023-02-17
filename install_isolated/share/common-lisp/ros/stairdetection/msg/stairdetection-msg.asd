
(cl:in-package :asdf)

(defsystem "stairdetection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Staircase" :depends-on ("_package_Staircase"))
    (:file "_package_Staircase" :depends-on ("_package"))
    (:file "StaircaseArray" :depends-on ("_package_StaircaseArray"))
    (:file "_package_StaircaseArray" :depends-on ("_package"))
  ))