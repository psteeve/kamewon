(defpackage :kamewon.file-client
  (:use :common-lisp
   :hunchentoot :lparallel
   :yason :pathname
   :zip)
  (:import-from :dexador :post)
  (:export
   :do-upload-files
   :do-upload-files-by-extension
   :do-list-uploaded-files))

(in-package :kamewon.file-client)

(setf lparallel:*kernel* (lparallel:make-kernel 4))

(defun do-upload-files (files server-url)
  (let ((chan (make-channel)))
    (dolist (file files)
      (submit-task chan
                   #'(lambda ()
                       (dex:post server-url ;;; TODO do something with response
                                 :content `(,(cons
                                              (pathname-name file)
                                              file))))))))

(defun do-list-uploaded-files (server-url)
  (dex:get server-url))

(defun do-upload-files-by-extension (dirname extension server-url)
  (do-upload-files (gethash extension
                            (pathname:file-by-extension dirname))
    server-url))

