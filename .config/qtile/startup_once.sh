#!/bin/bash

NetworkManager &
nm-applet &
xrandr --output HDMI-1 --mode 1920x1080 --same-as eDP-1 &
obsidian &
touchpad.sh
