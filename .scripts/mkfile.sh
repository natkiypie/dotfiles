#!/bin/bash

mkfile() { mkdir -p "$(dirname "$1")" && touch "$1"; }

mkfile $1
