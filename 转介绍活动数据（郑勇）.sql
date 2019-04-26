#转介绍数据导出（郑勇）

SELECT
            case pu.activity_id when 1 then "四月转介绍活动" else "" end "活动",
						ua.`name` as '推荐人姓名',
            u.mobile as '推荐人手机号',
            u.pay_status as '是否正课学员',
            ua.email as '邮箱',
            ua.region as 'region',
						pc3.name '省份'
						,pc4.name '城市',
						ua.region '省市区代码',
            ua.address as '收货地址',
						ocal2.mail_address'收货地址2',
            FROM_UNIXTIME(ua.update_time, '%Y-%m-%d %H:%i:%S') as '最近填写收货地址时间',
            cid.nickname as 'cc',
            tid.nickname as 'tmk',
            crid.nickname as '班主任',
            teid.nickname as '正课老师',
            oid.price as '推荐人9.9订单号',
            u.wx_name as '微信名',
            us.`name` as '来源渠道',
            FROM_UNIXTIME(pu.create_time, '%Y-%m-%d %H:%i:%S') as '创建时间',
--             FROM_UNIXTIME(ul.first_formal_class_time)'第一次上正课时间'
						FROM_UNIXTIME(ul.first_attend_at) '被推荐人首次出席时间',
            pu.user_id as 'uid',
            pu.invite_uid as 'iv_uid',
            pu.alg as '代数',
            uv.`name` as '被推荐人姓名',
            uv.mobile as '被推荐人手机号',
            uv.pay_status as '是否正课学员',
            uv.wx_name as 'vwx_name',
            uav.region as 'vregion',
						pc.name '被推荐人省份'
				    ,pc1.name '被推荐人城市',
						uav.region '省市区代码',
            uav.address as '被推荐人收货地址',
						ocal.mail_address'被推荐人收货地址2',
            cidv.nickname as 'vcc',
            tidv.nickname as 'vtmk',
            cridv.nickname as '班主任',
            teidv.nickname as '正课老师',
            oidv.price as '被推荐人9.9订单号',
            pu.activity_id as '参与活动'
            FROM
            ol_present_user pu
            LEFT JOIN ol_present p ON pu.present_id = p.id
            LEFT JOIN ol_user_source us ON us.id = p.present_channel_id
            LEFT JOIN ol_user u ON pu.user_id = u.id
            LEFT JOIN ol_user_address ua ON ua.id = u.address_id
            LEFT JOIN ol_admin_user au on au.id = u.market_uid
						left join ol_user_list ul
						on ul.user_id=pu.invite_uid
						left join ol_plugin_cityfour pc on ul.province=pc.id
						left join ol_plugin_cityfour pc1 on ul.city=pc1.id
						left join ol_user_list ul2 on ul2.user_id=pu.user_id
						left join ol_plugin_cityfour pc3 on ul2.province=pc3.id
						left join ol_plugin_cityfour pc4 on ul2.city=pc4.id
						left join ol_order_class_apply_log ocal on ocal.user_id=pu.invite_uid
						left join ol_order_class_apply_log ocal2 on ocal2.user_id=pu.user_id
						
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as cid ON u.counselor_id = cid.id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as tid ON u.tmk_uid = tid.id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as crid ON u.cr_uid = crid.id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as teid ON u.teacher_uid = teid.id
            LEFT JOIN (SELECT order_number as price,user_id FROM ol_order where `status` = 1 and package_id in(384,77,78,79,385,374,375,376,377,378) GROUP BY user_id) as oid ON pu.user_id = oid.user_id

            LEFT JOIN ol_user uv ON pu.invite_uid = uv.id
            LEFT JOIN ol_user_address uav ON uav.id = uv.address_id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as cidv ON uv.counselor_id = cidv.id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as tidv ON uv.tmk_uid = tidv.id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as cridv ON uv.cr_uid = cridv.id
            LEFT JOIN (SELECT id,nickname FROM ol_admin_user) as teidv ON uv.teacher_uid = teidv.id
            LEFT JOIN (SELECT order_number as price,user_id FROM ol_order where `status` = 1 and package_id in(384,77,78,79,385,374,375,376,377,378) GROUP BY user_id) as oidv ON pu.invite_uid = oidv.user_id

            where p.type = 0
						and pu.source_type = 1
            and pu.complete_status = 2
            order by pu.user_id
						
						
						
						
						
---城市匹配表导出
select * from ol_plugin_cityfour