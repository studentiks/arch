#!/bin/fish

set hdmi (xrandr -q | grep -c -E "HDMI1\sconnected")
if test "$hdmi" = "1"
 xrandr --output HDMI2 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI1 --off --output DP1 --off --output eDP1 --off --output VIRTUAL1 --off
else
 # xrandr
end
