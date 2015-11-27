#/usr/bin/bash
set -e 
set -x

cd ~/Daily
pd=`date '+%Y-%m-%d'`
mkdir -p $pd
cd $pd
fn=`date '+%H %M %S'`.tif
scanimage -d "smfp:usb;04e8;342a;Z0RABAISA01723E" --format tiff  > "$fn"
gimp --no-data --no-fonts --as-new "$fn" &
sleep 10
rm "$fn"