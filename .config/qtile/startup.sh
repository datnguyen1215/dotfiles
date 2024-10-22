#!/bin/bash

xset s off          # Disable screen saver
xset -dpms          # Disable DPMS (Energy Star) features
xset s noblank      # Disable screen blanking

feh --bg-scale ~/backgrounds/joker.jpg

pkill picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom &

~/.config/polybar/launch.sh
