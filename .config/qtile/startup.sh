#!/bin/bash

feh --bg-scale ~/backgrounds/joker.jpg

pkill picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom &

~/.config/polybar/launch.sh