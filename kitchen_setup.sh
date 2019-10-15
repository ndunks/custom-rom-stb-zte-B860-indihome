#!/bin/bash

if mount | grep "$PWD/kitchen" &> /dev/null; then
    echo "Already setuped!"
    read -n 1
    exit 1
fi

echo "Kitchen setup using tmpfs (For faster oprek)"
echo "All files on kitchen will be deleted an restored from GIT INDEX! make sure you commit it."

sudo rm -rf ./kitchen
mkdir ./kitchen
sudo mount -t tmpfs none ./kitchen
sudo git checkout -- kitchen/
echo "Done"
read -n 1

