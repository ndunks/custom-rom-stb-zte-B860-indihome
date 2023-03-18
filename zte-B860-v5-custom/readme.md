



## Custom Rom Partition

```
BULKcmd[mmc info]
Device: SDIO Port C
Manufacturer ID: 15
OEM: 100
Name: 8GTF4 
Tran Speed: 52000000
Rd Block Len: 512
MMC version 5.1
High Capacity: Yes
Capacity: (0x1d2000000 Bytes) 7.3 GiB
mmc clock: 40000000
Bus Width: 8-bit

Part  Start    Sect x Size Type  name
 00   0        8192    512 U-Boot bootloader
 01   73728    131072  512 U-Boot reserved
 02   221184   2048000 512 U-Boot cache
 03   2285568  16384   512 U-Boot env
 04   2318336  16384   512 U-Boot logo
 05   2351104  49152   512 U-Boot recovery
 06   2416640  16384   512 U-Boot misc
 07   2449408  8192    512 U-Boot conf
 08   2473984  16384   512 U-Boot dtbo
 09   2506752  16384   512 U-Boot cri_data
 10   2539520  32768   512 U-Boot param
 11   2588672  32768   512 U-Boot boot
 12   2637824  32768   512 U-Boot oem
 13   2686976  32768   512 U-Boot metadata
 14   2736128  4096    512 U-Boot vbmeta
 15   2756608  65536   512 U-Boot tee
 16   2838528  16384   512 U-Boot factory
 17   2871296  3686400 512 U-Boot super
 18   6574080  8695808 512 U-Boot data
```
8192 + 131072 + 2048000 + 16384 + 16384 + 49152 + 16384 + 8192 + 16384 + 16384 + 32768 + 32768 + 32768 + 32768 + 4096 + 65536 + 16384 + 3686400 + 8695808
