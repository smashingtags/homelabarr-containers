#!/bin/bash
####################################
# All rights reserved.              #
# started from Zero                 #
# Docker owned homelabarr           #
# Docker Maintainer homelabarr      #
#####################################
#####################################
# THIS DOCKER IS UNDER LICENSE      #
# NO CUSTOMIZING IS ALLOWED         #
# NO REBRANDING IS ALLOWED          #
# NO CODE MIRRORING IS ALLOWED      #
#####################################
# shellcheck disable=SC2086
# shellcheck disable=SC2046

FOLDER=$1
APP=$2
USERNAME=$3
TOKEN=$4

### APP SETTINGS ###
APPLINK="https://api.github.com/repos/smashingtags/homelabarr-cli"
BUILDVERSION=20.04
BUILDVERSION="${BUILDVERSION#*v}"
BUILDVERSION="${BUILDVERSION#*release-}"
BUILDVERSION="${BUILDVERSION}"

BUILDIMAGE="ubuntu"

PICTURE="./images/$APP.png"
APPFOLDER="./$FOLDER/$APP"

## RELEASE SETTINGS ###

echo '{
   "appname": "'${APP}'",
   "apppic": "'${PICTURE}'",
   "appfolder": "./'$FOLDER'/'$APP'",
   "newversion": "'${BUILDVERSION}'",
   "baseimage": "'${BUILDIMAGE}'",
   "description": "Docker image  for '${APP}'",
   "body": "Upgrading '${APP}' to baseimage: '${BUILDIMAGE}':'${BUILDVERSION}'",
   "user": "homelabarr image update[bot]"
}' > "./$FOLDER/$APP/release.json"

