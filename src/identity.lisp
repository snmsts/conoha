(in-package :cl-user)
(defpackage conoha.identity
  (:use :cl :conoha.conf)
  (:export :id :tenant-id :tokens))

(in-package :conoha.identity)

(defun identity-uri ()
  (format nil "https://identity.~A.conoha.io/v2.0" *region*))

(defclass token ()
  ((id :accessor id :initarg :id)
   (tenant-id :accessor tenant-id :initarg :tenant-id)
   ))

(defun tokens (&key (tenant-id *tenant-id*) (user *api-user*) (password *password*))
  (let ((result (jonathan:parse
                 (dex:post (format nil "~A/tokens" (identity-uri))
                           :content
                           (jonathan:to-json `(:|auth| (:|passwordCredentials|
                                                         (:|username| ,user
                                                           :|password| ,password))
                                                :|tenantId| ,tenant-id))))))
    (make-instance 'token
                   :id (getf (getf (getf result :|access|) :|token|) :|id|)
                   :tenant-id tenant-id)))

#+nil
(setq *token* (tokens))
#+nil
(:|access|
 (:|metadata| (:|roles| NIL :|is_admin| 0) :|user|
  (:|name| "gncu22390130" :|roles| NIL :|id| "371efcbd70be410fb9af47153f87eea9"
   :|roles_links| NIL :|username| "gncu22390130")
  :|serviceCatalog| NIL :|token|
  (:|audit_ids| ("ZEjeOWh5T-uAtVwCYJVEQQ") :|id|
   "22d757e099b041b08fd53a29714c6e8f" :|expires| "2016-01-03T06:25:13Z"
   :|issued_at| "2016-01-02T06:25:13.122443")))
