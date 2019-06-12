#!/bin/bash

# this script should be located within the main directroy of the git repo

# --execute command below to store credentials for git on server : 
# git config --global credential.helper 'store --file ~/.my-credentials'

# --add the following to "sudo crontab -e", take note dir should be set to a directory that the script is located in.
# * * * * * dir/pull_script.sh

ACTION='\033[1;90m'
FINISHED='\033[1;96m'
READY='\033[1;92m'
NOCOLOR='\033[0m' # No Color
ERROR='\033[0;31m'

echo
echo -e ${ACTION}Checking Git repo
echo -e =======================${NOCOLOR}
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" != "master" ]
  then
    echo -e ${ERROR}Not on master. Aborting. ${NOCOLOR}
    echo
    exit 0
    else
      git fetch
      HEADHASH=$(git rev-parse HEAD)
      UPSTREAMHASH=$(git rev-parse master@{upstream})
      if [ "$HEADHASH" != "$UPSTREAMHASH" ]
        then
          # add code here to set what happens when not up to date
          echo -e ${ERROR}Not up to date with origin. Pulling.${NOCOLOR}
          git pull
          echo
          exit 0
        else
          echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
      fi
fi
