cd ~/Daily
pd=`date '+%Y-%m-%d'`
mkdir -p $pd
cd $pd
fn=`date '+%H %M %S'`.xwd
xwd -root -out "$fn"
gimp --no-data --no-fonts --as-new "$fn" &
sleep 10
rm "$fn"