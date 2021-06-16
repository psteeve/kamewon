(in-package :kamewon.file-server)

(define-easy-handler (uploads :uri "/api/uploads")
    ()
  (setf (hunchentoot:content-type*) "application/json")
  (with-output-to-string (*standard-output*)
    (if (post-parameters*)
        (progn 
          (dolist (params (post-parameters*))
            (let ((path (second params))
                  (filename (third params)))
              (rename-file path (format nil "~a~a" *kamewon-directory* filename))
              (format t "~a~10t~a~10t~S~%" path filename params)))
          (yason:encode "{\"ok\": true}"))
        (yason:encode "{\"ok\": false}"))))

(define-easy-handler (uploaded-files :uri "/api/uploaded-files")
    ()
  (setf (hunchentoot:content-type*) "application/json")
  (jojo:to-json (list-uploaded-files)))

;;; TODO Add a route to send to the server the list of file name the client will upload
;;; The client can ask the server if it has uploaded everything
