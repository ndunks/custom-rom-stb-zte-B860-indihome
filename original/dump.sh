#!/bin/bash

# Amilogic USB Burning tool 'update' binary installed on my system as 'aml'
UPDATE_BIN="aml"

if [ ! -f "$(which $UPDATE_BIN)" ]; then
    echo "Update bin not found: $UPDATE_BIN"
    exit 1
fi
$UPDATE_BIN scan | grep 'No ' && exit 1
PARTITIONS=( \
    "400000 bootloader" \
    "4000000 reserved" \
    "800000 env" \
    "1000000 logo" \
    "1800000 recovery" \
    "800000 rsv" \
    "800000 tee" \
    "2000000 crypt" \
    "400000 misc" \
    "400000 conf" \
    "1000000 boot" \
    "37a00000 cache" \
    "6cc00000 system" \
    "11f3d0000 data" \
)

for line in "${PARTITIONS[@]}"; do
    set -- $line
    FILE="$2.img";
    PART="$2";
    SIZE="0x$1";
    printf "$FILE... ";
    if [ -f $FILE ]; then
        echo "Exists, skipped."
    else
        $UPDATE_BIN mread store $PART normal $SIZE $FILE
        echo "OK"
    fi
done
echo "Ok done"
