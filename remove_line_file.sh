#!/bin/bash

remove_line_from_file ()
{
  if [ $# -ne 2 ]; then
    echo "[ERR] Invalid parameters!"
    echo ""
    return 1
  fi

  find_val=`grep ${1} ${2} | wc -l`
  echo $find_val
  if [ ${find_val} -eq 0 ] ; then
    echo "[WARN] There is no line in $2 matching you input "${1}". Please check it again."
    echo ""
    exit 1
  fi


  echo "remove_line_from_file $2"
  sed  -i "/${1}/d" $2
  echo "sed -i \"/${1}/d\" $2"

  return 0
}

remove_line_from_file   "mars"     "/home/mars/auth.log"

exit 0
