#!/bin/bash

if test -d /tmp/glow; then
  if compgen -G "/tmp/glow/*" > /dev/null; then
    rm /tmp/glow/*
  fi
else
  mkdir /tmp/glow
fi

_up_find() {
  while [[ $PWD != /home/natkiypie ]] ; do
    find "$PWD"/ -maxdepth 1 "$@"
    cd ..
  done
}

_find_md_files() {
  FILE=$(_up_find -name '*.md' )
  if [[ -n $FILE ]]
  then
    cp $FILE --backup=numbered -t /tmp/glow
  else
    print "no file"
  fi
}

_find_md_files

glow /tmp/glow

trap 'rm -rf /tmp/glow' EXIT
