#!/bin/bash
# who-live.sh
# 扫描整个局域网，通过arp查询mac地址，比对查找谁在线上
# 主要用来监视老方，运行起来因为要扫描整个局域网，比较慢
# 大概要耗时250s

echo
echo "Now time is `date`."
# 由于有多个网卡存在的情况，必须要查看当前使用的网卡，arping 默认的是 eth0
NETWORK=$(ifconfig | grep Bcast | awk '{print $3}'| sed -e "s/^.*://g" -e "s/.255//g")
INTERFACE=$(ifconfig | grep -B 1 Bcast | grep Link | awk '{print $1}')

echo "NETWORK = $NETWORK.0"
echo "INTERFACE = $INTERFACE"
# apring 参数 -I 指定所使用的网卡
for ip in {1..254}; do arping -c 1 -I $INTERFACE $NETWORK.$ip >> /tmp/arp.$$; done

cat /tmp/arp.$$ | grep "\[" | awk '{print $4, $5}' | sed -e 's/\[//g' -e 's/\]//g' > /tmp/mac-ip.$$
cat /tmp/arp.$$ | grep "\[" | awk '{print $5}' | sed -e 's/\[//g' -e 's/\]//g' > /tmp/mac.$$

MAC=$(cat /tmp/mac.$$)
for mac in $MAC;
do
	ip=$(cat /tmp/mac-ip.$$ | grep $mac | awk '{print $1}')
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
echo "This script has been running $SECONDS seconds."
