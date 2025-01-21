DEVICE_IP=192.168.152.248

# Download the CA certificates archive
cd /tmp/
wget -O android-ca.tar.gz https://android.googlesource.com/platform/system/ca-certificates/+archive/refs/heads/main/files.tar.gz

# Create a temporary directory to extract the certificates
mkdir /tmp/cacerts

# Extract the CA certificates to the temporary directory
tar -xzvf android-ca.tar.gz -C /tmp/cacerts/

# Connect to the device
adb connect ${DEVICE_IP}:5555

# Enter root mode (wait at least X seconds for adbd to restart into root mode)
adb root
timeout 40 adb wait-for-any-device

# Push the temporary directory containing the certificates to the device's storage
adb shell mount -o rw,remount,rw /system
adb push /tmp/cacerts/ /system/etc/security/
adb shell mount -o ro,remount,ro /system

# Sanity Check
adb shell "grep -C 0 'ISRG Root X1' /system/etc/security/cacerts/*.0"
adb shell "grep -C 0 'ISRG Root X2' /system/etc/security/cacerts/*.0"

# Reboot
adb reboot
