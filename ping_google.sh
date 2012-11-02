#!/bin/bash
# Filename: ping_google.sh
# Descritption: get the status of google server

CN_DOME=203.208.47
JP_DOME=173.194.38

echo "google CN server status." 

for ip in {1..10} 
do 
	ping -n -c 5 $CN_DOME.$ip | grep -B 2 rtt
done	

echo "google JP server status." 

for ip in {1..10} 
do 
	ping -n -c 5 $JP_DOME.$ip | grep -B 2 rtt
done	
