#!/bin/bash
UPDATEBIN="../update"
$UPDATEBIN scan | grep 'No ' && exit 1

echo "FLASHING"
[ -e boot.img ] && $UPDATEBIN partition boot boot.img
[ -e conf.img ] && $UPDATEBIN partition conf conf.img
[ -e logo.img ] && $UPDATEBIN partition logo logo.img
[ -e env.img ] && $UPDATEBIN partition env env.img
$UPDATEBIN partition system system.img
$UPDATEBIN bulkcmd "amlmmc erase data"
$UPDATEBIN bulkcmd "amlmmc erase cache"
$UPDATEBIN bulkcmd "setenv hdmimode 720p60hz"
$UPDATEBIN bulkcmd "setenv -f EnableSelinux permissive"
$UPDATEBIN bulkcmd "setenv firstboot 1"
$UPDATEBIN bulkcmd "saveenv"
echo "DONE"
read -n 1
