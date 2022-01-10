#!/bin/bash

# USED BY run_diagnostics.sh

# deb update message with color
echo -e "\033[0;36mUpdating Debian packages...\033[0m"
# create flag in tmp dir
touch /tmp/bash_flag
# updates /etc/apt/source.list with the latest information about available packages
echo $(pass master/natkiypie) | sudo -S apt update
# upgrades all installed packages to the latest versions in accordance with the information in /etc/apt/sources.list
sudo apt upgrade
# remove packages that were automatically installed to satisfy dependencies for packages that are no longer needed
sudo apt autoremove --purge
# checks the package database for consistency and errors
sudo apt-get check
# attempt to correct a system with broken dependencies in place.
sudo apt install -f
# removes unneeded package information files and logs
sudo apt clean
# success message with color
echo -e "\033[0;32mDebian packages updated successfully\033[0m"
# npm update message with color
echo -e "\033[0;36mUpdating Node packages...\033[0m"
# update node packages
ncu -g
