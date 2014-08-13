
#!/bin/bash

LOCAL_DIR=$1

ftp -n<<!
open 1ip
user xx xx
binary
hash
cd /shellcontinuous
lcd $LOCAL_DIR
prompt
mput *
close
bye
!


