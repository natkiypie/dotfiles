#!/bin/bash

# USED BY update_packages.sh

# setup any external monitors
hdmi_active=$(xrandr |grep 'DP-3' | grep -w 'connected' | awk '{print $1}')

[[ ! -z "$hdmi_active" ]] && xrandr --output DP-3 --pos 0x0 --output eDP-1 --off && set_background_img.sh
