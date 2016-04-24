# to detect how many dB 
ffmpeg -i video.avi -af "volumedetect" -f null /dev/null

#to recode video with raised audio volume
ffmpeg -i ./input.mp4 -af "volume=25dB" -c:v copy -c:a aac -strict experimental -b:a 192k output.mp4
