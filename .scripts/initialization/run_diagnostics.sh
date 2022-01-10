#!/bin/bash

# USED BY on_open.sh

function check_sensors {
  sensors | grep -Po 'Core 0\:        \+\K..'
}

function check_temp {
  if (( $(check_sensors) >= "60" )); then
    true
  else
    false
  fi
}

function check_connection {
  if check_temp; then
    clear
    echo -e "\033[0;31mUpdate failed :(\033[0m"
    exit 0
  else
    _check_connection
  fi
}


function _check_connection {
  # if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  if ping -c1 google.com >/dev/null 2>&1; then
    # if there is an external monitor plugged in, set only external monitor on
    ex_mon_only_on.sh
    # if there is a mouse plugged in, don't tune usb device with powertop
    mouse_on.sh
    update_packages.sh
  else
    check_connection
  fi
}

echo -e "\033[0;33mChecking connection...\033[0m"
check_connection
