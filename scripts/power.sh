#!/bin/bash

# Display current power state on battery

upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "time|to\empty|percentage|energy-rate|energy:|state"
