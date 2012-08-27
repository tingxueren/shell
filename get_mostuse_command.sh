
set -o history
#echo
commands=`eval history | awk '{CMD[$4]++;count++;} END { for (a in CMD )print CMD[ a ]" " CMD[ a ]/count*100 "% " a }' | grep -v "./" | column -c3 -s " " -t |sort -nr | nl | head -n10`
echo "$commands"
#echo "$(history)"
exit 0
