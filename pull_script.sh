#!/bin/bash

# this script should be located within the main directroy of the git repo

# --execute command below to store credentials for git on server : 
# git config --global credential.helper 'store --file ~/.my-credentials'

# --add the following to "sudo crontab -e", take note dir should be set to a directory that the script is located in.
# * * * * * dir/pull_script.sh
DATE=$(date)
ACTION='\033[1;90m'
FINISHED='\033[1;96m'
READY='\033[1;92m'
NOCOLOR='\033[0m' # No Color
ERROR='\033[0;31m'

echo $DATE >> /home/userMorne/pull.log
echo "Checking Git repo" >> /home/userMorne/pull.log
echo ======================= >> /home/userMorne/pull.log
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" != "master" ]
  then
    echo "Not on master. Aborting." >> /home/userMorne/pull.log
    echo
    exit 0
    else
      git fetch
      HEADHASH=$(git rev-parse HEAD)
      UPSTREAMHASH=$(git rev-parse master@{upstream})
      if [ "$HEADHASH" != "$UPSTREAMHASH" ]
        then
          # add code here to set what happens when not up to date
          echo "Not up to date with origin. Pulling." >> /home/userMorne/pull.log
          git pull >>/home/userMorne/pull.log 2>&1
          rm -Rv /var/www/html/* >>/home/userMorne/pull.log 2>&1
          cp -Rv ./* /var/www/html/ >>/home/userMorne/pull.log 2>&1
          echo
          exit 0
        else
          echo "Current branch is up to date with origin/master." >> /home/userMorne/pull.log
      fi
fi
