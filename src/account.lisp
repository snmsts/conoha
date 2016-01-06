(in-package :cl-user)
(defpackage conoha.account
  (:use :cl :conoha.identity :conoha.conf)
  (:export :account-get-version
           :account-get-version-ex
           :account-get-order-items
           :account-products
           :account-get-payment-history
           :account-get-payment-summary
           :account-billing-invoices
           :account-informations
           :account-informations-marking
           :account-get-objectstorage-request-rrd
           :account-get_objectstorage-size-rrd))

(in-package :conoha.account)

(defun account-uri ()
  (format nil "https://account.~A.conoha.io" *region*))

;;<a name="https://www.conoha.jp/docs/account-get_version_list">バージョン情報取得</a>
(defun account-get-version ()
  (jonathan:parse (dex:get (account-uri))))

;;<a href="https://www.conoha.jp/docs/account-get_version_detail.html">バージョン情報詳細取得</a>
(defun account-get-version-ex (&optional (token *token*))
  (jonathan:parse (dex:get (format nil "~A/v1" (account-uri))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/account-order-item-detail-specified.html">アイテム詳細取得(uu_id 指定)</a>
;;<a href="https://www.conoha.jp/docs/account-order-item-list.html">アイテム一覧取得</a>
(defun account-get-order-items (&key (token *token*) item-id)
  (setf item-id (if item-id (format nil "/~A" item-id) ""))
  (jonathan:parse (dex:get (format nil "~A/v1/~A/order-items~A"
                                   (account-uri) (tenant-id token) item-id)
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/account-products.html">申し込み可能商品一覧取得</a>
(defun account-products (&optional (token *token*))
  (jonathan:parse (dex:get (format nil "~A/v1/~A/product-items"
                                   (account-uri) (tenant-id token))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/account-payment-histories.html">入金履歴取得</a>
(defun account-get-payment-history (&optional (token *token*))
  (jonathan:parse (dex:get (format nil "~A/v1/~A/payment-history" (account-uri) (tenant-id token))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/account-payment-summary.html">入金サマリー取得</a>
(defun account-get-payment-summary (&optional (token *token*))
  (jonathan:parse (dex:get (format nil "~A/v1/~A/payment-summary" (account-uri) (tenant-id token))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/account-billing-invoices-list.html">請求データ一覧取得</a>
;;<a href="https://www.conoha.jp/docs/account-billing-invoices-detail-specified.html">請求データ明細取得(invoice_id 指定)</a>
(defun account-billing-invoices (&key (token *token*) offset limit invoice-id)
  (let ((param (if invoice-id
                   (format nil "/~A" invoice-id)
                   (if (or offset limit)
                       (format nil "?~A~A"
                               (if offset (format nil "offset=~A" offset) "")
                               (if limit (format nil "~Alimit=~A" (if offset "&" "") limit) ""))
                       ""))))
    (jonathan:parse (dex:get (format nil "~A/v1/~A/billing-invoices~A"
                                     (account-uri) (tenant-id token)
                                     param)
                             :headers `(("Accept" . "application/json")
                                        ("X-Auth-Token" . ,(id token)))))))

;;<a href="https://www.conoha.jp/docs/account-informations-list.html">告知一覧取得</a>
;;<a href="https://www.conoha.jp/docs/account-informations-detail-specified.html">告知詳細取得(notification_code 指定)</a>
(defun account-informations (&key (token *token*) offset limit notification-code)
  (let ((param (if notification-code
                   (format nil "/~A" notification-code)
                   (if (or offset limit)
                       (format nil "?~A~A"
                               (if offset (format nil "offset=~A" offset) "")
                               (if limit (format nil "~Alimit=~A" (if offset "&" "") limit) ""))
                       ""))))
    (jonathan:parse (dex:get (format nil "~A/v1/~A/notifications~A"
                                     (account-uri) (tenant-id token)
                                     param)
                             :headers `(("Accept" . "application/json")
                                        ("X-Auth-Token" . ,(id token)))))))

;;<a href="https://www.conoha.jp/docs/account-informations-marking.html">告知既読・未読変更</a>
(defun account-informations-marking (notification-code status &optional (token *token*))
  "doesn't work..."
  (assert (find status '("Unread" "ReadTitleOnly" "Read") :test #'equal))
  (jonathan:parse (dex:put (format nil "~A/v1/~A/notifications/~A"
                                   (account-uri) (tenant-id token)
                                   notification-code)
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token)))
                           :content
                           (jonathan:to-json
                            `(:|information| (:|read_status| ,status))))))


;;<a href="https://www.conoha.jp/docs/account-get_objectstorage_request_rrd.html">Object Storage 利用状況グラフ(リクエスト数)</a>
(defun account-get-objectstorage-request-rrd (&key (token *token*) start-date end-date mode)
  (let ((uri (quri:uri (format nil "~A/v1/~A/object-storage/rrd/request"
                                     (account-uri) (tenant-id token)))))
    (when start-date
      (push (cons "start_date_raw" start-date) (quri:uri-query-params uri)))
    (when end-date
      (push (cons "end_date_raw" end-date) (quri:uri-query-params uri)))
    (when mode
      (push (cons "mode" mode) (quri:uri-query-params uri)))
    (jonathan:parse (dex:get uri
                             :headers `(("Accept" . "application/json")
                                        ("X-Auth-Token" . ,(id token)))))))
;;<a href="https://www.conoha.jp/docs/account-get_objectstorage_size_rrd.html">Object Storage 利用状況グラフ(使用容量数)</a>
(defun account-get_objectstorage-size-rrd (&key (token *token*) start-date end-date mode)
  (let ((uri (quri:uri (format nil "~A/v1/~A/object-storage/rrd/size"
                               (account-uri) (tenant-id token)))))
    (when start-date
      (push (cons "start_date_raw" start-date) (quri:uri-query-params uri)))
    (when end-date
      (push (cons "end_date_raw" end-date) (quri:uri-query-params uri)))
    (when mode
      (push (cons "mode" mode) (quri:uri-query-params uri)))
    (jonathan:parse (dex:get uri
                             :headers `(("Accept" . "application/json")
                                        ("X-Auth-Token" . ,(id token)))))))
