
#!/bin/bash

START=`date +%s%N`;
echo "Data trans start at "$START

ftp -n<<!
open 119.254.162.67
user rcuser 7b2bae7f4b7drOGo8EAFDF912
binary
hash
cd /test0811/shell1/date3
lcd /tmp/zjy-ftp/dat/20140429
prompt
mput *
close
bye
!


END=`date +%s%N`;
echo "Data trans end at "$END

time=$((END-START))
time=`expr $time / 1000000`
echo ${time}ms
