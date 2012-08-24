#!/bin/bash

lspath() {
	OLDIFS="$IFS"
	IFS=:
	for DIR in $PATH; do echo $DIR; done
	IFS="$OLDIFS"
}

lspath
