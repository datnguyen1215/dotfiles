#!/bin/bash

xset s off          # Disable screen saver
xset -dpms          # Disable DPMS (Energy Star) features
xset s noblank      # Disable screen blanking

# disable the Built-In Audio Sound
pactl set-card-profile alsa_card.pci-0000_00_1b.0 off

feh --bg-scale ~/backgrounds/joker.jpg

pkill picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom &

pkill conky
conky -c ~/.config/conky/conky.conf &

~/.config/polybar/launch.sh
