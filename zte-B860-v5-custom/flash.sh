#!/bin/bash

USB_BURN="sudo ./tools/linux/update"

# Check if device exists and ready
$USB_BURN scan | grep 'No ' && exit 1

echo "FLASHING"

$USB_BURN partition boot backup/boot.img
#$USB_BURN partition bootloader backup/bootloader.img
$USB_BURN partition conf backup/conf.img
$USB_BURN partition logo backup/logo.img
$USB_BURN partition env backup/env.img
$USB_BURN partition super backup/super.img
$USB_BURN partition data backup/data.img
$USB_BURN partition cache backup/cache.img
$USB_BURN bulkcmd "amlmmc erase data"
$USB_BURN bulkcmd "amlmmc erase cache"

$USB_BURN bulkcmd "setenv hdmimode 720p60hz"
#$USB_BURN bulkcmd "setenv -f EnableSelinux permissive"
#$USB_BURN bulkcmd "setenv firstboot 1"
$USB_BURN bulkcmd "saveenv"
echo "DONE"
read -n 1