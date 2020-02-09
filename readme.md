UNLOCK STB INDIHOME 4K ZTE B860H
================================

Bahan untuk build custom ROM Android untuk STB Indihome B860H

- [x] Root with SuperSU
- [x] Remove preinstalled app and unused app
- [x] SETTINGS APP (For setting wifi, etc)
- [x] ADB Running via Wifi (Just adb connect IP)
- [x] Youtube (Gapps) using SmartYoutube
- [ ] BootLogo Changer 'mklogo' binnary may can be used

U-Boot script
=============

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


U-Boot Help
============

|         CMD       |        INFO        |
|-------------------|--------------------|
| ?                 | alias for 'help'  |
| aml_sysrecovery   | Burning with amlogic format package from partition sysrecovery    |
| amlmmc            | AMLMMC sub system |
| amlnf             | aml nand sub-system   |
| amlnf_test        | AMLPHYNAND sub-system |
| autoscr           | run script from memory    |
| base              | print or set address offset   |
| bmp               | manipulate BMP image data |
| booti             | boot arm64 Linux Image image from memory  |
| bootm             | boot application image from memory    |
| bootp             | boot image via network using BOOTP/TFTP protocol  |
| bootsys           | bootsys - boot system |
| cbusreg           | cbus register read/write  |
| clkmsr            | measure PLL clock |
| cmp               | memory compare    |
| cp                | memory copy   |
| crc32             | checksum calculation  |
| cvbs              | CVBS sub-system   |
| dcache            | enable or disable data cache  |
| defenv_reserv     | reserve some specified envs after defaulting env  |
| dhcp              | boot image via network using DHCP/TFTP protocol   |
| echo              | echo args to console  |
| efuse             | efuse read/write data commands    |
| efuse_user        | efuse user space read write ops   |
| emmc              | EMMC sub system   |
| env               | environment handling commands |
| exit              | exit script   |
| false             | do nothing, unsuccessfully    |
| fatinfo           | print information about filesystem    |
| fatload           | load binary file from a dos filesystem    |
| fatls             | list files in a directory (default /) |
| fatsize           | determine a file's size   |
| fdt               | flattened device tree utility commands    |
| forceupdate       | forceupdate   |
| get_rebootmode    | get reboot mode   |
| go                | start application at address 'addr'   |
| gpio              | query and control gpio pins   |
| hdmitx            | HDMITX sub-system |
| help              | print command description/usage   |
| i2c               | I2C sub-system    |
| icache            | enable or disable instruction cache   |
| imgread           | Read the image from internal flash with actual size   |
| itest             | return true/false on integer compare  |
| jlogo             | test jpeg logo    |
| jpeg              | manipulate jpeg image data    |
| jtagoff           | disable jtag  |
| jtagon            | enable jtag   |
| keyman            | Unify key ops interfaces based dts cfg    |
| keyunify          | key unify sub-system  |
| loop              | infinite loop on address range    |
| macreg            | ethernet mac register read/write/dump |
| md                | memory display    |
| mm                | memory modify (auto-incrementing address) |
| mmc               | MMC sub system    |
| mmcinfo           | display MMC info  |
| mw                | memory write (fill)   |
| mwm               | mw mask function  |
| nm                | memory modify (constant address)  |
| normal            | normal  - enter norm mode |
| open_scp_log      | print SCP messgage    |
| osd               | osd sub-system    |
| phyreg            | ethernet phy register read/write/dump |
| ping              | send ICMP ECHO_REQUEST to network host    |
| printenv          | print environment variables   |
| rarpboot          | boot image via network using RARP/TFTP protocol   |
| read_temp         | cpu temp-system   |
| readconf          | readconf- read config from conf partition |
| reboot            | set reboot mode and reboot system |
| reset             | Perform RESET of the CPU  |
| rsvmem            | reserve memory    |
| run               | run commands in an environment variable   |
| safe              | safe    - enter safe mode |
| saradc            | saradc sub-system |
| saradc_12bit      | saradc sub-system |
| saveenv           | save environment variables to persistent storage  |
| sdc_burn          | Burning with amlogic format package in sdmmc  |
| sdc_update        | Burning a partition with image file in sdmmc card |
| set_trim_base     | cpu temp-system   |
| set_usb_boot      | set usb boot mode |
| setenv            | set environment variables |
| showvar           | print local hushshell variables   |
| silent            | silent    |
| sleep             | delay execution for some time |
| store             | STORE sub-system  |
| systemoff         | system off    |
| temp_triming      | cpu temp-system   |
| test              | minimal test like /bin/sh |
| tftpboot          | boot image via network using TFTP protocol    |
| true              | do nothing, successfully  |
| unpackimg         | un pack logo image into pictures  |
| update            | Enter v2 usbburning mode  |
| upgrade           | burn image into flash |
| upgrade_d         | burn image into flash |
| usb               | USB sub-system    |
| usb_burn          | Burning with amlogic format package in usb    |
| usb_update        | Burning a partition with image file in usb host   |
| usbboot           | boot from USB device  |
| version           | print monitor, compiler and linker version    |
| vout              | VOUT sub-system   |
| vpu               | vpu sub-system    |
| wipeisb           | wipeisb   |
| write_trim        | cpu temp-system   |
| write_version     | cpu temp-system   |


U-Boot Environtments (Modified, is not default!)
====================

```
1080p_h=1050
1080p_w=1874
1080p_x=23
1080p_y=15
576i_h=551
576i_w=659
576i_x=32
576i_y=9
EnableSelinux=permissive
ab=0
aml_dt=gxl_p215_1g
baudrate=115200
bootargs=rootfstype=ramfs init=/init console=ttyS0,115200 no_console_suspend earlyprintk=aml-uart,0xc81004c0 ramoops.pstore_en=1 ramoops.record_size=0x8000 ramoops.console_size=0x4000 androidboot.selinux=permissive logo=osd1,loaded,0x3d800000,576cvbs maxcpus=4 vout=576cvbs,enable hdmimode=1080p60hz cvbsmode=576cvbs hdmitx= rxsen1 cvbsdrv=0 androidboot.firstboot=0 jtag=apee androidboot.hardware=amlogic
bootcmd=run start_autoscript; run storeboot
bootdelay=3
cmdline_keys=if keyman init 0x1234; then if keyman read usid ${loadaddr} str; then setenv bootargs ${bootargs} androidboot.serialno=${usid};fi;if keyman read mac ${loadaddr} str; then setenv bootargs ${bootargs} mac=${mac} androidboot.mac=${mac};fi;if keyman read deviceid ${loadaddr} str; then setenv bootargs ${bootargs} androidboot.deviceid=${deviceid};fi;fi;
cvbs_drv=0
cvbsmode=576cvbs
display_bpp=24
display_color_bg=0
display_color_fg=0xffff
display_color_index=24
display_height=576
display_layer=osd1
display_width=720
dtb_mem_addr=0x1000000
ethact=dwmac.c9410000
ethaddr=00:15:18:01:81:31
factory_reset_poweroff_protect=echo wipe_data=${wipe_data}; echo wipe_cache=${wipe_cache};if test ${wipe_data} = failed; then run init_display; run storeargs;if mmcinfo; then run recovery_from_sdcard;fi;if usb start 0; then run recovery_from_udisk;fi;run recovery_from_flash;fi; if test ${wipe_cache} = failed; then run init_display; run storeargs;if mmcinfo; then run recovery_from_sdcard;fi;if usb start 0; then run recovery_from_udisk;fi;run recovery_from_flash;fi; 
fb_addr=0x3d800000
fb_height=1080
fb_width=1920
fdt_high=0x20000000
filesize=2c5
firstboot=0
gatewayip=10.18.9.1
hdmimode=1080p60hz
hostname=arm_gxbb
init_display=exit
initargs=rootfstype=ramfs init=/init console=ttyS0,115200 no_console_suspend earlyprintk=aml-uart,0xc81004c0 ramoops.pstore_en=1 ramoops.record_size=0x8000 ramoops.console_size=0x4000 
ipaddr=10.18.9.97
jtag=apee
loadaddr=1080000
maxcpus=4
netmask=255.255.255.0
outputmode=576cvbs
preboot=run init_display;run storeargs;run irremote_update;run upgrade_key;run switch_bootmode;
reboot_mode=cold_boot
recovery_from_flash=setenv bootargs ${bootargs} aml_dt=${aml_dt} recovery_part={recovery_part} recovery_offset={recovery_offset} androidboot.selinux=permissive;if imgread kernel ${recovery_part} ${loadaddr} ${recovery_offset}; then wipeisb; bootm ${loadaddr}; fi
recovery_from_sdcard=setenv bootargs ${bootargs} aml_dt=${aml_dt} recovery_part={recovery_part} recovery_offset={recovery_offset};if fatload mmc 0 ${loadaddr} aml_autoscript; then autoscr ${loadaddr}; fi;if fatload mmc 0 ${loadaddr} recovery.img; then if fatload mmc 0 ${dtb_mem_addr} dtb.img; then echo sd dtb.img loaded; fi;wipeisb; bootm ${loadaddr};fi;
recovery_from_udisk=setenv bootargs ${bootargs} aml_dt=${aml_dt} recovery_part={recovery_part} recovery_offset={recovery_offset};if fatload usb 0 ${loadaddr} aml_autoscript; then autoscr ${loadaddr}; fi;if fatload usb 0 ${loadaddr} recovery.img; then if fatload usb 0 ${dtb_mem_addr} dtb.img; then echo udisk dtb.img loaded; fi;wipeisb; bootm ${loadaddr};fi;
recovery_offset=0
recovery_part=recovery
sdc_burning=sdc_burn ${sdcburncfg}
sdcburncfg=aml_sdc_burn.ini
serverip=10.18.9.113
start_autoscript=if mmcinfo; then run start_mmc_autoscript; fi; if usb start; then run start_usb_autoscript; fi; run start_emmc_autoscript
start_emmc_autoscript=if fatload mmc 1 1020000 emmc_autoscript; then autoscr 1020000; fi;
start_mmc_autoscript=if fatload mmc 0 1020000 s905_autoscript; then autoscr 1020000; fi;
start_usb_autoscript=for usbdev in 0 1 2 3; do if fatload usb ${usbdev} 1020000 s905_autoscript; then autoscr 1020000; fi; done
stderr=serial
stdin=serial
stdout=serial
storeargs=setenv bootargs ${initargs} androidboot.selinux=${EnableSelinux} logo=${display_layer},loaded,${fb_addr},${outputmode} maxcpus=${maxcpus} vout=${outputmode},enable hdmimode=${hdmimode} cvbsmode=${cvbsmode} hdmitx=${cecconfig} rxsen1 cvbsdrv=${cvbs_drv} androidboot.firstboot=${firstboot} jtag=${jtag}; setenv bootargs ${bootargs} androidboot.hardware=amlogic;run cmdline_keys;
storeboot=if imgread kernel boot ${loadaddr}; then bootm ${loadaddr}; fi;run update;
switch_bootmode=exit
try_auto_burn=update 700 750;
update=run usb_burning; run sdc_burning; if mmcinfo; then run recovery_from_sdcard;fi;if usb start 0; then run recovery_from_udisk;fi;run recovery_from_flash;
upgrade_check=echo upgrade_step=${upgrade_step}; if itest ${upgrade_step} == 3; then run init_display; run storeargs; run update;else fi;
upgrade_key=if gpio input GPIOAO_2; then echo detect upgrade key;if gpio input GPIOAO_2; then run update; fi;fi;
upgrade_step=2
usb_burning=update 1000
wipe_cache=successful
wipe_data=successful

Environment size: 5006/65532 bytes
```

eMMC Layout
===============

```
   0: bootloader                         0            400000                  0
   1: reserved                     2400000           4000000                  0
   2: env                          6500000            800000                  0
   3: logo                         6e00000           1000000                  1
   4: recovery                     7f00000           1800000                  1
   5: rsv                          9800000            800000                  1
   6: tee                          a100000            800000                  1
   7: crypt                        aa00000           2000000                  1
   8: misc                         cb00000            400000                  1
   9: conf                         d000000            400000                  1
  10: boot                         d500000           1000000                  1
  11: cache                        e600000          37a00000                  2
  12: system                      46100000          6cc00000                  1
  13: data                        b2e00000         11f200000                  4
  ```
