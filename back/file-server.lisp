(defpackage :kamewon.file-server
  (:use
   :common-lisp
   :kamewon.config
   :hunchentoot :lparallel)
  (:export
   :init
   :stop-server
   :start-server))

(in-package :kamewon.file-server)

(defvar *port* 4110)

(defparameter *kamewon-server* (make-instance
                                'hunchentoot:easy-acceptor
                                :document-root *kamewon-gui-directory*
                                :port *port*))

(defun start-server ()
  (hunchentoot:start *kamewon-server*))

(defun stop-server ()
  (hunchentoot:stop *kamewon-server*))

(defun init ()
  (ensure-directories-exist *kamewon-directory*)
  (start-server))

(defun list-uploaded-files ()
  (mapcar #'(lambda (filename)
              (format nil "~a.~a"
                      (pathname-name filename)
                      (pathname-type filename)))
          (pathname:list-directory *kamewon-directory*)))
