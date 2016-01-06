(in-package :cl-user)
(defpackage conoha.compute
  (:use :cl :conoha.identity :conoha.conf)
  (:export ))
(in-package :conoha.compute)

(defun compute-uri ()
  (format nil "https://compute.~A.conoha.io" *region*))

;;<a href="https://www.conoha.jp/docs/compute-get_version_list.html">バージョン情報取得</a>
(defun compute-get-version ()
  (jonathan:parse (dex:get (format nil "~A/" (compute-uri)))))

;;<a href="https://www.conoha.jp/docs/compute-get_version_detail.html">バージョン情報詳細取得</a>
(defun compute-get-version-ex (token)
  (jonathan:parse (dex:get (format nil "~A/v2" (compute-uri))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/compute-get_flavors_list.html">VMプラン一覧取得</a>
(defun compute-get-flavors (token &optional flavor-id)
  (setq flavor-id (if flavor-id (format nil "/~A" flavor-id) ""))
  (jonathan:parse (dex:get (format nil "~A/v2/~A/flavors~A" (compute-uri) (tenant-id token) flavor-id)
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))

;;<a href="https://www.conoha.jp/docs/compute-get_flavors_detail.html">VMプラン詳細取得</a>
(defun compute-get-flavors-detail (token)
  (jonathan:parse (dex:get (format nil "~A/v2/~A/flavors/detail" (compute-uri) (tenant-id token))
                           :headers `(("Accept" . "application/json")
                                      ("X-Auth-Token" . ,(id token))))))


;;55
;;<a href="https://www.conoha.jp/docs/compute-get_flavors_detail_specified_.html">VMプラン詳細取得(アイテム指定)</a>
;;<a name="https://www.conoha.jp/docs/compute-get_vms_list">VM一覧取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_vms_detail.html">VM詳細取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_vms_detail_specified.html">VM詳細取得（アイテム指定)</a>
;;<a href="https://www.conoha.jp/docs/compute-create_vm.html">VM追加</a>
;;<a href="https://www.conoha.jp/docs/compute-delete_vm.html">VM削除</a>
;;<a href="https://www.conoha.jp/docs/compute-power_on_vm.html">VM起動</a>
;;<a href="https://www.conoha.jp/docs/compute-reboot_vm.html">VM再起動</a>
;;<a href="https://www.conoha.jp/docs/compute-stop_forcibly_vm.html">VM強制停止</a>
;;<a href="https://www.conoha.jp/docs/compute-stop_cleanly_vm.html">VM通常停止</a>
;;<a href="https://www.conoha.jp/docs/compute-re_install.html">OS再インストール</a>
;;<a href="https://www.conoha.jp/docs/compute-vm_resize.html">VMリサイズ</a>
;;<a href="https://www.conoha.jp/docs/compute-vm_resize_confirm.html">VMリサイズ（confirm）</a>
;;<a href="https://www.conoha.jp/docs/compute-vm_resize_revert.html">VMリサイズ（revert）</a>
;;<a href="https://www.conoha.jp/docs/compute-vnc_console.html">VNCコンソール</a>
;;<a href="https://www.conoha.jp/docs/compute-create_image.html">ローカルディスクのイメージ保存</a>
;;<a href="https://www.conoha.jp/docs/compute-hw_disk_bus.html">ストレージコントローラー変更</a>
;;<a href="https://www.conoha.jp/docs/compute-hw_vif_model.html">ネットワークアダプタ変更</a>
;;<a href="https://www.conoha.jp/docs/compute-hw_video_model.html">ビデオデバイスの変更</a>
;;<a href="https://www.conoha.jp/docs/compute-vnc_key_map.html">コンソールのキーマップ変更</a>
;;<a href="https://www.conoha.jp/docs/compute-web_serial_console.html">WEBシリアルコンソール(novaconsole)API</a>
;;<a href="https://www.conoha.jp/docs/compute-web_http_serial_console.html">WEBシリアルコンソール(httpconsole)API</a>
;;<a href="https://www.conoha.jp/docs/compute-insert_iso_image.html">ISOイメージの挿入</a>
;;<a href="https://www.conoha.jp/docs/compute-eject_iso_image.html">ISOイメージの排出</a>
;;<a href="https://www.conoha.jp/docs/compute-get_secgroups_status.html">セキュリティグループのサーバへの割り当て状態表示</a>
;;<a href="https://www.conoha.jp/docs/compute-get_keypairs.html">キーペア一覧取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_keypairs_detail_specified.html">キーペア詳細取得(アイテム指定)</a>
;;<a href="https://www.conoha.jp/docs/compute-add_keypair.html">キーペア追加</a>
;;<a href="https://www.conoha.jp/docs/compute-delete_keypair.html">キーペア削除</a>
;;<a href="https://www.conoha.jp/docs/compute-get_images_list.html">イメージ一覧取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_images_detail.html">イメージ詳細取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_images_detail_specified.html">イメージ詳細取得(アイテム指定)</a>
;;<a href="https://www.conoha.jp/docs/compute-get_volume_attachments.html">アタッチ済みボリューム一覧</a>
;;<a href="https://www.conoha.jp/docs/compute-get_volume_attachment_specified.html">アタッチ済みボリューム取得（アイテム指定)</a>
;;<a href="https://www.conoha.jp/docs/compute-attach_volume.html">ボリュームアタッチ</a>
;;<a href="https://www.conoha.jp/docs/compute-dettach_volume.html">ボリュームデタッチ</a>
;;<a href="https://www.conoha.jp/docs/compute-get_attached_ports_list.html">アタッチ済みポート一覧取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_attached_port_specified.html">アタッチ済みポート取得（アイテム指定)</a>
;;<a href="https://www.conoha.jp/docs/compute-attach_port.html">ポートアタッチ(VMに追加IPv4アドレスを割り当て)</a>
;;<a href="https://www.conoha.jp/docs/compute-dettach_port.html">ポートデタッチ(VMに割り当てた追加IPv4アドレスを削除)</a>
;;<a href="https://www.conoha.jp/docs/compute-update_metadata.html">VMのmetadataの更新（ネームタグの変更）</a>
;;<a href="https://www.conoha.jp/docs/compute-get_server_metadata.html">VMのmetadataの取得</a>
;;<a href="https://www.conoha.jp/docs/compute-get_server_addresses.html">VMに紐づくアドレス一覧</a>
;;<a href="https://www.conoha.jp/docs/compute-get_server_addresses_by_network.html">VMに紐づくアドレス一覧(ネットワーク指定)</a>
;;<a href="https://www.conoha.jp/docs/compute-get_cpu_utilization_graph.html">VPS利用状況グラフ（CPU使用時間）</a>
;;<a href="https://www.conoha.jp/docs/compute-get_interface_traffic_graph.html">VPS利用状況グラフ（インターフェイストラフィック）</a>
;;<a href="https://www.conoha.jp/docs/compute-get_disk_io_graph.html">VPS利用状況グラフ（ディスクIO）</a>
;;<a href="https://www.conoha.jp/docs/backup-get_backup_list.html">バックアップ一覧取得</a>
;;<a href="https://www.conoha.jp/docs/backup-get_backup_list_detailed.html">バックアップ一覧取得(backup id 指定)</a>
;;<a href="https://www.conoha.jp/docs/backup-start_backup.html">バックアップの申し込み</a>
;;<a href="https://www.conoha.jp/docs/backup-end_backup.html">バックアップの解約</a>
;;<a href="https://www.conoha.jp/docs/backup-restore_backup.html">ブートディスクバックアップのリストア</a>
;;<a href="https://www.conoha.jp/docs/backup-backup_to_image_object.html">ブート・追加ディスクバックアップのイメージ保存</a>
;;<a href="https://www.conoha.jp/docs/compute-iso-list-show.html">ISOイメージの一覧</a>
;;<a href="https://www.conoha.jp/docs/compute-iso-download-add.html">ISOイメージダウンロード</a>
