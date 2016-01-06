#|
  This file is a part of conoha project.
  Copyright (c) 2016 SANO Masatoshi (snmsts@gmail.com)
|#

#|
  conoha

  Author: SANO Masatoshi (snmsts@gmail.com)
|#

(in-package :cl-user)
(defpackage conoha-asd
  (:use :cl :asdf))
(in-package :conoha-asd)

(defsystem conoha
    :version "0.1"
    :author "SANO Masatoshi"
    :mailto "snmsts@gmail.com"
    :license "MIT"
    :depends-on (:dexador :jonathan)
    :components ((:module "src"
                          :components
                          ((:file "conf")
                           (:file "identity" :depends-on ("conf"))
                           (:file "account" :depends-on ("identity"))
                           (:file "compute" :depends-on ("identity"))
                           (:file "block-strage" :depends-on ("identity"))
                           (:file "image" :depends-on ("identity"))
                           (:file "network" :depends-on ("identity"))
                           (:file "object-strage" :depends-on ("identity"))
                           (:file "database-hosting" :depends-on ("identity"))
                           (:file "dns" :depends-on ("identity"))
                           (:file "mail-hosting" :depends-on ("identity")))))
    :description "conoha"
    :in-order-to ((test-op (load-op :conoha.test))))
