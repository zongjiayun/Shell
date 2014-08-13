#!/bin/sh


START=`date +%s%N`;
echo "Data trans start at "$START



LOCAL_DIR=/tmp/hdfs
FILENAME=""
mkdir $LOCAL_DIR
FILE_ARRAY=($(hdfs dfs -du -h /input/lbs/recommend/user_click_sup_d/partitiontime=20140407 | awk '{print $3}'))

CYC=${#FILE_ARRAY[@]}  


for((i=0;i<$CYC;i++))
do 
	
	HDFSFILEPATH=${FILE_ARRAY[i]}
	FILENAME=`echo $HDFSFILEPATH | awk -F'/' '{print $7}'`
	hdfs dfs -get $HDFSFILEPATH $LOCAL_DIR
	
	echo "downloading file:"$HDFSFILEPATH
	echo "transfering file:"$LOCAL_DIR/$FILENAME
	
done


DOWNLOADEND=`date +%s%N`;
sh ./upload_2.sh $LOCAL_DIR

#rm -rf $LOCAL_DIR

END=`date +%s%N`;
echo "Data trans end at "$END


downloadtime=$((END-DOWNLOADEND))
downloadtime=`expr $time / 1000000`
time=$((END-START))
time=`expr $time / 1000000`
echo "download time:"${downloadtime}ms
echo "total time:"${time}ms
