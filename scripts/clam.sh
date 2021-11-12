#!/bin/bash

# Scan system for infected files starting from the root of the file system

sudo echo -n # require password.

mkdir /home/natkiypie/infected

cd / # change directories to root.

clamscan -riv --copy=/home/natkiypie/infected # scan entire system.

exit
