(require :swank)

(in-package :livecoding)

(defparameter *stop* nil)

;; Credit: from Bagger's Youtube Channel
;; video: https://www.youtube.com/watch?v=6pMyhrDcMzw
;; This ensures that a compilation error doesn't freeze the system.
(defmacro continuable (&body body)
  `(restart-case
       (progn ,@body)
     (continue () :report "Continue")))

(defun update-swank ()
  (let ((connection (or swank::*emacs-connection* (swank::default-connection))))
    (when connection
      (swank::handle-requests connection t))))

(defun start (fxn)
  "Start the application.
  fxn: function to call"
  (if (eq nil swank::*servers*)
      (swank:create-server :port 4006 :dont-close t))
  (format t "Starting...~%")
  (setf *stop* nil)
  (loop while (eq *stop* nil) do
       (update-swank)
       (funcall fxn)))

(defun stop ()
  "Stop the application loop"
  (setf *stop* t)
  (format t "Stopped.~%"))

;;
;; Example on how livecoding can be used.
;;
(defparameter *counter* 0)

(defun demoloop ()
  "mainloop is a simple hello world loop that demostrates
how livecoding works.
CL-USER> (livecoding:init)
CL-USER> (livecoding:start #'demoloop)
...
CL-USER> (livecoding:stop)"
  (dostuff))

(defun dostuff ()
  (sleep 1)
  (format *standard-output* "Hello World: ~A~%" *counter*)
  (incf *counter*))

