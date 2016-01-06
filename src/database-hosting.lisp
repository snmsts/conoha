(in-package :cl-user)
(defpackage conoha.database-hosting
  (:use :cl :conoha.identity :conoha.conf)
  (:export))

(in-package :conoha.database-hosting)
#|
<a href="paas-database-get-version-list.html">バージョン情報取得</a>
<a href="paas-database-get-version-detail.html">バージョン情報詳細取得</a>
<a href="paas-database-create-database-service.html">サービス作成</a>
<a href="paas-database-list-database-service.html">サービス一覧取得</a>
<a href="paas-database-get-database-service.html">サービス情報取得</a>
<a href="paas-database-update-database-service.html">サービス更新</a>
<a href="paas-database-delete-database-service.html">サービス削除</a>
<a href="paas-database-get-database-quotas.html">データベース上限値取得</a>
<a href="paas-database-update-database-quotas.html">データベース上限値変更</a>
<a href="paas-database-create-database-backup.html">バックアップ有効無効</a>
<a href="paas-database-create-database.html">データベース作成</a>
<a href="paas-database-list-database.html">データベース一覧取得</a>
<a href="paas-database-get-database.html">データベース情報取得</a>
<a href="paas-database-update-database.html">データベース更新</a>
<a href="paas-database-delete-databases.html">データベース削除</a>
<a href="paas-database-create-grant.html">データベース権限作成</a>
<a href="paas-database-list-grant.html">データベース権限一覧取得</a>
<a href="paas-database-delete-grant.html">データベース権限削除</a>
<a href="paas-database-list-database-backup.html">バックアップ一覧</a>
<a href="paas-database-restore-database-backup.html">リストア</a>
<a href="paas-database-create-database-account.html">アカウント作成</a>
<a href="paas-database-list-database-account.html">アカウント一覧取得</a>
<a href="paas-database-get-database-account.html">アカウント情報取得</a>
<a href="paas-database-update-database-account.html">アカウント更新</a>
<a href="paas-database-delete-database-account.html">アカウント削除</a>
|#
