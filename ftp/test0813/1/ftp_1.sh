#!/bin/sh


START=`date +%s%N`;
echo "Data trans start at "$START



LOCAL_DIR=/tmp
FILENAME=""
FILE_ARRAY=($(hdfs dfs -du -h /input/lbs/recommend/user_click_sup_d/partitiontime=20140407 | awk '{print $3}'))

CYC=${#FILE_ARRAY[@]}  

for((i=0;i<$CYC;i++))
do 

	
	HDFSFILEPATH=${FILE_ARRAY[i]}
	FILENAME=`echo $HDFSFILEPATH | awk -F'/' '{print $7}'`
	hdfs dfs -get $HDFSFILEPATH $LOCAL_DIR
	
	echo "downloading file:"$HDFSFILEPATH
	echo "transfering file:"$LOCAL_DIR/$FILENAME
	
	sh ./upload_1.sh $FILENAME
	
	rm -rf $LOCAL_DIR/$FILENAME
	
done



END=`date +%s%N`;
echo "Data trans end at "$END

time=$((END-START))
time=`expr $time / 1000000`
echo ${time}ms
