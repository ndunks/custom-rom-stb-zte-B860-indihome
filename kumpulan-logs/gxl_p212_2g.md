
## ENVIRONMENT

```

EnableSelinux=enforcing
baudrate=115200
boardtype=9
boot_revision=V811004
bootargs=rootfstype=ramfs init=/init console=ttyS0,115200 no_console_suspend earlyprintk=aml-uart,0xc81004c0 ramoops.pstore_en=1 ramoops.record_size=0x8000 ramoops.console_size=0x4000 androidboot.selinux=enforcing logo=osd1,loaded,0x3d800000,576cvbs maxcpus=4 vout=576cvbs,enable hdmimode=1080p60hz cvbsmode=576cvbs hdmitx= rxsen1 cvbsdrv=0 androidboot.firstboot=1 jtag=apee androidboot.hardware=amlogic
bootcmd=jpeg ${outputmode};bootsys
bootdelay=1
cmdline_keys=if keyman init 0x1234; then if keyman read usid ${loadaddr} str; then setenv bootargs ${bootargs} androidboot.serialno=${usid};fi;if keyman read mac ${loadaddr} str; then setenv bootargs ${bootargs} mac=${mac} androidboot.mac=${mac};fi;if keyman read deviceid ${loadaddr} str; then setenv bootargs ${bootargs} androidboot.deviceid=${deviceid};fi;fi;
console=ttyS0,115200n8 nohlt
cvbs_drv=0
cvbsmode=576cvbs
dbglevel=loglevel=1
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
firstboot=1
gatewayip=10.18.9.1
hdcp_process=0
hdmimode=1080p60hz
hostname=arm_gxbb
init_display=osd open;osd clear;bmp scale
initargs=rootfstype=ramfs init=/init console=ttyS0,115200 no_console_suspend earlyprintk=aml-uart,0xc81004c0 ramoops.pstore_en=1 ramoops.record_size=0x8000 ramoops.console_size=0x4000 
ipaddr=10.18.9.97
jtag=apee
loadaddr=1080000
maxcpus=4
mem=0M
netmask=255.255.255.0
outputmode=576cvbs
preboot=run init_display;run storeargs;run irremote_update;run upgrade_key;run switch_bootmode;
reboot_mode=cold_boot
recovery_from_flash=setenv bootargs ${bootargs} aml_dt=${aml_dt} recovery_part={recovery_part} recovery_offset={recovery_offset} androidboot.selinux=permissive;if imgread kernel ${recovery_part} ${loadaddr} ${recovery_offset}; then wipeisb; bootm ${loadaddr}; fi
recovery_from_sdcard=setenv bootargs ${bootargs} aml_dt=${aml_dt} recovery_part={recovery_part} recovery_offset={recovery_offset};if fatload mmc 0 ${loadaddr} aml_autoscript; then autoscr ${loadaddr}; fi;if fatload mmc 0 ${loadaddr} recovery.img; then if fatload mmc 0 ${dtb_mem_addr} dtb.img; then echo sd dtb.img loaded; fi;wipeisb; bootm ${loadaddr};fi;
recovery_from_udisk=setenv bootargs ${bootargs} aml_dt=${aml_dt} recovery_part={recovery_part} recovery_offset={recovery_offset};if fatload usb 0 ${loadaddr} aml_autoscript; then autoscr ${loadaddr}; fi;if fatload usb 0 ${loadaddr} recovery.img; then if fatload usb 0 ${dtb_mem_addr} dtb.img; then echo udisk dtb.img loaded; fi;wipeisb; bootm ${loadaddr};fi;
recovery_offset=0
recovery_part=recovery
runlevel=0
sdc_burning=sdc_burn ${sdcburncfg}
sdcburncfg=aml_sdc_burn.ini
serverip=10.18.9.113
stderr=serial
stdin=serial
stdout=serial
storeargs=setenv bootargs ${initargs} androidboot.selinux=${EnableSelinux} logo=${display_layer},loaded,${fb_addr},${outputmode} maxcpus=${maxcpus} vout=${outputmode},enable hdmimode=${hdmimode} cvbsmode=${cvbsmode} hdmitx=${cecconfig} rxsen1 cvbsdrv=${cvbs_drv} androidboot.firstboot=${firstboot} jtag=${jtag}; setenv bootargs ${bootargs} androidboot.hardware=amlogic;run cmdline_keys;
storeboot=if imgread kernel boot ${loadaddr}; then bootm ${loadaddr}; fi;run update;
switch_bootmode=get_rebootmode;if test ${reboot_mode} = factory_reset; then run recovery_from_flash;else if test ${reboot_mode} = update; then run update;else if test ${reboot_mode} = cold_boot; then fi;fi;fi;
system=norm
try_auto_burn=update 700 750;
update=run usb_burning; run sdc_burning; if mmcinfo; then run recovery_from_sdcard;fi;if usb start 0; then run recovery_from_udisk;fi;run recovery_from_flash;
upgrade_check=echo upgrade_step=${upgrade_step}; if itest ${upgrade_step} == 3; then run init_display; run storeargs; run update;else fi;
upgrade_key=if gpio input GPIOAO_2; then echo detect upgrade key;if gpio input GPIOAO_2; then run update; fi;fi;
upgrade_step=0
usb_burning=update 1000
wipe_cache=successful
wipe_data=successful
zte_dispmode=720p

Environment size: 4770/65532 bytes
```

## BOOT LOG
```
~~~~....................................................................set vcck to 1070 mv
set vddee to 1070 mv


U-Boot 2015.01-g3b2d4e2 (Oct 12 2019 - 22:21:44)

DRAM:  2 GiB
Relocation Offset is: 7eeae000

Starting uboot
-----board_version[9]
gpio: pin GPIOAO_6 (gpio 106) value is 1
gpio: pin GPIOCLK_1 (gpio 99) value is 1
gpio: pin GPIOAO_4 (gpio 104) value is 1
gpio: pin GPIOX_15 (gpio 15) value is 1
register usb cfg[0][1] = 000000007ff5a608
[CANVAS]canvas init
vpu: error: vpu: check dts: FDT_ERR_BADMAGIC, load default parameters
vpu: clk_level = 7
vpu: set clk: 666667000Hz, readback: 666660000Hz(0x300)
vpp: vpp_init
boot_device_flag : 1
Nand PHY Ver:1.01.001.0006 (c) 2013 Amlogic Inc.
init bus_cycle=6, bus_timing=7, system=5.0ns
reset failed
get_chip_type and ret:fffffffe
get_chip_type and ret:fffffffe
chip detect failed and ret:fffffffe
nandphy_init failed and ret=0xfffffff1
MMC:   aml_priv->desc_buf = 0x000000007beaedb0
aml_priv->desc_buf = 0x000000007beb10d0
SDIO Port B: 0, SDIO Port C: 1
emmc/sd response timeout, cmd8, status=0x1ff2800
emmc/sd response timeout, cmd55, status=0x1ff2800
[mmc_init] mmc init success
mmc read lba=0x14000, blocks=0x400
      Amlogic multi-dtb tool
      Multi dtb detected
checkhw: g_board_type = 0x9
DDR size: 0x80000000, four layer support
      Multi dtb tool version: v2 .
      Support 3 dtbs.
        aml_dt soc: gxl platform: p212 variant: 2g
        dtb 0 soc: gxl   plat: p212   vari: 1g
        dtb 1 soc: gxl   plat: p212   vari: 2g
        dtb 2 soc: gxl   plat: p215   vari: 1g
      Find match dtb: 1
start dts,buffer=000000007beb3eb0,dt_addr=000000007bebdeb0
parts: 11
00:      logo	0000000001000000 1
01:  recovery	0000000001800000 1
02:       rsv	0000000000800000 1
03:       tee	0000000000800000 1
04:     crypt	0000000002000000 1
05:      misc	0000000000400000 1
06:      conf	0000000000400000 1
07:      boot	0000000001000000 1
08:     cache	0000000037a00000 2
09:    system	000000006cc00000 1
10:      data	ffffffffffffffff 4
get_dtb_struct: Get emmc dtb OK!
Partition table get from SPL is : 
        name                        offset              size              flag
===================================================================================
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
mmc read lba=0x12000, blocks=0x2
mmc read lba=0x12002, blocks=0x2
mmc_read_partition_tbl: mmc read partition OK!
eMMC/TSD partition table have been checked OK!
check pattern success
mmc env offset: 0x6500000 
In:    serial
Out:   serial
Err:   serial
------reboot_mode(0xc810023c)=0x0
reboot_mode=cold_boot
hpd_state=0
cvbs performance type = 6, table = 0
[store]To run cmd[emmc dtb_read 0x1000000 0x40000]
read emmc dtb
      Amlogic multi-dtb tool
      Multi dtb detected
      Multi dtb tool version: v2 .
      Support 3 dtbs.
        aml_dt soc: gxl platform: p212 variant: 2g
        dtb 0 soc: gxl   plat: p212   vari: 1g
        dtb 1 soc: gxl   plat: p212   vari: 2g
        dtb 2 soc: gxl   plat: p215   vari: 1g
      Find match dtb: 1
Net:   dwmac.c9410000
zteDbg: original preboot=run init_display;run storeargs;run irremote_update;run switch_bootmode;
zteDbg: current preboot=run init_display;run storeargs;run irremote_update;run switch_bootmode;
smallsnap setenv in run_preboot_environment_command with saveenv now: 
Saving Environment to aml-storage...
mmc env offset: 0x6500000 
Writing to MMC(1)... done
zteDbg: smallsnap  init_display=hdmitx hpd;osd open;osd clear;bmp scale;vout output ${outputmode};
zteDbg: smallsnap  bootcmd=bootsys
hpd_state=0
[OSD]load fb addr from dts
[OSD]failed to get fb addr for logo
[OSD]use default fb_addr parameters
[OSD]fb_addr for logo: 0x3d800000
[OSD]load fb addr from dts
[OSD]failed to get fb addr for logo
[OSD]use default fb_addr parameters
[OSD]fb_addr for logo: 0x3d800000
[CANVAS]addr=0x3d800000 width=5760, height=2160
cvbs performance type = 6, table = 0
amlkey_init() enter!
[EFUSE_MSG]keynum is 4
[KM]Error:f[key_manage_query_size]L507:key[usid] not programed yet
[KM]Error:f[key_manage_query_size]L507:key[mac] not programed yet
[KM]Error:f[key_manage_query_size]L507:key[deviceid] not programed yet
## Error: "irremote_update" not defined
------reboot_mode(0xc810023c)=0x0
ztebsp: bootcmd=jpeg ${outputmode};bootsys
COMControlFlag=0
[setup_bootenv] COMControlFlag=>   value[1]=0, val=0
not found mac in efuse
zte_mac=E8:AC:AD:62:FC:32,ethaddr=E8:AC:AD:62:FC:32
Hit any key to stop autoboot:  0 

Starting logo
[Logo_disp]: ====== Logo_disp ======
[draw_logo] size=0x121584, ntohl(imgheader.len)=0x121524, ntohs(imgheader.offset)=0x60
[draw_logo] after ALIGN, size=0x121600
[draw_logo]: before read_logo_data 
[draw_logo]: draw_logo 1482
[draw_logo]: draw_logo 1484
[set_logoParam]: enter the set_logoParam
[set_logoParam]:  Id		FileName		Type		No		 Addr			Size
[set_logoParam]: before the get_logo_source PAL_LOGO_PICTURE
### get_logo_source: material.type=0, material.No=1
[set_logoParam]:  <0>		LogoPic(480i)		0		1		0x11000288		541225
### get_logo_source: material.type=0, material.No=1
### get_logo_source: material.type=0, material.No=2
[set_logoParam]:  <1>		LogoPic(576i)		0		2		0x110844b4		114717
### get_logo_source: material.type=0, material.No=1
### get_logo_source: material.type=0, material.No=2
### get_logo_source: material.type=0, material.No=3
[set_logoParam]:  <2>		LogoPic(720p)		0		3		0x110a04d4		66136
### get_logo_source: material.type=0, material.No=1
### get_logo_source: material.type=0, material.No=2
### get_logo_source: material.type=0, material.No=3
### get_logo_source: material.type=0, material.No=4
[set_logoParam]:  <3>		LogoPic(1080i_p)	0		2		0x110b072c		385368
[draw_logo]: draw_logo 1527
before the  decompressToRGB
Start to decode the LOGO jpeg ...
[decompressToRGB]: before the decompress_jpeg_rgb
[decompressToRGB]: Call decompress_pic_rgb565(id=3,addr=110b072c,size=385368,maxw=1920,maxh=1080,Bpp=3) ... 
[decompressToRGB]: after the decompress_jpeg_rgb
[draw_logo]: Success in decoding LOGO src file:	(w=1920,h=1080,Bpp=3,data=0x7bf34080)
[OSD]load fb addr from dts
[OSD]failed to get fb addr for logo
[OSD]use default fb_addr parameters
[OSD]fb_addr for logo: 0x3d800000
[deinit_Logo]: all LOGO's resource (Exc. logoThread) are released 
Logo_disp ret: 0
ztebsp:boot_revision = V811012,22:21:50
read boot-recovery from misc failed.
[setup_bootenv] ScreenMode=>   value[7]=2, val=2
Saving Environment to aml-storage...
mmc env offset: 0x6500000 
Writing to MMC(1)... done
not found mac in efuse
bootmode:NORM 
ztebsp: head magic=55667788
ztebsp: cmdT = imgread kernel boot ${loadaddr}; store dtb read ${dtb_mem_addr}; bootm ${loadaddr}
bootargs=rootfstype=ramfs init=/init console=ttyS0,115200 no_console_suspend earlyprintk=aml-uart,0xc81004c0 ramoops.pstore_en=1 ramoops.record_size=0x8000 ramoops.console_size=0x4000 androidboot.selinux=enforcing logo=osd1,loaded,0x3d800000,576cvbs maxcpus=4 vout=576cvbs,enable hdmimode=720p50hz cvbsmode=576cvbs hdmitx= rxsen1 cvbsdrv=0 androidboot.firstboot=0 jtag=apee androidboot.hardware=amlogic mac=E8:AC:AD:62:FC:32 system=norm runlevel=0 boot_revision=V811012 boardtype=9 loglevel=1 uimode=1080p CTSEnable=0 market=3601,1 hdcp_process=0 ProductID=0C100499007040800000E8ACAD62FC32 BootVideoCtrl=0 COMControlFlag=0
[imgread]szTimeStamp[2019101222443957]
[imgread]secureKernelImgSz=0x94f800
[store]To run cmd[emmc dtb_read 0x1000000 0x40000]
read emmc dtb
      Amlogic multi-dtb tool
      Multi dtb detected
      Multi dtb tool version: v2 .
      Support 3 dtbs.
        aml_dt soc: gxl platform: p212 variant: 2g
        dtb 0 soc: gxl   plat: p212   vari: 1g
        dtb 1 soc: gxl   plat: p212   vari: 2g
        dtb 2 soc: gxl   plat: p215   vari: 1g
      Find match dtb: 1
ee_gate_off ...
## Booting Android Image at 0x01080000 ...
reloc_addr =7bf34080
copy done
use dts in boot.img/recovery.img instead of dts partition.
      Amlogic multi-dtb tool
      Multi dtb detected
      Multi dtb tool version: v2 .
      Support 3 dtbs.
        aml_dt soc: gxl platform: p212 variant: 2g
        dtb 0 soc: gxl   plat: p212   vari: 1g
        dtb 1 soc: gxl   plat: p212   vari: 2g
        dtb 2 soc: gxl   plat: p215   vari: 1g
      Find match dtb: 1
L258:
L260:
L266:load dtb from 0x1000000 ......
   Uncompressing Kernel Image ... OK
   kernel loaded at 0x01080000, end = 0x02013670
   Loading Ramdisk to 7bc3a000, end 7be9c000 ... OK
   Loading Device Tree to 000000001fff3000, end 000000001ffff5f9 ... OK
fdt_instaboot: no instaboot image

Starting kernel ...

uboot time: 3922976 us
Initializing cgroup subsys cpu
Initializing cgroup subsys cpuacct
Linux version 3.14.29-g7d89dbf (lidonghai@ubuntu) (gcc version 4.9.2 20140904 (prerelease) (crosstool-NG linaro-1.13.1-4.9-2014.09 - Linaro GCC 4.9-2014.09) ) #1 SMP PREEMPT Sat Oct 12 22:35:10 CST 2019
CPU: AArch64 Processor [410fd034] revision 4
no prop version_code
bootconsole [earlycon0] enabled
Initramfs unpacking failed: junk in compressed archive
```

