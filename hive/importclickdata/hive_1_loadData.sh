

PARTITIONS=`hdfs dfs -ls /input/lbs/recommend/user_click_sup_d | awk '{print $8}' | sed '/^$/d' | awk -F '=' '{print $2}' | grep -v bak`
for partitiontime in $PARTITIONS
do
 echo "load partition ${partitiontime}"
 hive -e "use recommenddb;alter table user_click_sup_d add partition (partitiontime='${partitiontime}') location '/input/lbs/recommend/user_click_sup_d/partitiontime=${partitiontime}';"
done
