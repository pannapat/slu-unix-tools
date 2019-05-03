CURRENTMONTH=`date +%Y-%m`
#echo "$CURRENTMONTH"
#egrep '^2019-04' ~/chuala.log

egrep "^$CURRENTMONTH-[0-9][0-9] " ~/chuala.log
