#!/bin/bash
[ "$UID" = "0" ] || exec sudo "$0" "$@"

GSRC=tmp/open_gapps-arm-6.0-pico-20191006
TARGET="rootfs_gapps"

[ -d $TARGET ] || mkdir $TARGET

# for F in $GSRC/Core/*.tar.*; do
# 	echo $F
# 	tar -C $TARGET  --strip-components=2 --wildcards -xvf $F  '*/nodpi/' '*/common/'
# done


for F in open_gapps_tv/*.tar.*; do
	echo $F
	tar -C $TARGET  --strip-components=2 --wildcards -xvf $F  '*/nodpi/' '*/common/'
done
