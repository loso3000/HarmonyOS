#!/bin/bash

oldPATH=$(pwd)

sudo apt-get update && \
   sudo apt-get install -y  jq btrfs-progs dosfstools uuid-runtime parted gawk wget patch xz-utils

git clone --depth 1 https://github.com/unifreq/openwrt_packit /opt/openwrt_packit

mkdir -p /opt/kernel

cp bin/targets/*/*/*armvirt-64-default-rootfs.tar.gz /opt/openwrt_packit/openwrt-armvirt-64-default-rootfs.tar.gz

# KERNEL_VERSION="5.13.13-flippy-63+"
(
    cd /opt/openwrt_packit
    sudo -E ./mk_s905d_n1.sh 
    find -type f -size +100M -name 'openwrt*.img' -exec mv {} /opt/openwrt_packit/tmp/ \;
)

mv bin/targets/*/*/config.buildinfo /opt/openwrt_packit/tmp/

rm -f bin/targets/*/*/*
mv /opt/openwrt_packit/tmp/* bin/targets/*/*/
ls -lh bin/targets/*/*/


# docker run -tid --name test \
#     --device=/dev/loop-control:/dev/loop-control \
#     --device=/dev/loop0:/dev/loop0 \
#     --device=/dev/loop0p1:/dev/loop0p1 \
#     --device=/dev/loop0p2:/dev/loop0p2 \
#     -v $PWD/openwrt_packit:/opt/ --cap-add SYS_ADMIN ubuntu
