#!/bin/bash
[ "$UID" = "0" ] || exec sudo "$0" "$@"

SYSDIR="kitchen/system"
SYSIMG="kitchen/system.img"

cp -v original/system.img $SYSIMG || exit 1
chmod 777 $SYSIMG


echo "Mounting system.img to $SYSDIR"
[ -d $SYSDIR ] || mkdir $SYSDIR
mount -o loop,noatime,rw,sync $SYSIMG $SYSDIR

echo "Remove 3rd Party Apps (indihome)"
rm -rf $SYSDIR/preinstall

echo "Remove Unwanted Apps"
# Must be removed, or you got Iptv Err
rm -f $SYSDIR/app/MainControl.apk
rm -f $SYSDIR/app/sqm.apk
rm -rf $SYSDIR/app/apk

rm -f $SYSDIR/app/AppsMgr-release.apk
rm -f $SYSDIR/app/ajvm.apk
rm -f $SYSDIR/app/AptoideTV-3.3.1-useeapps.apk
rm -f $SYSDIR/app/FactoryTestTool.apk
rm -f $SYSDIR/app/iptvclient_boot-release.apk
rm -f $SYSDIR/app/popup-release-signed.apk
rm -f $SYSDIR/app/ZTEUpgrade.apk
rm -f $SYSDIR/app/ZTEBrowser.apk
rm -f $SYSDIR/app/ZTEPlayer.apk

rm -f $SYSDIR/app/VideoTestTool.apk
rm -rf $SYSDIR/app/QuickSearchBox
rm -rf $SYSDIR/app/NetworkTest
rm -rf $SYSDIR/app/ztehelper
rm -rf $SYSDIR/app/HomeMediaCenter

rm -f $SYSDIR/app/IPTV.apk
rm -f $SYSDIR/app/mcspbase.apk
rm -f $SYSDIR/app/NaAgent.apk
rm -f $SYSDIR/app/netmanager.apk
rm -f $SYSDIR/app/nmAssistant.apk

# Cleann!
rm -f $SYSDIR/app/OSDService.apk
rm -f $SYSDIR/app/ZeroCfgUI.apk
rm -f $SYSDIR/app/Dlnagwapt.apk
rm -f $SYSDIR/app/MSGAPK.apk

rm -f $SYSDIR/app/dlna.apk
rm -f $SYSDIR/app/MSGAPKSub.apk
rm -rf $SYSDIR/app/AuthConfig
rm -rf $SYSDIR/app/SubtitleService
rm -rf $SYSDIR/app/FileBrowser

# MeBox launcher
rm -f $SYSDIR/app/launcher_tkz4.apk

# Must removed if using GAPPS TV
rm -f $SYSDIR/app/TVClient.apk
#rm -rf $SYSDIR/app/ADBSetting
rm -rf $SYSDIR/app/Camera2
rm -rf $SYSDIR/app/Music
rm -rf $SYSDIR/app/DownloadProviderUi
rm -f $SYSDIR/app/com.google.android.tts-3.10.10-210310101.apk
rm -rf $SYSDIR/priv-app/Contacts/
rm -rf $SYSDIR/priv-app/LiveTv/

#Uncomment if you want use hardware keyboard only (no softkeyboard)
#rm -rf $SYSDIR/app/LatinIME
#rm -rf $SYSDIR/app/OpenWnn 

echo "Remove Unwanted services"
rm -f $SYSDIR/bin/netaccess
rm -f $SYSDIR/bin/depconfig

echo "Bootanimation"
pushd kitchen/bootanimation
[ -e ../rootfs/media/bootanimation.zip ] && sudo rm ../rootfs/media/bootanimation.zip
[ -d ../rootfs/media ] || mkdir ../rootfs/media
sudo zip -0 -r '../rootfs/media/bootanimation.zip' *
popd

echo "Coying default data"
[ -d kitchen/rootfs/data_default ] || mkdir -p kitchen/rootfs/data_default/data
# Fix data permissions, its changed after checkout from git
chmod -R og+rw kitchen/rootfs/data_default/data/*
chmod -R +x kitchen/rootfs/xbin/*
chmod -R +x kitchen/rootfs/bin/*

echo 'Merge rootfs/* into $SYSDIR/*'
cp -pruv kitchen/rootfs/* $SYSDIR/

echo "Unmount $SYSDIR"
umount $SYSDIR

if which e2fsck &> /dev/null; then
	echo "Check/repair file system.img"
	e2fsck -f $SYSIMG
fi

if which resize2fs &> /dev/null; then
	# kecilkan partisi biar ga lama bgt ngeflashnya
	echo "Minimizing system.img"
	resize2fs -M $SYSIMG
fi

echo "Done, press any button (on the keyboard, not power button) to close."
read -n 1
