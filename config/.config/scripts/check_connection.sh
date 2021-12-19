#!/bin/bash

function check_connection {
  if nc -zw1 google.com 443; then
    echo '1'
  else
    echo '0'
  fi
}

check_connection
