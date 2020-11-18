;; Auto-generated. Do not edit!


(when (boundp 'gobang_motion::RobotMove)
  (if (not (find-package "GOBANG_MOTION"))
    (make-package "GOBANG_MOTION"))
  (shadow 'RobotMove (find-package "GOBANG_MOTION")))
(unless (find-package "GOBANG_MOTION::ROBOTMOVE")
  (make-package "GOBANG_MOTION::ROBOTMOVE"))
(unless (find-package "GOBANG_MOTION::ROBOTMOVEREQUEST")
  (make-package "GOBANG_MOTION::ROBOTMOVEREQUEST"))
(unless (find-package "GOBANG_MOTION::ROBOTMOVERESPONSE")
  (make-package "GOBANG_MOTION::ROBOTMOVERESPONSE"))

(in-package "ROS")





(defclass gobang_motion::RobotMoveRequest
  :super ros::object
  :slots (_row _col ))

(defmethod gobang_motion::RobotMoveRequest
  (:init
   (&key
    ((:row __row) 0)
    ((:col __col) 0)
    )
   (send-super :init)
   (setq _row (round __row))
   (setq _col (round __col))
   self)
  (:row
   (&optional __row)
   (if __row (setq _row __row)) _row)
  (:col
   (&optional __col)
   (if __col (setq _col __col)) _col)
  (:serialization-length
   ()
   (+
    ;; int8 _row
    1
    ;; int8 _col
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _row
       (write-byte _row s)
     ;; int8 _col
       (write-byte _col s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _row
     (setq _row (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _row 127) (setq _row (- _row 256)))
   ;; int8 _col
     (setq _col (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _col 127) (setq _col (- _col 256)))
   ;;
   self)
  )

(defclass gobang_motion::RobotMoveResponse
  :super ros::object
  :slots ())

(defmethod gobang_motion::RobotMoveResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass gobang_motion::RobotMove
  :super ros::object
  :slots ())

(setf (get gobang_motion::RobotMove :md5sum-) "e85690eba9eeffee9ca1b40bb8b34292")
(setf (get gobang_motion::RobotMove :datatype-) "gobang_motion/RobotMove")
(setf (get gobang_motion::RobotMove :request) gobang_motion::RobotMoveRequest)
(setf (get gobang_motion::RobotMove :response) gobang_motion::RobotMoveResponse)

(defmethod gobang_motion::RobotMoveRequest
  (:response () (instance gobang_motion::RobotMoveResponse :init)))

(setf (get gobang_motion::RobotMoveRequest :md5sum-) "e85690eba9eeffee9ca1b40bb8b34292")
(setf (get gobang_motion::RobotMoveRequest :datatype-) "gobang_motion/RobotMoveRequest")
(setf (get gobang_motion::RobotMoveRequest :definition-)
      "int8 row
int8 col
---
")

(setf (get gobang_motion::RobotMoveResponse :md5sum-) "e85690eba9eeffee9ca1b40bb8b34292")
(setf (get gobang_motion::RobotMoveResponse :datatype-) "gobang_motion/RobotMoveResponse")
(setf (get gobang_motion::RobotMoveResponse :definition-)
      "int8 row
int8 col
---
")



(provide :gobang_motion/RobotMove "e85690eba9eeffee9ca1b40bb8b34292")


