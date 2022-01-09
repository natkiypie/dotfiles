#!/bin/bash

_parse() {
  if [[ "$1" == *"~"* ]]; then
    path="$1"
    file=$(basename $path)
    ext=${file#*.}
    ext=${ext%.~*~}
    num=${file##*.md.}
    num=${num:1:1}
    name=${file%.*.*}
    path=${path%/*}
    mv $1 $path/$name$num.$ext
  fi
}

_parse $1
