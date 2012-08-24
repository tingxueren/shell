#!/bin/bash

LIVE_IP=$(cat $1)
DATE=$(date|awk '{printf "%s-%s-%s-%s-%s", $1 ,$2, $3, $4, $6}')

for ip in $LIVE_IP;
do nmap -APN -T4 $ip >> nmap-live-status-$DATE.txt;
done	
