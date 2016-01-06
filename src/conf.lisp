(in-package :cl-user)
(defpackage conoha.conf
  (:use :cl)
  (:export :*tenant-id* :*tenant-name* :*api-user* :*password* :*region*))

(in-package :conoha.conf)

(defparameter *tenant-id* "")
(defparameter *tenant-name* "")
(defparameter *api-user*   "")
(defparameter *password* "")
(defparameter *region* "tyo1")
