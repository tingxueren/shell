#!/bin/bash
echo "删除默认路由"
route del default

echo "删除已有路由"
route del -net 1.0.0.0    netmask 255.0.0.0 
route del -net 14.0.0.0    netmask 255.0.0.0 
route del -net 27.0.0.0    netmask 255.0.0.0 
route del -net 36.0.0.0    netmask 255.0.0.0 
route del -net 39.0.0.0    netmask 255.0.0.0 
route del -net 42.0.0.0    netmask 255.0.0.0 
route del -net 49.0.0.0    netmask 255.0.0.0 
route del -net 58.0.0.0    netmask 255.0.0.0 
route del -net 59.0.0.0    netmask 255.0.0.0 
route del -net 60.0.0.0    netmask 255.0.0.0 
route del -net 61.0.0.0    netmask 255.0.0.0 
route del -net 101.0.0.0    netmask 255.0.0.0 
route del -net 103.0.0.0    netmask 255.0.0.0 
route del -net 106.0.0.0    netmask 255.0.0.0 
route del -net 110.0.0.0    netmask 255.0.0.0 
route del -net 111.0.0.0    netmask 255.0.0.0 
route del -net 112.0.0.0    netmask 255.0.0.0 
route del -net 113.0.0.0    netmask 255.0.0.0 
route del -net 114.0.0.0    netmask 255.0.0.0 
route del -net 115.0.0.0    netmask 255.0.0.0 
route del -net 116.0.0.0    netmask 255.0.0.0 
route del -net 117.0.0.0    netmask 255.0.0.0 
route del -net 118.0.0.0    netmask 255.0.0.0 
route del -net 119.0.0.0    netmask 255.0.0.0 
route del -net 120.0.0.0    netmask 255.0.0.0 
route del -net 121.0.0.0    netmask 255.0.0.0 
route del -net 122.0.0.0    netmask 255.0.0.0 
route del -net 123.0.0.0    netmask 255.0.0.0 
route del -net 124.0.0.0    netmask 255.0.0.0 
route del -net 125.0.0.0    netmask 255.0.0.0 
route del -net 134.0.0.0    netmask 255.0.0.0 
route del -net 139.0.0.0    netmask 255.0.0.0 
route del -net 140.0.0.0    netmask 255.0.0.0 
route del -net 144.0.0.0    netmask 255.0.0.0 
route del -net 150.0.0.0    netmask 255.0.0.0 
route del -net 153.0.0.0    netmask 255.0.0.0 
route del -net 157.0.0.0    netmask 255.0.0.0 
route del -net 159.0.0.0    netmask 255.0.0.0 
route del -net 161.0.0.0    netmask 255.0.0.0 
route del -net 162.0.0.0    netmask 255.0.0.0 
route del -net 163.0.0.0    netmask 255.0.0.0 
route del -net 166.0.0.0    netmask 255.0.0.0 
route del -net 167.0.0.0    netmask 255.0.0.0 
route del -net 168.0.0.0    netmask 255.0.0.0 
route del -net 171.0.0.0    netmask 255.0.0.0 
route del -net 175.0.0.0    netmask 255.0.0.0 
route del -net 180.0.0.0    netmask 255.0.0.0 
route del -net 182.0.0.0    netmask 255.0.0.0 
route del -net 183.0.0.0    netmask 255.0.0.0 
route del -net 202.0.0.0    netmask 255.0.0.0 
route del -net 203.0.0.0    netmask 255.0.0.0 
route del -net 210.0.0.0    netmask 255.0.0.0 
route del -net 211.0.0.0    netmask 255.0.0.0 
route del -net 218.0.0.0    netmask 255.0.0.0 
route del -net 219.0.0.0    netmask 255.0.0.0 
route del -net 220.0.0.0    netmask 255.0.0.0 
route del -net 221.0.0.0    netmask 255.0.0.0 
route del -net 222.0.0.0    netmask 255.0.0.0 
route del -net 223.0.0.0    netmask 255.0.0.0 
route del -net 192.168.0.0  netmask 255.255.0.0 

route del -host 172.16.0.1  
route del -host 172.16.0.13
route del -host 106.187.36.10
route del -net 169.254.0.0    netmask 255.255.0.0 

echo "路由表已经删除完毕,开始恢复默认路由。"
route add default gw 192.168.149.254

