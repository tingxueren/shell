#!/bin/bash

find . -type f | while read file; 
do 
	if [ -x $file ]; then
		 echo $file
	fi	
done	
