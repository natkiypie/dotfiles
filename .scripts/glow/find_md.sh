#!/bin/bash

find_md() {
  find "$1" -maxdepth 1 -type f -exec mv_md.sh {} \;
}

find_md $1
