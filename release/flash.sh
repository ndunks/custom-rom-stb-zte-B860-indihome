#!/bin/bash
UPDATEBIN="../update"
$UPDATEBIN scan | grep 'No ' && exit 1

echo "FLASHING"
[ -e kitchen/boot.img ] && $UPDATEBIN partition boot kitchen/boot.img
[ -e kitchen/conf.img ] && $UPDATEBIN partition conf kitchen/conf.img
[ -e kitchen/logo.img ] && $UPDATEBIN partition logo kitchen/logo.img
[ -e kitchen/env.img ] && $UPDATEBIN partition env kitchen/env.img
$UPDATEBIN partition system system.img
$UPDATEBIN bulkcmd "amlmmc erase data"
$UPDATEBIN bulkcmd "amlmmc erase cache"
$UPDATEBIN bulkcmd "setenv hdmimode 720p60hz"
$UPDATEBIN bulkcmd "setenv -f EnableSelinux permissive"
$UPDATEBIN bulkcmd "setenv firstboot 1"
$UPDATEBIN bulkcmd "saveenv"
echo "DONE"
read -n 1
