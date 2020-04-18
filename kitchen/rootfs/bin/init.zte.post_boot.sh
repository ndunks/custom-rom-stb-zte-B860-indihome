#!/system/bin/sh

# increase receive socket buffer
echo 131072 > /proc/sys/net/core/rmem_default
echo 4194304 > /proc/sys/net/core/rmem_max
echo 4194304 > /proc/sys/net/core/wmem_max
#echo 20000  21000 > /proc/sys/net/ipv4/ip_local_port_range
#echo 2 > /proc/sys/net/ipv4/conf/eth0/force_igmp_version
echo 5 > /proc/sys/net/ipv4/tcp_syn_retries
echo 5 > /proc/sys/net/ipv4/tcp_synack_retries

echo 2 > /sys/module/amvdec_h264/parameters/error_recovery_mode
echo 2 > /sys/module/amvdec_mpeg12/parameters/error_frame_skip_level

echo 4096 174760 11264000 > /proc/sys/net/ipv4/tcp_rmem
setprop net.tcp.buffersize.default 4096,174760,11264000,4096,16384,4194304
echo 4096 16384 4194304 > /proc/sys/net/ipv4/tcp_wmem
chmod 0770 /data/media
chmod 0777 /data/media/0
setprop hw.encoder.freerun 1
#ifconfig eth0 192.168.1.12 netmask 255.255.255.0
