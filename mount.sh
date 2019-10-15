#!/bin/bash
[ -d ./kitchen/system ] || mkdir ./kitchen/system

sudo mount -o loop,rw,sync,noatime,x-gvfs-show kitchen/system.img ./kitchen/system
