#!/system/bin/sh
# Enable install FDisk
settings put secure install_non_market_apps 1
TOAST="am broadcast -a id.klampok.broadcast.CUSTOM_BROADCAST -e MSG "

# Install custom APK
find /system/app_install/ -name "*\.apk" -exec sh -c '$1 "Memasang $(basename $0 .apk)"; pm install $0' {} "$TOAST" \;

# Data configuration
cp -pr /system/data_default/* /data/

$TOAST "Pemasangan selesai, refreshing.."

# Give some delay for launcer to receive broadcast
sleep 1

# Kill app to force reload modified data/config
for f in /system/data_default/data/*/; do
	killall $(basename $f)
done
