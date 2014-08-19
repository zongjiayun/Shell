

改变表的 location，防止意外破坏数据

create database recommenddb;
use recommenddb;
drop table user_click_sup_d;
create external table if not exists user_click_sup_d(
user_id string,
deal_id int,
create_time string,
cookies_id string,
device_id string
) partitioned by (partitiontime string)
row format delimited fields terminated by ',' 
location '/input/lbs/recommend/user_click_sup_d' ;
alter table user_click_sup_d set serdeproperties('serialization.null.format' = '');





// 添加了两列：
ju_version int, // 确认这列的类型

page_stats_w string




/tmp/testlzo/201408/20140816


use recommenddb;alter table user_click_sup_d add partition (partitiontime='20140101') location '/input/lbs/recommend/user_click_sup_d/partitiontime=20140401'