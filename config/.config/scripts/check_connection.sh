#!/bin/bash

function check_connection {
  # if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  if ping -c1 google.com >/dev/null 2>&1; then
    echo '1'
  else
    echo '0'
  fi
}

check_connection
