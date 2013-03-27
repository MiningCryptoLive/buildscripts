#!/bin/bash

# get current path
reldir=`dirname $0`
cd $reldir
DIR=`pwd`

# Colorize and add text parameters
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             # Reset

DEVICE="$1"
SYNC="$2"
THREADS="$3"

# get current version
VERSION=`date +%Y%m%d`


# get time of startup
res1=$(date +%s.%N)

echo -e "${cya}Building ${bldcya}Vanilla BlueLightning Nightly-$VERSION ${txtrst}";

# sync with latest sources
echo -e ""
if [ "$SYNC" == "sync" ]
then
   echo -e "${bldblu}Syncing latest BlueLightning sources ${txtrst}"
   repo sync -j"$THREADS"
   echo -e ""
fi

# setup environment
echo -e "${bldblu}Cleaning up out folder ${txtrst}"
make clobber;

# setup environment
echo -e "${bldblu}Setting up build environment ${txtrst}"
. build/envsetup.sh

# lunch device
echo -e ""
echo -e "${bldblu}Lunching your device ${txtrst}"
lunch "bluelightning_$DEVICE-userdebug";

echo -e ""
echo -e "${bldblu}Starting to build bluelightning ${txtrst}"

# start compilation
brunch "bluelightning_$DEVICE-userdebug" -j"$THREADS";
echo -e ""

# finished? get elapsed time
res2=$(date +%s.%N)
echo "${bldgrn}Total tie elapsed: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"
