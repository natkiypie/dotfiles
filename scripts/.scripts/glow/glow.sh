#!/bin/bash

if test -d /tmp/glow; then
  if compgen -G "/tmp/glow/*" > /dev/null; then
    rm /tmp/glow/*
  fi
else
  mkdir /tmp/glow
fi

_up_find() {
  rootdir=$(git rev-parse --show-toplevel)
  while [[ $PWD != ${rootdir%/*} ]] ; do
    find "$PWD"/ -maxdepth 1 "$@"
    cd ..
  done
}

_find_md_files() {
  mdfile=$(_up_find -name '*.md' )
  if [[ -n $mdfile ]]
  then
    cp $mdfile --backup=numbered -t /tmp/glow
    find_md.sh /tmp/glow
  fi
}

_find_md_files

glow /tmp/glow

trap 'rm -rf /tmp/glow' EXIT
