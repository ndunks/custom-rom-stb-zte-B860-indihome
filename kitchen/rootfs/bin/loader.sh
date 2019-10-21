#!/system/bin/sh

# Auto granted My ADB Shell :-)
if [ ! -e /data/misc/adb/adb_keys ]; then
	[ ! -d /data/misc/adb ] && mkdir -p /data/misc/adb
	echo 'QAAAAPVAVTKjlEJfrSLAyxUk0FeLasM/NTD1SWcnk2slxuLm8pbdloNgrZhpWdEUFvjYk6nBnCAvTcsFCYp4ORPNPlWJWSh21B3oN4Y/SqZKyYg66J4kgKCx0x1OdxS9cP9j4tKbsMv/8+fQ4bJHYQIa21TuHbEbh0H0owzx69V4Kd9WKW/TjlbPC70G9C+tz0wAadixDiWMN9FQ3BaGhA1MXE5Fd2fBnwsstMxcHhYPysTV8j4fdiDYX0/UbQZuV3NTaJBaoIa3RsV3RCBBv0t1f4vPYrpCgMME7FA/iVpqMU+65cSOC2RwlYvC3xJaSdFOiF83ITwbuaog3Y4SUPM6OJh8ppS+9yRJDJ7cPH68xvy8BdyNvYHu8c5GLVEAXLE7dBEHmp5CYaLWkC6gS/QfkMOOkvmeutZRYFExFwU17IrXAaNFnMq59lHFHf7T7qaEqh3md0Ys88fjFIVxS7Q9ykGHRmep8HFU9//P1WSNeqJqr+3Lz7oE46RPq6q7MO6IRo8L6drB9OGycR8g3lEq9DhS423WTHEKyhLRb91G1c8/zUhaSQEmJJw2v9erWJD44GFPEac90PAEAwHgb1oaHwoqqb4EgBMEG02O0ofalojOZAiFsNIZYELlSWacujNKzYg9rvLoitNvGQbhkVV3SRK7NcbHqIIFyPzGoBfmOT1Gw0TMZwEAAQA= ndunks@ndunks-debian' > /data/misc/adb/adb_keys
fi

# Install App
MARK=/data/local/KLAMPOK_SCRIPT_DONE

if [ ! -e $MARK ]; then
	mkdir -p /data/data/eu.chainfire.supersu/files
	cp /system/supersu.cfg /data/data/eu.chainfire.supersu/files/
	chmod 700 /data/data/eu.chainfire.supersu/files/supersu.cfg

	( /system/bin/app_installer.sh; touch $MARK ) &

fi

# Aktifkan SuperUser Kernel Module & Daemon
insmod /system/lib/libsupol.so
/system/xbin/daemonsu --auto-daemon &

