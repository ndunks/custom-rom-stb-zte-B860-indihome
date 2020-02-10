
### Tool to make script loadable & executable by u-boot

`mkimage` is u-boot tools, install with `sudo apt install u-boot-tools`

``` bash
mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
-n enable-boot-usb \
-d enable-boot-usb.txt \
enable-boot-usb.scr
```

that script will ENABLE USB-BOOT via Amlogic autoscript

### Load and Execute via USB Burning Tool
``` bash
ADDR=0x1020000
./tools/linux/update write u-boot-script/enable-boot-usb.scr $ADDR
./tools/linux/update bulkcmd "autoscr $ADDR"

```

### Trick Load Auto Script from USB

Pada U-Boot original terdapat script di `preboot` yg memanngil command dari env
`irremote_update`, namun env `irremote_update` kosong, jadi bisa kita manfaatkan untuk jump
dan auto USB Burn ketika konek USB male-male

file import-env.txt (plain version, make binary with mkimage):
```
setenv irremote_update 'if usb start; then run usbscript; update 1000; fi;'
setenv usbscript 'for usbdev in 0 1; do if fatload usb ${usbdev} 1020000 autorun.txt; env import -t 1020000 ${filesize}; then run CMD; fi; done'
saveenv
echo import-env.txt IMPORT DONE

```

Import kan file via USB Burning
```bash
ADDR=0x1020000
./tools/linux/update write tips-trik/import-env.scr $ADDR
./tools/linux/update bulkcmd "autoscr $ADDR"

```

Contoh File `autorun.txt` di Flasdisk (FAT32 Partition) :
```
sleep_timeout=2
CMD=echo Yes Im Running; sleep $sleep_timeout;echo this just sample arbitary command;sleep $sleep_timeout;
```

``` bash
echo Im loaded from $usbdev

```
Contoh Boot Linux dari FD
```
CMD=fatload usb ${usbdev} ${loadaddr} ${LINUX}; fatload usb ${usbdev} ${ramdisk_addr_r} ${INITRD}; booti ${loadaddr} ${ramdisk_addr_r};
```