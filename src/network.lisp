(in-package :cl-user)
(defpackage conoha.network
  (:use :cl :conoha.identity :conoha.conf)
  (:export))

(in-package :conoha.network)
#|
<a href="neutron-get_version_list.html">バージョン情報取得</a>
<a href="neutron-get_version_detail.html">バージョン情報詳細取得</a>
<a href="neutron-get_networks_list.html">ネットワーク一覧取得</a>
<a href="neutron-get_networks_detail_specified.html">ネットワーク詳細取得</a>
<a href="neutron-add_network.html">ネットワーク追加(ローカルネット用)</a>
<a href="neutron-remove_network.html">ネットワーク削除</a>
<a href="neutron-get_ports_list.html">ポート一覧取得</a>
<a href="neutron-get_ports_detail_specified.html">ポート詳細取得</a>
<a href="neutron-add_port.html">ポート追加</a>
<a href="neutron-update_port.html">ポート更新/セキュリティグループ割り当て</a>
<a href="neutron-remove_port.html">ポート削除</a>
<a href="neutron-get_subnets_list.html">サブネット一覧取得</a>
<a href="neutron-get_subnets_detail_specified.html">サブネット詳細取得</a>
<a href="neutron-add_subnet.html">サブネットの払い出し(ローカルネット用)</a>
<a href="neutron-add_subnet_for_addip.html">サブネットの払い出し(追加IP用)</a>
<a href="neutron-add_subnet_for_lb.html">サブネットの払い出し(LB用)</a>
<a href="neutron-remove_subnet.html">サブネットの削除</a>
<a href="neutron-get_pools_list.html">POOL一覧取得</a>
<a href="neutron-get_pools_detail_specified.html">POOL詳細取得</a>
<a href="neutron-add_pool.html">POOL追加（バランシング指定）</a>
<a href="neutron-change_balancer_type.html">POOL更新(バランシング方式の変更)</a>
<a href="neutron-delete_pool.html">POOL削除</a>
<a href="neutron-get_vips_list.html">VIP一覧取得</a>
<a href="neutron-get_vips_detail_specified.html">VIP詳細取得</a>
<a href="neutron-create_vip.html">VIP作成</a>
<a href="neutron-remove_vip.html">VIP削除</a>
<a href="neutron-get_members_list.html">REAL（member）一覧取得</a>
<a href="neutron-get_members_detail_specified.html">REAL（member）詳細取得</a>
<a href="neutron-add_member.html">REAL（member）追加</a>
<a href="neutron-update_member.html">REAL(member)起動/停止</a>
<a href="neutron-remove_member.html">REAL(member)削除</a>
<a href="neutron-get_healthmonitors_list.html">ヘルスモニタ一覧取得</a>
<a href="neutron-get_healthmonitors_detail_specified.html">ヘルスモニタ詳細取得</a>
<a href="neutron-create_health_monitor.html">ヘルスモニタ作成</a>
<a href="neutron-change_health_monitor.html">ヘルスモニタ更新</a>
<a href="neutron-delete_health_monitor.html">ヘルスモニタ削除</a>
<a href="neutron-set_health_monitor_on_pool.html">ヘルスモニタの関連付け</a>
<a href="neutron-deallocate_health_monitor.html">ヘルスモニタの関連付け解除</a>
<a href="neutron-get_secgroups_list.html">セキュリティグループ一覧取得</a>
<a href="neutron-get_secgroups_detail_specified.html">セキュリティグループ詳細取得</a>
<a href="neutron-create_secgroup.html">セキュリティグループ作成</a>
<a href="neutron-update_secgroup.html">セキュリティグループ更新</a>
<a href="neutron-delete_secgroup.html">セキュリティグループ削除</a>
<a href="neutron-get_rules_on_secgroup.html">セキュリティグループ ルール一覧取得</a>
<a href="neutron-get_rules_detail_specified.html">セキュリティグループ ルール詳細取得</a>
<a href="neutron-create_rule_on_secgroup.html">セキュリティグループ ルール作成</a>
<a href="neutron-delete_rule_on_secgroup.html">セキュリティグループ ルール削除</a>
|#
