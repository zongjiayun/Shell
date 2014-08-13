#!/bin/bash

PAR_ARRAY=($(hdfs dfs -ls /input/lbs/recommend/user_click_sup_d | awk '{print $8}' | sed '/^$/d' | awk -F '=' '{print $2}' | grep -v bak))
CYC=${#PAR_ARRAY[@]}  
FROM_PARTITION=""
TO_PARTITION=""
for((i=0;i<$CYC;i++))
do 
	if [ $i -eq 0 ] 
	   then
		 TO_PARTITION=20140101
	else
		TO_PARTITION=${PAR_ARRAY[`expr $i - 1`]}
	fi
	 
	FROM_PARTITION=${PAR_ARRAY[i]}
	
	echo $i" from:"$FROM_PARTITION"  to:"$TO_PARTITION
	hive -e "insert overwrite table recommenddb.user_click_sup_d PARTITION (partitiontime='$TO_PARTITION') select user_id,deal_id,create_time,cookies_id,device_id,case floor(rand(10)*10) when 0 then 0 when 1 then 0 when 2 then 0 when 3 then 1 when 4 then 1 when 5 then 1 when 6 then 1 else 2 end from recommenddb.user_click_sup_d where partitiontime='$FROM_PARTITION'"
	
done

hive -e "ALTER TABLE recommenddb.user_click_sup_d DROP PARTITION (partitiontime='$FROM_PARTITION')"

