# USB Burn Mode on Locked Bootloader
a.k.a Firmware Bejat `U-Boot 2015.01-g3b2d4e2 (Oct 12 2019 - 22:21:44)`

## Prepare MMC

    Partition Table Type: MBR / msdos
    First partition start from 2mb
    Partition format FAT32

```
# Use GParted
sudo gparted /dev/sdc
```

## MBR boot
sudo dd if=u-boot.bin of=/dev/sdc bs=1 count=442

## u-boot
sudo dd if=u-boot.bin of=/dev/sdc  seek=1 skip=1 bs=512

## Boot MMC
Boot device, short R87 on board (to boot u-boot on MMC), also press power to boot USB Burn Mode