#!/bin/bash

# USED BY update_packages.sh

mouse_active=$(lsusb |grep 'ID' | grep '093a:2510' | awk '{print $1}')

[[ ! -z "$mouse_active" ]] && sudo sh -c 'echo on > /sys/bus/usb/devices/1-1/power/control'
