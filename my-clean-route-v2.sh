#!/bin/bash

echo "删除默认路由,设置新的路由"
route del default
route add default gw 192.168.149.254
[ $? -eq 0 ] && echo "set default gw success."

IP=
MASK=

#route -n
route -n > /tmp/route.$$
awk '$1 ~/[0-9][0-9*]/ {print $1, $3;}' /tmp/route.$$  > /tmp/deletroute.$$
echo "test"
#awk '$1 ~/[0-9][0-9*]/ { IP=$1; MASK=$3; printf "%s\t%s\n", $IP, $MASk;}' /tmp/route.$$
#[ $? -ne 0 ] && echo "ERROR: please check!"

# awk 中的变量相当于c中的变量，用的时候一般不需要前面加$,并且变量和shell中的不能通用，可以
# 认为是shell调用的awk函数
#cat /tmp/deletroute.$$ | awk '{IP=$1; MASK=$2; printf "IP: %s\t MASK: %s\n", IP, MASK;}'
awk '{cmd="route del -net "$1 " netmask "$2; system(cmd)}' /tmp/deletroute.$$
[ $? -eq 0 ] && echo "deleted all route."
#awk '{cmd="echo " $1 $2; system(cmd)}' /tmp/deletroute.$$
#awk '{cmd="printf \"%s\\t%s\\n\"" $1  $2; system(cmd)}' /tmp/deletroute.$$
#echo $IP
#echo $MASK
	
