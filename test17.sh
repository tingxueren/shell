#!/bin/bash

LOG=/tmp/openvpn.log
GW=$(route | grep default | awk '{print $2}')
echo $GW >> $log
echo "$INFO $(date "+%d/%b/%Y:%H:%M:%S") custom_vpn started" >> $LOG

while read LINE
do
	echo $LINE >> $LOG
	exec $LINE >> $LOG
done < ./test.out	
