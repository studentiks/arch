~/.config/openbox/display.fish
xrdb ~/.Xresources
xset r rate 200 30
xmodmap ~/.Xmodmap
numlockx

~/.config/openbox/wallpaper.sh 3 &

tint2 &
fbxkb &
copyq &
guake &

exec openbox-session
