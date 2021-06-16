(defpackage :kamewon.config
  (:use :common-lisp)
  (:export *kamewon-directory*
           *kamewon-gui-directory*))
(in-package :kamewon.config)

(defparameter *kamewon-directory* (uiop:native-namestring "~/.kamewon/uploads/"))

(defparameter *kamewon-gui-directory* (uiop:native-namestring "~/.kamewon/build/"))


