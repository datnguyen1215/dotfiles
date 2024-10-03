#!/bin/bash

NetworkManager &
nm-applet &
blueman-applet &
xrandr --output HDMI-0 --auto --right-of DP-0
obsidian &
