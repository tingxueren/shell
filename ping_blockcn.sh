#!/bin/bash
# Filename: ping_blockcn.net
# Descritption: get the status of blockcn.net

DOME=blockcn.net

for name in v1 v2 v3 v4 v5 v6 v07 v8 v9 v10 v13 hk jp jp2 jp3 jp4 
do 
	ping -c 3 $name.$DOME | grep -B 2 rtt
done	
