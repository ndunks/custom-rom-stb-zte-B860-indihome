#!/bin/bash
UPDATEBIN="../tools/linux/update"
$UPDATEBIN scan | grep 'No ' && exit 1

$UPDATEBIN bulkcmd "setenv irremote_update update 1000"
$UPDATEBIN bulkcmd "saveenv"
echo "DONE"
read -n 1
