ROM ORIGINAL STB INDIHOME 4K ZTE B860H
======================================
RAM: 2GB

Dibackup menggunakan script `dump.sh`

system.img di split menjadi `system.7z.*` karena limit filesize dari github.


```
ro.build.id=MHC19J
ro.build.display.id=MHC19J release-keys
ro.build.version.incremental=V81111329.1218
ro.build.version.sdk=23
ro.build.version.preview_sdk=0
ro.build.version.codename=REL
ro.build.version.all_codenames=REL
ro.build.version.release=6.0.1
ro.build.version.security_patch=2017-04-05
ro.build.version.base_os=
ro.build.date=Tue Dec 18 21:20:14 CST 2018
ro.build.date.utc=1545139214
ro.build.type=user
ro.build.user=android
ro.build.host=ubuntu
ro.build.tags=release-keys
ro.build.flavor=p212-user
ro.product.version.base=V81111329.1218
ro.product.version.software=V81111329.1218
ro.product.model=p212
ro.product.brand=ZTE
ro.product.name=B860H_Market1
ro.product.device=B860H_V1
ro.product.board=AMLS905X
ro.product.build.date=2018-12-18
```

## EMMC PARTITION

```
cat /proc/
```

| dev     | size      | erasesize | name       |
|---------|-----------|-----------|------------|
| inand01 | 400000    | 80000     | bootloader |
| inand02 | 4000000   | 80000     | reserved   |
| inand03 | 800000    | 80000     | env        |
| inand04 | 1000000   | 80000     | logo       |
| inand05 | 1800000   | 80000     | recovery   |
| inand06 | 800000    | 80000     | rsv        |
| inand07 | 800000    | 80000     | tee        |
| inand08 | 2000000   | 80000     | crypt      |
| inand09 | 400000    | 80000     | misc       |
| inand10 | 400000    | 80000     | conf       |
| inand11 | 1000000   | 80000     | boot       |
| inand12 | 37a00000  | 80000     | cache      |
| inand13 | 6cc00000  | 80000     | system     |
| inand14 | 11f3d0000 | 80000     | data       |

**Dumped from dmesg (boot mesg)**

| Partition  |     Name   |     offset     |      size      |
|------------|------------|----------------|----------------|
| mmcblk0p01 | bootloader | 0x000000000000 | 0x000000400000 |
| mmcblk0p02 |   reserved | 0x000002400000 | 0x000004000000 |
| mmcblk0p03 |        env | 0x000006500000 | 0x000000800000 |
| mmcblk0p04 |       logo | 0x000006e00000 | 0x000001000000 |
| mmcblk0p05 |   recovery | 0x000007f00000 | 0x000001800000 |
| mmcblk0p06 |        rsv | 0x000009800000 | 0x000000800000 |
| mmcblk0p07 |        tee | 0x00000a100000 | 0x000000800000 |
| mmcblk0p08 |      crypt | 0x00000aa00000 | 0x000002000000 |
| mmcblk0p09 |       misc | 0x00000cb00000 | 0x000000400000 |
| mmcblk0p10 |       conf | 0x00000d000000 | 0x000000400000 |
| mmcblk0p11 |       boot | 0x00000d500000 | 0x000001000000 |
| mmcblk0p12 |      cache | 0x00000e600000 | 0x000037a00000 |
| mmcblk0p13 |     system | 0x000046100000 | 0x00006cc00000 |
| mmcblk0p14 |       data | 0x0000b2e00000 | 0x00011f200000 |

