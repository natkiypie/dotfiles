#!/bin/bash

[ -d "/tmp/glow" ] && rm /tmp/glow/* || mkdir /tmp/glow

find ../../ -path *node_modules* -prune -o -iname *.md -exec cp -ar {} /tmp/glow \;

glow /tmp/glow

trap 'rm -rf /tmp/glow' EXIT
