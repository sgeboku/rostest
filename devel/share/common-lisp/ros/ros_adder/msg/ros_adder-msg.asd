
(cl:in-package :asdf)

(defsystem "ros_adder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Adder" :depends-on ("_package_Adder"))
    (:file "_package_Adder" :depends-on ("_package"))
  ))