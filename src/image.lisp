(in-package :cl-user)
(defpackage conoha.image
  (:use :cl :conoha.identity :conoha.conf)
  (:export))

(in-package :conoha.image)
#|
<a href="image-get_version_list.html">バージョン情報取得</a>
<a href="image-get_images_list.html">イメージ一覧取得(glance)</a>
<a href="image-get_images_detail_specified.html">イメージ詳細取得(アイテム指定)(glance)</a>
<a href="image-get_schemas_images_list.html">イメージコンテナのスキーマ情報取得</a>
<a href="image-get_schemas_image_list.html">イメージのスキーマ情報取得</a>
<a href="image-get_schemas_members_list.html">イメージメンバーコンテナのスキーマ情報取得</a>
<a href="image-get_schemas_member_list.html">イメージメンバーのスキーマ情報取得</a>
<a href="image-get_members_list.html">イメージメンバー一覧取得</a>
<a href="image-remove_image.html">イメージ削除</a>
<a href="image-set_quota.html">イメージ保存容量制限</a>
<a href="image-get_quota.html">イメージ保存容量制限情報取得</a>
|#
