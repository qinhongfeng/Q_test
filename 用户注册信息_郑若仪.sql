-- #4月1号至21号注册数据 to 郑若仪
-- 用户ID、注册时间、来源、最后一次约课时间、最后一条跟进状态、最后一条跟进结果、首次出席时间
select 
u.id '用户ID'
,FROM_UNIXTIME(u.create_time) '注册时间'
,us.name '来源'
,FROM_UNIXTIME(ul.last_follow_time)'最后一个跟进时间'
,GROUP_CONCAT(u.follow_status) '跟进状态'
,GROUP_CONCAT(u.follow_result ) '跟进结果'

,GROUP_CONCAT(ul.last_follow_records)'最后跟进状态'
,ul.last_follow_desc '最后跟进记录跟进内容'
,FROM_UNIXTIME(ul.first_attend_at) '首次出席时间'
,FROM_UNIXTIME(ul.cc_follow_time) 'CC最后跟进时间'
,GROUP_CONCAT(ulf.description,'////')'跟进内容'
from ol_user u
left join ol_user_source us
on u.source=us.id
left join ol_user_list ul
on ul.user_id=u.id
left join ol_user_list_follow ulf
on ulf.user_id=u.id
where u.create_time BETWEEN UNIX_TIMESTAMP('2019-03-22') and UNIX_TIMESTAMP('2019-03-25')
group by u.id
order by 注册时间









