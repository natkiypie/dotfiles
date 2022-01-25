#!/bin/bash

# setup any external monitors
hdmi_active=$(xrandr |grep 'DP-3' | grep -w 'connected' | awk '{print $1}')

[[ ! -z "$hdmi_active" ]] && xrandr --output DP-3 --auto --pos 163x0 --output eDP-1 --auto --pos 0x900 && set_background_img.sh
