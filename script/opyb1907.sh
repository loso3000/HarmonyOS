#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions

# sed -i 's/Os/O3 -funsafe-math-optimizations -funroll-loops -ffunction-sections -fdata-sections -Wl,--gc-sections/g' include/target.mk

# 默认开启 Irqbalance
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
# 移除 SNAPSHOT 标签
# sed -i 's,-SNAPSHOT,,g' include/version.mk
# sed -i 's,-SNAPSHOT,,g' package/base-files/image-config.in

# R8168驱动
# git clone -b master --depth 1 https://github.com/BROBIRD/openwrt-r8168.git package/new/r8168
svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/r8168 package/new/r8168
# patch -p1 <../PATCH/r8168/r8168-fix_LAN_led-for_r4s-from_TL.patch
# R8152驱动
svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/r8152 package/new/r8152
sed -i 's,kmod-usb-net-rtl8152,kmod-usb-net-rtl8152-vendor,g' target/linux/rockchip/image/armv8.mk
# UPX 可执行软件压缩
sed -i '/patchelf pkgconf/i\tools-y += ucl upx' ./tools/Makefile
sed -i '\/autoconf\/compile :=/i\$(curdir)/upx/compile := $(curdir)/ucl/compile' ./tools/Makefile
svn co https://github.com/immortalwrt/immortalwrt/branches/master/tools/upx tools/upx
svn co https://github.com/immortalwrt/immortalwrt/branches/master/tools/ucl tools/ucl

sed -i 's,kmod-r8169,kmod-r8168,g' target/linux/x86/image/64.mk

# rm -rf ./tools/upx
rm -rf ./feeds/packages/utils/coremark
svn co https://github.com/immortalwrt/packages/trunk/utils/coremark feeds/packages/utils/coremark

#修正nat回流 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/set/sysctl.conf   >>  ./package/base-files/files/etc/sysctl.conf
#修正连接数 
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# 最大连接数
sed -i 's/65535/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf

# svn co https://github.com/sirpdboy/diy/trunk/emortal  ./package/lean/emortal

### 获取额外的基础软件包 ###
# 更换为 ImmortalWrt Uboot 以及 Target
# rm -rf ./target/linux/rockchip
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/target/linux/rockchip target/linux/rockchip
# rm -rf ./package/boot/uboot-rockchip
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/boot/uboot-rockchip package/boot/uboot-rockchip
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/boot/arm-trusted-firmware-rockchip-vendor package/boot/arm-trusted-firmware-rockchip-vendor
# rm -rf ./package/kernel/linux/modules/video.mk
# wget -P package/kernel/linux/modules/ https://github.com/immortalwrt/immortalwrt/raw/openwrt-21.02/package/kernel/linux/modules/video.mk
# AutoCore
# svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/emortal/autocore package/lean/autocore
# Argon 主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/new/luci-theme-argon


# 动态DNS
svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_aliyun package/lean/ddns-scripts_dnspod
svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_dnspod package/lean/ddns-scripts_aliyun

rm -rf ./feeds/packages/devel/gcc

svn co https://github.com/sirpdboy/build/trunk/gcc  ./feeds/packages/devel/gcc

# R8168驱动
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/r8152 package/new/r8152
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/r8168 package/new/r8168
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8188eu package/new/rtl8188eu
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8189es package/new/rtl8189es
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8192du package/new/rtl8192du
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8812au-ct package/new/rtl8812au-ct
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8812au-ac package/new/rtl8812au-ac
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8821cu package/new/rtl8821cu
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl88x2bu package/new/rtl88x2bu

# add set
# sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP用IPV6

curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/profile   > ./package/base-files/files/etc/profile
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/banner   >  ./package/base-files/files/etc/banner

date1=' JZ '`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`' by Sirpdboy '
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-JZ-/g' include/image.mk
# date1=' JZ S2022.02.01 by Sirpdboy '
# sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220201-JZ-/g' include/image.mk
# sed -i 'DISTRIB_REVISION/d' ./package/base-files/files/etc/openwrt_release
# echo "DISTRIB_REVISION='${date1}'" >> ./package/base-files/files/etc/openwrt_release

echo ${date1}  >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

sed -i "/DISTRIB_DESCRIPTION/c\DISTRIB_DESCRIPTION=\"%D $date1\"" package/base-files/files/etc/openwrt_release
sed -i "/CONFIG_VERSION_CODE=/c\CONFIG_VERSION_CODE=\"$date1\"" ./.config
