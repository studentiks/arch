#!/bin/env fish
if test -n $argv[1]
    sleep $argv[1]
end
cd ~/.config/openbox/wallpapers
feh --bg-scale (command ls | shuf -n1)