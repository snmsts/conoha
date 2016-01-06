(in-package :cl-user)
(defpackage conoha.mail-hosting
  (:use :cl :conoha.identity :conoha.conf)
  (:export))

(in-package :conoha.mail-hosting)
#|
<a href="paas-mail-get-version-list.html">バージョン情報取得</a>
<a href="paas-mail-get-version-detail.html">バージョン情報詳細取得</a>
<a href="paas-mail-create-mail-service.html">サービス作成</a>
<a href="paas-mail-list-mail-service.html">サービス一覧取得</a>
<a href="paas-mail-get-service.html">サービス情報取得</a>
<a href="paas-mail-update-mail-service.html">サービス更新</a>
<a href="paas-mail-create-backup.html">バックアップ(有効/無効)</a>
<a href="paas-mail-delete-mail-service.html">サービス削除</a>
<a href="paas-mail-get-email-quotas.html">メール上限値取得</a>
<a href="paas-mail-update-email-quotas.html">メール上限値変更</a>
<a href="paas-mail-create-domain.html">ドメイン作成</a>
<a href="paas-mail-list-domain.html">ドメイン一覧取得</a>
<a href="paas-mail-delete-domain.html">ドメイン削除</a>
<a href="paas-mail-get-dedicated-ip.html">ドメインの個別IP割り当て情報取得</a>
<a href="paas-mail-create-dedicated-ip.html">ドメインの個別IP割り当て（登録/解除）</a>
<a href="paas-mail-create-email.html">メールアドレス作成</a>
<a href="paas-mail-list-email-domains.html">メールアドレス一覧取得</a>
<a href="paas-mail-get-email.html">メールアドレス情報取得</a>
<a href="paas-mail-delete-email.html">メールアドレス削除</a>
<a href="paas-mail-update-email-password.html">メールアドレスパスワード変更</a>
<a href="paas-mail-create-email-spam-filter.html">迷惑メールフィルタ（有効/無効）</a>
<a href="paas-mail-create-email-forwarding-copy.html">メール転送設定変更</a>
<a href="paas-mail-list-messages.html">メッセージ一覧取得</a>
<a href="paas-mail-get-messages.html">メッセージ取得</a>
<a href="paas-mail-get-messages-attachments.html">メッセージ添付ファイル取得</a>
<a href="paas-mail-delete-messages.html">メッセージ削除</a>
<a name="paas-mail-create-email-webhook"></a>自動実行作成</a>
<a href="paas-mail-list-email-filter.html">自動実行情報取得</a>
<a href="paas-mail-update-email-filter.html">自動実行更新</a>
<a href="paas-mail-delete-email-filter.html">自動実行削除</a>
<a href="paas-mail-list-email-whitelist.html">迷惑メールフィルタ許可一覧取得</a>
<a href="paas-mail-update-email-whitelist.html">迷惑メールフィルタ許可リスト更新</a>
<a href="paas-mail-list-email-blacklist.html">迷惑メールフィルタ拒否一覧取得</a>
<a href="paas-mail-update-email-blacklist.html">迷惑メールフィルタ拒否リスト更新</a>
<a href="paas-mail-create-email-forwarding.html">メール転送先追加</a>
<a href="paas-mail-list-email-forwarding.html">メール転送先一覧取得</a>
<a href="paas-mail-get-email-forwarding.html">メール転送先情報取得</a>
<a href="paas-mail-update-email-forwarding.html">メール転送先変更</a>
<a href="paas-mail-delete-email-forwarding.html">メール転送先解除</a>
|#
