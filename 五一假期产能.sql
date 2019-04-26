--五一假期产能统计

SELECT DATE(FROM_UNIXTIME(start_time))'日期'
,hour_date '上课时间'
,CASE au.`status` WHEN 1  THEN '在职' ELSE '离职' END '老师状态'
,teacher_id '老师'
,au.nickname
,IF( course_type in (1,6), '正课','DEMO课')'课程类型'
,IF(student_total>0,'已排课','未排课')
,ep.student_total '学生人数'
,ep.max_class_num '最大学生人数'
FROM ol_edu_plan ep
LEFT JOIN ol_admin_user au on ep.teacher_id=au.id
where ep.`status`=1
AND ep.start_time>=UNIX_TIMESTAMP('2019-5-01')
AND start_time<=UNIX_TIMESTAMP('2019-5-05')
AND course_type in (1,2,3,6)
ORDER BY 日期,上课时间









