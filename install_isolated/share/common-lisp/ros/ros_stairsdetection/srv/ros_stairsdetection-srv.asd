
(cl:in-package :asdf)

(defsystem "ros_stairsdetection-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ClearStairs" :depends-on ("_package_ClearStairs"))
    (:file "_package_ClearStairs" :depends-on ("_package"))
    (:file "ExportStairs" :depends-on ("_package_ExportStairs"))
    (:file "_package_ExportStairs" :depends-on ("_package"))
    (:file "ImportStairs" :depends-on ("_package_ImportStairs"))
    (:file "_package_ImportStairs" :depends-on ("_package"))
  ))