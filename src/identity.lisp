(in-package :cl-user)
(defpackage conoha.identity
  (:use :cl :conoha.conf)
  (:export :id :tenant-id :tokens :*token*))

(in-package :conoha.identity)

(defun identity-uri ()
  (format nil "https://identity.~A.conoha.io/v2.0" *region*))

(defclass token ()
  ((id :accessor id :initarg :id)
   (tenant-id :accessor tenant-id :initarg :tenant-id)))

(defun tokens (&key (tenant-id *tenant-id*) (user *api-user*) (password *password*))
  (let ((result (jonathan:parse
                 (dex:post (format nil "~A/tokens" (identity-uri))
                           :headers '(("Accept" . "application/json"))
                           :content
                           (jonathan:to-json `(:|auth| (:|passwordCredentials|
                                                         (:|username| ,user
                                                           :|password| ,password)
                                                         :|tenantId| ,tenant-id)
                                                ))))))
    (values (make-instance 'token
                           :id (getf (getf (getf result :|access|) :|token|) :|id|)
                           :tenant-id tenant-id)
            result)))

(defvar *token* nil)
