;; Auto-generated. Do not edit!


(when (boundp 'ros_adder::Adder)
  (if (not (find-package "ROS_ADDER"))
    (make-package "ROS_ADDER"))
  (shadow 'Adder (find-package "ROS_ADDER")))
(unless (find-package "ROS_ADDER::ADDER")
  (make-package "ROS_ADDER::ADDER"))

(in-package "ROS")
;;//! \htmlinclude Adder.msg.html


(defclass ros_adder::Adder
  :super ros::object
  :slots (_arg_x _arg_y ))

(defmethod ros_adder::Adder
  (:init
   (&key
    ((:arg_x __arg_x) 0)
    ((:arg_y __arg_y) 0)
    )
   (send-super :init)
   (setq _arg_x (round __arg_x))
   (setq _arg_y (round __arg_y))
   self)
  (:arg_x
   (&optional __arg_x)
   (if __arg_x (setq _arg_x __arg_x)) _arg_x)
  (:arg_y
   (&optional __arg_y)
   (if __arg_y (setq _arg_y __arg_y)) _arg_y)
  (:serialization-length
   ()
   (+
    ;; int32 _arg_x
    4
    ;; int32 _arg_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _arg_x
       (write-long _arg_x s)
     ;; int32 _arg_y
       (write-long _arg_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _arg_x
     (setq _arg_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _arg_y
     (setq _arg_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_adder::Adder :md5sum-) "e786a8255416662901d0f10732f9d69a")
(setf (get ros_adder::Adder :datatype-) "ros_adder/Adder")
(setf (get ros_adder::Adder :definition-)
      "int32 arg_x
int32 arg_y

")



(provide :ros_adder/Adder "e786a8255416662901d0f10732f9d69a")


