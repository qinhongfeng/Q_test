#计算感知训练营（6课时）的学员数据
#0417市场部需求，所需表头：用户ID、年级、姓名、电话、收件地址、付款时间、订单编号
#条件：ol_package.name like "7天计算训练营%"

select 
u.id '用户ID'    #ol_user.id
,(case u.attend_class when 1 then "幼儿园小班" when 2 then "幼儿园中班"
when 3 then "幼儿园大班" when 4 then "小学一年级" when 5 then "小学二年级" else "小学三年级" end) '年级'
,u.name '学生姓名'    #ol_user.name
,ocal.consignee '收件人姓名'
,u.mobile '电话'   #ol_user.mobile
,ocal.mail_address '收件地址'
,FROM_UNIXTIME(o.pay_time) '付款时间'  #ol_order.pay_time
,o.order_number '订单编号'  #ol_order.order_number
,p.name '套餐名称'
from ol_order o 
left join ol_package p
on o.package_id=p.id
left join ol_user u
on o.user_id=u.id
LEFT join ol_user_list ul
on ul.user_id =u.id
left join ol_order_class_apply_log ocal
on ocal.user_id=u.id
where p.name like "7天计算训练营%" 




SELECT user_id,phone from ol_user_address where user_id=21093209

SELECT id,mobi from ol_user_address where user_id=21093209
#------------------------------------------------
#attend_class1:幼儿园小班、2:幼儿园中班、3:幼儿园大班、4:小学一年级、5:小学二年级、6:小学三年级
select 
u.id '用户ID'
,u.name '学生姓名'
,(case u.attend_class when 1 then "幼儿园小班" when 2 then "幼儿园中班"
when 3 then "幼儿园大班" when 4 then "小学一年级" when 5 then "小学二年级" else "小学三年级" end) '年级'
,ua.name '收件人姓名'
,u.mobile '电话1'
,ua.phone '收件电话'
,if(ua.phone is null,u.mobile,ua.phone) '联系方式汇总'
,pc.name '省份'
,pc1.name '城市'
,ua.address '收件地址'
,ua.status '地址状态'
,FROM_UNIXTIME(o.pay_time)'付款时间'
,o.order_number '订单编号'
,o.pay_price '支付金额'
,p.name '套餐名称'
from ol_user u
left join ol_user_address ua
on u.id=ua.user_id
left join ol_order o
on u.id=o.user_id
left join ol_package p
on o.package_id=p.id
left join ol_user_list ul
on u.id=ul.user_id
left join ol_plugin_cityfour pc on ul.province=pc.id
left join ol_plugin_cityfour pc1 on ul.city=pc1.id
where p.name like "7天计算训练营%"

select id,name from ol_user where id = 20957137

select * from ol_admin_user limit 10






