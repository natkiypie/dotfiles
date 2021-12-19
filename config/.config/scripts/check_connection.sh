#!/bin/bash

function check_connection {
  if ping -c1 google.com >/dev/null 2>&1; then
    echo '1'
  else
    echo '0'
  fi
}

check_connection
