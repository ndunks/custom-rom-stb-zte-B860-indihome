# Enable USB Burn Mode on Locked Bootloader & Disabled Button
a.k.a Firmware Bejat `U-Boot 2015.01-g3b2d4e2 (Oct 12 2019 - 22:21:44)`

- u-boot.sd.bin merupakan u-boot bootloader beserta 512 byte pertama (MBR)
- u-boot.bin merupakan u-boot bootloader tanpa MBR

## 1. Persiapkan U-Boot di eksternal MMC

    Warning: Semua data & partisi di MMC akan hilang.

``` bash
sudo dd if=u-boot.sd.bin of=/dev/sdc
```

    Ganti `sdc` sesuai dengan block-device MMC di PC mu

Partisi di MMC tidak akan terbaca, tidak masalah yang penting sudah ada bootloadernya.

## Boot MMC
Boot device, short R87 on board (to boot u-boot on MMC), also press power to boot USB Burn Mode

## Flash u-boot.bin to bootloader partition on internal eMMC
``` bash
./tools/linux/update partition bootloader firmware-bejat/u-boot.bin
```


U-boot di eMMC sudah diganti, sekarang harusnya kamu bisa flash seperti biasa (tancap USB + power button)
untuk flashing Kernel/ROM

