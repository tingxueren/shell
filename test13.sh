#!/bin/bash


PAT=$1
FILE=$2
mygrep() {
	echo $PAT 
	echo $FILE
	sed -n "/$PAT/p" $FILE
}

mygrep
