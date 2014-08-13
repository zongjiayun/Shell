#!/bin/sh


LOCAL_DIR=/tmp
FILENAME=$1


echo "start upload file:"$LOCAL_DIR/$FILENAME
ftp -n<<!
open ip
user xx xxx
binary
cd /test0813/shella
lcd $LOCAL_DIR
prompt
put $LOCAL_DIR/$FILENAME $FILENAME 
close
bye
!

