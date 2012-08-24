#!/bin/bash

# 必须用 `` 使得 date 和 awk 正常运行, 或者是 $() 这种形式
#DATE=`date|awk '{printf "%s-%s-%s-%s-%s", $1 ,$2, $3, $4, $6}'`
DATE=$(date|awk '{printf "%s-%s-%s-%s-%s", $1 ,$2, $3, $4, $6}')
# > 注意要用 >> 不要用 > 要用循环
for ip in {1..254}; do arping -c 1 192.168.149.$ip >> mac-ip-$DATE.txt; done

echo $(cat mac-ip-$DATE.txt | grep "\[" | awk '{printf "%s\n", $4}') > live-ip-$DATE.txt 
echo $(cat mac-ip-$DATE.txt | grep "\[" | awk '{printf "%s\n", $5}') | sed "s/\[//g"  | sed "s/\]//g" > live-mac-$DATE.txt 
