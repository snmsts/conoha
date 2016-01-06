(in-package :cl-user)
(defpackage conoha.account
  (:use :cl :conoha.identity :conoha.conf)
  (:export :account-get-version :account-get-version-ex))

(in-package :conoha.account)

(defun account-uri ()
  (format nil "https://account.~A.conoha.io" *region*))

;;https://www.conoha.jp/docs/account-get_version_list.html
(defun account-get-version ()
  (jonathan:parse (dex:get (account-uri))))

;;https://www.conoha.jp/docs/account-get_version_detail.html
(defun account-get-version-ex (token)
  (jonathan:parse (dex:get (format nil "~A/v1" (account-uri))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;https://www.conoha.jp/docs/account-order-item-list.html 
(defun account-get-order-items (token)
  (jonathan:parse (dex:get (format nil "~A/v1/~A/order-items" (account-uri) (tenant-id token))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;https://www.conoha.jp/docs/account-order-item-detail-specified.html 
(defun account-get-payment-history (token)
  (jonathan:parse (dex:get (format nil "~A/v1/~A/payment-history" (account-uri) (tenant-id token))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))
;;10
;;https://www.conoha.jp/docs/account-products.html 
;;https://www.conoha.jp/docs/account-payment-histories.html 
;;https://www.conoha.jp/docs/account-payment-summary.html 
;;https://www.conoha.jp/docs/account-billing-invoices-list.html 
;;https://www.conoha.jp/docs/account-billing-invoices-detail-specified.html 
;;https://www.conoha.jp/docs/account-informations-list.html 
;;https://www.conoha.jp/docs/account-informations-detail-specified.html 
;;https://www.conoha.jp/docs/account-informations-marking.html 
;;https://www.conoha.jp/docs/account-get_objectstorage_request_rrd.html 
;;https://www.conoha.jp/docs/account-get_objectstorage_size_rrd.html 
