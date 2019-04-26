#老师排班数据  当天在岗教师

select 
date(FROM_UNIXTIME(l.class_date))
,au.name '老师姓名'
,au.nickname '老师艺名'
-- ,etw.week '星期几'
,etw.hour '时间点'
,case l.course_type when 1 then '正课' when 2 then 'Demo课' else '未排课' end '排课明细'
,(case au.status when 1 then '在职' else '离职' end) '在职状态'
from 
ol_edu_teach_work etw
left join ol_admin_user au
on etw.teacher_id=au.id
left join ol_live l
on l.teacher_id=etw.teacher_id
where l.`status`=1
and etw.week = '1'

and l.class_date = UNIX_TIMESTAMP('2019-04-22')




-- 冬勇
SELECT DATE(FROM_UNIXTIME(start_time))'日期'
,hour_date '上课时间'
,CASE au.`status` WHEN 1  THEN '在职' ELSE '离职' END '老师状态'
,teacher_id '老师'
,au.nickname
,IF( course_type in (1,6), '正课','DEMO课')'课程类型'
,IF(student_total>0,'已排课','未排课')
FROM ol_edu_plan ep
LEFT JOIN ol_admin_user au on ep.teacher_id=au.id
where ep.`status`=1
AND DATE(FROM_UNIXTIME(ep.start_time))>='2019-4-22'
#AND DATE(FROM_UNIXTIME(start_time))<='2019-3-31' 
AND course_type in (1,2,3,6)
ORDER BY 日期,上课时间


--冬勇导出数据版

SELECT DATE(FROM_UNIXTIME(start_time))'日期'
,hour_date '上课时间'
,CASE au.`status` WHEN 1  THEN '在职' ELSE '离职' END '老师状态'
,teacher_id '老师'
,au.nickname
,IF( course_type in (1,6), '正课','DEMO课')'课程类型'
,IF(student_total>0,'已排课','未排课')
FROM ol_edu_plan ep
LEFT JOIN ol_admin_user au on ep.teacher_id=au.id
where ep.`status`=1
AND DATE(FROM_UNIXTIME(ep.start_time))='2019-4-25'
#AND DATE(FROM_UNIXTIME(start_time))<='2019-3-31' 
AND course_type in (1,2,3,6)
ORDER BY 日期,上课时间








select u.name 
,FROM_UNIXTIME(o.pay_time) '支付时间'
,o.pay_price '支付价格'
from ol_user u
left join ol_order o
on u.id=o.user_id
where u.id=21081703