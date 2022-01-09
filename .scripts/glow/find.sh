#!/bin/bash

_find() {
  find "$1" -maxdepth 1 -type f -exec parse.sh {} \;
}

_find $1
