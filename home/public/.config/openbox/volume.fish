#!/bin/fish

if test -z $argv
    echo "Usage: volume.fish up|down|mute"
    exit
end
switch $argv
case up
    pactl set-sink-mute 0 false 
    pactl set-sink-volume 0 +5%
case down
    pactl set-sink-mute 0 false 
    pactl set-sink-volume 0 -5%
case mute
    pactl set-sink-mute 0 toggle
case '*'
    echo "Bad argument"
end