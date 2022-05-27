#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
WORKDIR=/workdir
HOSTNAME=OpenWrt
IPADDRESS=192.168.8.1
SSID=Sirpdboy
ENCRYPTION=psk2
KEY=123456
git clone https://github.com/sirpdboy/build.git ./package/build
git clone https://github.com/loso3000/other ./package/other

# rm -rf ./package/lean/r8152
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon

rm -rf ./package/other/up/oaf

git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns

# netdata 
# rm -rf  ./package/diy/netdata
cp -rf ./feeds/packages/admin/netdata ./package/diy/
rm -rf ./feeds/luci/applications/luci-app-netdata
# rm -rf ./feeds/packages/admin/netdata
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./feeds/luci/applications/luci-app-netdata
# rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata

cat  ./package/build/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3 && rm -rf ./package/build/mwan3
# sed -i 's,+mwan3,+mwan3plus,g' ./feeds/luci/applications/luci-app-mwan3/Makefile
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
# rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3

# rm -rf ./feeds/packages/devel/ninja   && svn co https://github.com/Lienol/openwrt-packages/trunk/devel/ninja feeds/packages/devel/ninja

rm -rf ./package/build/autocore
rm -rf ./package/build/default-settings
# rm -rf ./package/lean/autocore  && svn co https://github.com/sirpdboy/build/trunk/autocore ./package/lean/autocore
rm -rf ./package/lean/default-settings  && svn co https://github.com/sirpdboy/build/trunk/default-settings ./package/lean/default-settings

rm -rf ./package/build/luci-app-arpbind
rm -rf ./feeds/luci/applications/luci-app-arpbind
# svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
svn co https://github.com/sirpdboy/build/trunk/luci-app-arpbind ./feeds/luci/applications/luci-app-arpbind 
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

rm -rf ./feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-docker
# rm -rf ./package/diy/luci-app-dockerman
# rm -rf ./feeds/packages/utils/docker
# Add luci-app-dockerman
rm -rf ./feeds/luci/collections/luci-lib-docker
git clone --depth=1 https://github.com/lisaac/luci-lib-docker ./package/lean/luci-lib-docker
sed -i '/auto_start/d' ./package/diy/luci-app-dockerman/root/etc/uci-defaults/luci-app-dockerman
sed -i '/sysctl.d/d' feeds/packages/utils/dockerd/Makefile
sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.10
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.15

#rm -rf ./feeds/luci/applications/luci-app-vlmcsd
rm -rf ./feeds/luci/applications/vlmcsd
svn export https://github.com/wongsyrone/lede-1/trunk/package/external/vlmcsd ./feeds/luci/applications/vlmcsd
ln -sf ../../../feeds/packages/net/vlmcsd ./package/feeds/packages/vlmcsd 
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./feeds/luci/applications/luci-app-vlmcsd


# Add luci-aliyundrive-webdav
rm -rf ./luci-app-aliyundrive-webdav 
rm -rf ./aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav ./package/lean/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav ./package/lean/luci-app-aliyundrive-webdav

# Add ddnsto & linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/ ./package/lean/luci
svn co https://github.com/linkease/nas-packages/trunk/network/services/ ./package/lean/linkease
# svn co https://github.com/linkease/istore/trunk/luci/ ./package/lean/istore
sed -i 's/1/0/g' ./package/lean/linkease/linkease/files/linkease.config

#zerotier 
# rm -rf  luci-app-zerotier && git clone https://github.com/rufengsuixing/luci-app-zerotier.git feeds/luci/applications/luci-app-zerotier  #取消防火墙
# svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-zerotier feeds/luci/applications/luci-app-zerotier
# ln -sf ../../../feeds/luci/applications/luci-app-zerotier ./package/feeds/luci/luci-app-zerotier
# rm -rf ./feeds/packages/net/zerotier
# svn export https://github.com/openwrt/packages/trunk/net/zerotier feeds/packages/net/zerotier
# rm -rf ./feeds/packages/net/zerotier/files/etc/init.d/zerotier
sed -i '/45)./d' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier

# Zerotier
svn export https://github.com/wongsyrone/lede-1/trunk/package/external/luci-app-zerotier feeds/luci/applications/luci-app-zerotier
#svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-zerotier feeds/luci/applications/luci-app-zerotier
wget -P feeds/luci/applications/luci-app-zerotier/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/move_2_services.sh
chmod -R 755 ./feeds/luci/applications/luci-app-zerotier/move_2_services.sh
pushd feeds/luci/applications/luci-app-zerotier
bash move_2_services.sh
popd
ln -sf ../../../feeds/luci/applications/luci-app-zerotier ./package/feeds/luci/luci-app-zerotier
rm -rf ./feeds/packages/net/zerotier
#svn export https://github.com/openwrt/packages/trunk/net/zerotier feeds/packages/net/zerotier
svn export https://github.com/wongsyrone/packages-1/trunk/net/zerotier feeds/packages/net/zerotier
rm -rf ./feeds/packages/net/zerotier/files/etc/init.d/zerotier


#syncdial
# rm -rf luci-app-syncdial  && git clone https://github.com/rufengsuixing/luci-app-syncdial.git feeds/luci/applications/luci-app-syncdial  #IPV6多拨

# samba4
rm -rf ./feeds/luci/applications/luci-app-samba4 &&svn co https://github.com/sirpdboy/build/trunk/luci-app-samba4 ./feeds/luci/applications/luci-app-samba4

git clone --depth 1 https://github.com/zxlhhyccc/luci-app-v2raya.git package/new/luci-app-v2raya
svn co https://github.com/v2rayA/v2raya-openwrt/trunk/v2raya package/new/v2raya

# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
echo '添加关机'
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

sed -i 's/网络存储/存储/g' ./feeds/luci/applications/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' ./feeds/luci/applications/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' ./feeds/luci/applications/luci-app-turboacc/po/zh-cn/turboacc.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' ./feeds/luci/applications/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' ./feeds/luci/applications/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' ./feeds/luci/applications/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i 's/实时流量监测/流量/g' ./feeds/luci/applications/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/KMS 服务器/KMS激活/g' ./feeds/luci/applications/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/USB 打印服务器"/打印服务/g' ./feeds/luci/applications/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/网络存储/存储/g' ./feeds/luci/applications/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/aMule设置/电驴下载/g' ./feeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
sed -i 's/网络存储/存储/g' ./feeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./feeds/luci/applications/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
sed -i 's/带宽监控/监控/g' ./feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误

# rm -rf ./feeds/luci/applications/luci-app-socat && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat ./feeds/luci/applications/luci-app-socat
sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./feeds/luci/applications/luci-app-socat/po/zh-cn/socat.po
ln -sf ../../../feeds/luci/applications/luci-app-socat ./package/feeds/luci/luci-app-socat

sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/欢迎使用!请输入用户密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码
echo '灰色歌曲'
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua


#断线不重拨
# sed -i 's/q reload/q restart/g' ./package/network/config/firewall/files/firewall.hotplug

#echo "其他修改"
sed -i 's/option commit_interval.*/option commit_interval 1h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置

# echo '默认开启 Irqbalance'
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

# Add minieap
rm -rf feeds/packages/net/minieap
svn co https://github.com/immortalwrt/packages/trunk/net/minieap packages/net/minieap feeds/packages/net/minieap

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust package/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk package/MentoHUST-OpenWrt-ipk

# 全能推送
rm -rf ./feeds/luci/applications/luci-app-pushbot && \
git clone https://github.com/zzsj0928/luci-app-pushbot ./feeds/luci/applications/luci-app-pushbot
rm -rf ./feeds/luci/applications/luci-app-jd-dailybonus && \
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus ./feeds/luci/applications/luci-app-jd-dailybonus
rm -rf ./feeds/luci/applications/luci-app-serverchan && \
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./feeds/luci/applications/luci-app-serverchan

git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter
# git clone https://github.com/tuanqing/install-program package/install-program

echo '替换aria2'
rm -rf feeds/luci/applications/luci-app-aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-aria2 feeds/luci/applications/luci-app-aria2
rm -rf feeds/packages/net/aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/aria2 feeds/packages/net/aria2

rm -rf ./package/diy/adguardhome
rm -rf ./feeds/packages/net/adguardhome
svn export https://github.com/openwrt/packages/trunk/net/adguardhome feeds/packages/net/adguardhome
# svn co https://github.com/sirpdboy/sirpdboy-package/trunk/adguardhome feeds/packages/net/adguardhome
# sed -i '/\t)/a\\t$(STAGING_DIR_HOST)/bin/upx --lzma --best $(GO_PKG_BUILD_BIN_DIR)/AdGuardHome' ./feeds/packages/net/adguardhome/Makefile
sed -i '/init/d' feeds/packages/net/adguardhome/Makefile
ln -sf ../../../feeds/packages/net/adguardhome ./package/feeds/packages/net/adguardhome
cp -rf ./feeds/packages/net/adguardhome   ./package/diy/adguardhome

svn co https://github.com/QiuSimons/openwrt-mos/trunk/mosdns package/mosdns
sed -i "/filter_aaaa='1'/d" package/mosdns/luci-app-mosdns/root/etc/init.d/mosdns

git clone https://github.com/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/告"), 1).dep/告"), 11)/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua  #koolproxy


# Fix libssh
# rm -rf feeds/packages/libs
svn co https://github.com/openwrt/packages/trunk/libs/libssh feeds/packages/libs/
# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk package/new/

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash

# Add subconverter
# git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter  package/new/
# 订阅转换
svn export https://github.com/immortalwrt/packages/trunk/net/subconverter feeds/packages/net/subconverter
#wget https://github.com/immortalwrt/packages/raw/b7b4499/net/subconverter/Makefile -O feeds/packages/net/subconverter/Makefile
#mkdir -p ./feeds/packages/net/subconverter/patches
#wget https://github.com/immortalwrt/packages/raw/b7b4499/net/subconverter/patches/100-stdcxxfs.patch -O feeds/packages/net/subconverter/patches/100-stdcxxfs.patch
#sed -i '\/bin\/subconverter/a\\t$(STAGING_DIR_HOST)/bin/upx --lzma --best $(1)/usr/bin/subconverter' feeds/packages/net/subconverter/Makefile
ln -sf ../../../feeds/packages/net/subconverter ./package/feeds/packages/subconverter
svn export https://github.com/immortalwrt/packages/trunk/libs/jpcre2 feeds/packages/libs/jpcre2
ln -sf ../../../feeds/packages/libs/jpcre2 ./package/feeds/packages/jpcre2
svn export https://github.com/immortalwrt/packages/trunk/libs/rapidjson feeds/packages/libs/rapidjson
ln -sf ../../../feeds/packages/libs/rapidjson ./package/feeds/packages/rapidjson
svn export https://github.com/immortalwrt/packages/trunk/libs/libcron feeds/packages/libs/libcron
#wget https://github.com/immortalwrt/packages/raw/b7b4499/libs/libcron/Makefile -O feeds/packages/libs/libcron/Makefile
ln -sf ../../../feeds/packages/libs/libcron ./package/feeds/packages/libcron
svn export https://github.com/immortalwrt/packages/trunk/libs/quickjspp feeds/packages/libs/quickjspp
#wget https://github.com/immortalwrt/packages/raw/b7b4499/libs/quickjspp/Makefile -O feeds/packages/libs/quickjspp/Makefile
ln -sf ../../../feeds/packages/libs/quickjspp ./package/feeds/packages/quickjspp
svn export https://github.com/immortalwrt/packages/trunk/libs/toml11 feeds/packages/libs/toml11
ln -sf ../../../feeds/packages/libs/toml11 ./package/feeds/packages/toml11

# rm -rf ./feeds/packages/utils/runc/Makefile
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile

# ChinaDNS
git clone -b luci --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git package/new/luci-app-chinadns-ng
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng
# CPU 控制相关
rm -rf  feeds/luci/applications/luci-app-cpufreq
svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq
sed -i 's,1608,1800,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/cpufreq
sed -i 's,2016,2208,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/cpufreq
sed -i 's,1512,1608,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/cpufreq

rm -rf ./packages/build/ddns-scripts_dnspod
# rm -rf ./package/lean/ddns-scripts_aliyun && svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
sed -i '/boot()/,+2d' feeds/packages/net/ddns-scripts/files/etc/init.d/ddns
svn export https://github.com/linkease/istore-packages/trunk/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod
svn export https://github.com/linkease/istore-packages/trunk/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun

# Passwall
rm -rf ./feeds/packages/net/pdnsd-alt
rm -rf ./feeds/packages/net/shadowsocks-libev
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/brook
rm -rf ./feeds/packages/net/chinadns-ng
rm -rf ./feeds/packages/net/dns2socks
rm -rf ./feeds/packages/net/hysteria
rm -rf ./feeds/packages/net/ipt2socks
rm -rf ./feeds/packages/net/microsocks
rm -rf ./feeds/packages/net/naiveproxy
rm -rf ./feeds/packages/net/shadowsocks-rust
rm -rf ./feeds/packages/net/simple-obfs
rm -rf ./feeds/packages/net/ssocks
rm -rf ./feeds/packages/net/tcping
rm -rf ./feeds/packages/net/v2ray*
rm -rf ./feeds/packages/net/xray*
rm -rf ./feeds/packages/net/trojan*

#bypass
#rm -rf package/build/pass/luci-app-bypass
#git clone https://github.com/kiddin9/openwrt-bypass package/bypass
#sed -i 's,default n,default y,g' ./package/build/pass/luci-app-bypass/Makefile
#sed -i 's,default n,default y,g' ./package/bypass/luci-app-bypass/Makefile

#  git clone https://github.com/loso3000/openwrt-passwall package/passwall
# svn co https://github.com/loso3000/openwrt-passwall/trunk/luci-app-passwall  package/passwall/luci-app-passwall

git clone https://github.com/xiaorouji/openwrt-passwall2 package/passwall2
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/passwall/luci-app-passwall
#pushd package/passwall/luci-app-passwall
sed -i 's,default n,default y,g' Makefile
popd
pushd package/pass/luci-app-ssr-plus
#sed -i 's,default n,default y,g' Makefile
popd

svn export https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
svn export https://github.com/QiuSimons/OpenWrt-Add/trunk/trojan-plus package/new/trojan-plus
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/new/ssocks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/new/hysteria

echo ' ShadowsocksR Plus+'
# git clone https://github.com/fw876/helloworld package/ssr
# rm -rf  ./package/ssr/luci-app-ssr-plus
# ShadowsocksR Plus+ 依赖
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/shadowsocks-libev
rm -rf ./feeds/packages/net/xray-core
svn export https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/lean/shadowsocks-libev
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/lean/shadowsocksr-libev
# svn export https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/lean/pdnsd-alt
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/lean/pdnsd
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/srelay package/lean/srelay
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/lean/microsocks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/lean/dns2socks
svn export https://github.com/coolsnowwolf/packages/trunk/net/redsocks2 package/lean/redsocks2
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/lean/ipt2socks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/lean/trojan
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/lean/tcping
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/lean/trojan-go
svn export https://github.com/fw876/helloworld/trunk/simple-obfs package/lean/simple-obfs
svn export https://github.com/fw876/helloworld/trunk/naiveproxy package/lean/naiveproxy
svn export https://github.com/fw876/helloworld/trunk/v2ray-core package/lean/v2ray-core
svn export https://github.com/fw876/helloworld/trunk/xray-core package/lean/xray-core
svn export https://github.com/fw876/helloworld/trunk/v2ray-plugin package/lean/v2ray-plugin
svn export https://github.com/fw876/helloworld/trunk/xray-plugin package/lean/xray-plugin
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/dns2tcp package/lean/dns2tcp
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-geodata package/lean/v2ray-geodata
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust feeds/packages/net/shadowsocks-rust
#svn export https://github.com/immortalwrt/packages/trunk/net/shadowsocks-rust feeds/packages/net/shadowsocks-rust
sed -i '/Build\/Compile/a\\t$(STAGING_DIR_HOST)/bin/upx --lzma --best $$(PKG_BUILD_DIR)/$(component)' feeds/packages/net/shadowsocks-rust/Makefile
ln -sf ../../../feeds/packages/net/shadowsocks-rust ./package/feeds/packages/shadowsocks-rust
svn export https://github.com/immortalwrt/packages/trunk/net/kcptun feeds/packages/net/kcptun
ln -sf ../../../feeds/packages/net/kcptun ./package/feeds/packages/kcptun

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
# sed -i 's,default n,default y,g' ./package/lean/luci-app-vssr/Makefile
#sed -i '/result.encrypt_method/a\result.fast_open = "1"' package/lean/luci-app-vssr/root/usr/share/vssr/subscribe.lua
#sed -i 's,ispip.clang.cn/all_cn.txt,raw.sevencdn.com/QiuSimons/Chnroute/master/dist/chnroute/chnroute.txt,g' package/lean/luci-app-vssr/luasrc/controller/vssr.lua
#sed -i 's,ispip.clang.cn/all_cn.txt,raw.sevencdn.com/QiuSimons/Chnroute/master/dist/chnroute/chnroute.txt,g' package/lean/luci-app-vssr/root/usr/share/vssr/update.lua
pushd package/lean/luci-app-vssr
# sed -i 's,default n,default y,g' Makefile
# sed -i 's,+shadowsocks-libev-ss-local ,,g' Makefile
popd

#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile

# 使用默认取消自动
# sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

rm -rf ./package/diy/luci-theme-edge
rm -rf ./package/build/luci-theme-darkmatter
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/lean/luci-theme-atmaterial_new
# git clone https://github.com/john-shine/luci-theme-darkmatter.git package/diy/darkmatter
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge
git clone https://github.com/thinktip/luci-theme-neobird.git   package/new/luci-theme-neobird


# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
sed -i 's/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk

# git clone https://github.com/openwrt-dev/po2lmo.git
# cd po2lmo
# make && sudo make install

# Fix SDK
# sed -i '/$(SDK_BUILD_DIR)\/$(STAGING_SUBDIR_HOST)\/usr\/bin/d;/LICENSE/d' ./target/sdk/Makefile
 

cp -f ./package/build/banner ./package/base-files/files/etc/banner
cat ./package/build/profile > package/base-files/files/etc/profile
# cp -rf ./package/build/ramips/*  target/linux/ramips/*

cp -rf ./package/other/luci/*  ./feeds/luci/*

#修正nat回流 
cat ./package/build/set/sysctl.conf >  package/base-files/files/etc/sysctl.conf
# version=$(grep "DISTRIB_REVISION=" package/lean/default-settings/files/zzz-default-settings  | awk -F "'" '{print $2}')
# sed -i '/root:/d' ./package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$tzMxByg.$e0847wDvo3JGW4C3Qqbgb.:19052:0:99999:7:::/g' ./package/base-files/files/etc/shadow   #tiktok
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow    #password

#sed -i 's/US/CN/g ; s/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i "s/hostname='OpenWrt'/hostname='${HOSTNAME}'/g" package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-4g > ./package/lean/default-settings/files/zzz-default-settings

ver1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
export VER2="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"
#date1='Ipv6-R'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
 #date1='Ipv6-R20220508'' by Sirpdboy '
date1='EzOpWrt-4G-V2.0'
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/EzOpWrt-4G/g' include/image.mk
if [ "$VER2" = "5.4" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.4-/g' include/image.mk
elif [ "$VER2" = "5.10" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.10-/g' include/image.mk
elif [ "$VER2" = "5.15" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.15-/g' include/image.mk
fi

echo "DISTRIB_REVISION='${date1} '" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' ' >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus//luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/+"), 10)/+"), 0)/g' ./package/lean/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
# sed -i 's/h"), 50)/h"), 8)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i
