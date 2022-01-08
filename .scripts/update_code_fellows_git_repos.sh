#! /bin/bash

# UPDATES CODEFELLOWS GIT REPOSITORIES

find /home/natkiypie/dev/cf-master -name .git -execdir git pull -v ';'

echo -e "\033[0;32mUpdated Successfully\033[0m"
