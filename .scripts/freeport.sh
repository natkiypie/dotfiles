#!/bin/bash

freeport() { fuser -k -i "$1"/tcp ; }

freeport $1
