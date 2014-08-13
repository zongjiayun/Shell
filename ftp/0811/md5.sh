

FILES=`ls -l | awk '{print $9}' | sed '/^$/d'`

for file in $FILES
do
	md5sum $file
done
