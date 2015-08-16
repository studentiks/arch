# exit if error occurs
# set -e 
pgrep -P `pgrep openbox` | grep -v $$ | xargs -I PID kill PID
sleep 3
cnt=`pgrep -c -P \`pgrep openbox\``
if [ "$cnt"="0" ]; then
 openbox --exit
fi