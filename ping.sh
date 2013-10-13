#!/bin/bash
# ping all network

for i in {1..254}
do
	ping -c 1 74.125.235.$i
done	
