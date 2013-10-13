#!/bin/bash
#Author: tingxueren
#Description: unzip with GB18030
#Date: 2012/01/13


#Get the parameters  
file=$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
to_charset=GB18030 

unzip -O $to_charset $file

