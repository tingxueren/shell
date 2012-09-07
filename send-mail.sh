#!/bin/bash
# 发送邮件，将监控记录自动发送到我的邮箱

MAIL_ADD=zhangdongsheng1224@gmail.com
ACCESSORY=/home/mars/monitor-result.txt
#echo $ACCESSORY
TRUE_ACCESS=$(basename $ACCESSORY)
ACCESSORY_NAME=$(basename $ACCESSORY | sed -e 's/\..*$//g')
#echo $ACCESSORY_NAME

while [ true ]
do	
	TIME=$(date -d today +"%Y-%m-%d-%H-%M")
	#echo $TIME
	SUBJECT=$(echo $TIME-$ACCESSORY_NAME)
	#echo $SUBJECT
	#echo $TIME-$ACCESSORY_NAME
	#uuencode $ACCESSORY $TRUE_ACCESS | mail -s $SUBJECT $MAIL_ADD
	mail -s $SUBJECT $MAIL_ADD < $ACCESSORY
	echo "send mail $SUBJECT to $MAIL_ADD at $TIME." >> send-mail.log
	sleep 3600
done	



