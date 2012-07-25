#!/bin/bash  
#Author:digglife  
#Description:Convert the charset of text file.  
#version:0.2  
#Date:2011/05/12  
#To Be Resovled:  
#  1.get filename without using $fileExtension varable.  
  
#Get the parameters  
file=$1  
to_charset=$2  
  
#Get the first character of the $file  
first_char=${file:0:1}  
  
#Test if the file exists,break if it doesn't  
if [ ! -f "$file" ];then  
    echo "$file,No such file or directory"  
    exit 1  
#If the given $file contains the directory,get the basename of it,and change dir to its directory.  
elif [ first_char="/" ];then  
    full_filename=$(basename $file)  
    cd $(dirname $file)  
else  
    full_filename=$file  
fi  
  
#Split the file extention and filename  
file_extension=$(echo $full_filename | sed 's/^.*\.//g')  
echo "file_extension=$file_extension"
filename=${full_filename%.$file_extension}  
echo "filename=$filename"  
#Get the original charset  
charset_org=$(file -i $full_filename | sed 's/^.*charset=//g')  
if [ charset_org -eq "iso-8859-1"] ; then
	charset_org="GB18030"
echo "charset_org=$charset_org"	
	
  
#Convert the charset,and change the full filename  
iconv  -f $charset_org -t $to_charset $full_filename > $filename.$to_charset.$file_extension
