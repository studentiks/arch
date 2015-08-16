#!/usr/bin/bash

if [ `xrandr -q | grep -c HDMI1\\sconnected`=="1" ]; then
 #HDMI1 connected
 xrandr --output HDMI1 --auto --pos 0x0 --primary --output LVDS1 --mode 1600x900 --pos 1920x0 --noprimary
else
 xrandr --output HDMI1 --off --output LVDS1 --auto
fi
