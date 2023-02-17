
(cl:in-package :asdf)

(defsystem "core_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MapInfo" :depends-on ("_package_MapInfo"))
    (:file "_package_MapInfo" :depends-on ("_package"))
  ))