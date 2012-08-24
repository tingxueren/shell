#!/bin/bash

for ip in {1..254}; do arping -c 1 192.168.149.$ip >> /tmp/arp.$$; done
cat /tmp/arp.$$ | grep "\[" | awk '{print $4, $5}' | sed -e 's/\[//g' -e 's/\]//g' > /tmp/mac-ip.$$
cat /tmp/arp.$$ | grep "\[" | awk '{print $5}' | sed -e 's/\[//g' -e 's/\]//g' > /tmp/mac.$$
#sleep 10
#cat /tmp/mac-ip.$$ | awk '{print $2}' > mac.$$
#echo $(cat /tmp/mac-ip.$$ | awk '{print $2}') > mac.txt
MAC=$(cat /tmp/mac.$$)
#echo $MAC
for mac in $MAC;
do
#	MAC=$(echo $mac-ip | awk '{printf "%s", $5}' | sed -e 's/\[//g' -e 's/\]//g')
	ip=$(cat /tmp/mac-ip.$$ | grep $mac | awk '{print $1}')
#	mac=$(echo $mac_ip |awk 'print $2')
#	ip=$(cat /tmp/mac-ip.$$ | grep $mac | awk '{print $1}')
#	echo $mac $ip
#	echo $mac $ip
	case "$mac" in

		8[Cc]:89:[Aa]5:3[Bb]:59:[Cc][Aa]) 
		echo "何晓文 is online， IP is $ip, MAC is $mac";;
		8[Cc]:89:[Aa]5:39:5[Cc]:53) 
		echo "刘一龙 is online， IP is $ip, MAC is $mac";;
		8[Cc]:89:[Aa]5:3[Bb]:5[Cc]:87) 
		echo "卓雪寅 is online， IP is $ip, MAC is $mac";;
		8[Cc]:89:[Aa]5:3[Bb]:59:[Cc]1)
		echo "万季   is online， IP is $ip, MAC is $mac";;
		5[Cc]:33:8[Ee]:60:4[Bb]:4[Dd]) 
		echo "张东升 is online， IP is $ip, MAC is $mac";;
		8[Cc]:89:[Aa]5:39:5[Cc]:99)
		echo "朱雪梅 is online， IP is $ip, MAC is $mac";;
		8[Cc]:89:[Aa]5:75:[Aa]1:12) 
		echo "疑似老方 is online， IP is $ip, MAC is $mac";;
	esac
done	

rm -rf /tmp/arp.$$ /tmp/mac-ip.$$ /tmp/mac.$$
