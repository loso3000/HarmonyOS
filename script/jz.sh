#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
HOSTNAME=OpenWrt
IPADDRESS=192.168.8.1
SSID=OpWiFi
ENCRYPTION=psk2+ccmp
KEY=OpWiFi

# 使用 O2 级别的优化
# sed -i 's/O3/O2/g' include/target.mk
git clone https://github.com/sirpdboy/build.git ./package/build
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./package/lean/luci-app-vlmcsd
# rm -rf ./package/lean/vlmcsd
rm -rf ./package/lean/luci-app-wrtbwmon

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
cat  ./package/build/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3 && rm -rf ./package/build/mwan3
# rm -rf ./package/build/mwan3 && curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
# rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3
# rm -rf ./feeds/packages/net/https-dns-proxy  && svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy ./feeds/packages/net/https-dns-proxy
# rm -rf ./feeds/packages/devel/ninja   && svn co https://github.com/Lienol/openwrt-packages/trunk/devel/ninja feeds/packages/devel/ninja
rm -rf ./package/build/miniupnpd  
# rm -rf ./feeds/packages/net/miniupnpd  && svn co https://github.com/sirpdboy/build/trunk/miniupnpd ./feeds/packages/net/miniupnpd
rm -rf ./package/lean/automount
rm -rf ./package/lean/autosamba
rm -rf ./package/lean/luci-app-accesscontrol
# rm -rf ./package/build/autocore
rm -rf ./package/lean/autocore
rm -rf ./package/lean/default-settings
# rm -rf ./package/lean/luci-app-ramfree
rm -rf ./package/lean/luci-app-arpbind
rm -rf ./package/build/luci-app-arpbind
rm -rf ./package/lean/luci-app-docker
rm -rf ./package/lean/luci-app-dockerman
rm -rf ./package/lean/trojan

# rm -rf ./package/lean/ddns-scripts_aliyun
# rm -rf ./package/lean/ddns-scripts_dnspod
# rm -rf ./package/lean/luci-app-zerotier
# rm -rf ./feeds/packages/net/zerotier
sed -i '/45)./d' ./package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' ./package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' ./package/lean/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
rm -rf ./package/build/luci-app-zerotier
rm -rf ./package/build/zerotier

rm -rf ./package/lean/luci-app-baidupcs-web && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-baidupcs-web ./package/lean/luci-app-baidupcs-web
# ksmbd
rm -rf ./feeds/packages/net/ksmbd-tools && svn co https://github.com/sirpdboy/build/trunk/ksmbd-tools ./feeds/packages/net/ksmbd-tools
rm -rf ./feeds/luci/applications/luci-app-samba 
svn co https://github.com/sirpdboy/build/trunk/luci-app-samba ./feeds/luci/applications/luci-app-samba
rm -rf ./package/network/services/samba36 
svn co https://github.com/sirpdboy/build/trunk/samba36 ./package/network/services/samba36
rm -rf ./package/build/samba4
# rm -rf ./package/lean/samba4
# rm -rf ./feeds/package/net/samba4 && svn co https://github.com/sirpdboy/build/trunk/samba4 ./feeds/package/net/samba4
rm -rf ./package/lean/luci-app-samba4

# curl -fsSL https://raw.githubusercontent.com/loso3000/other/master/patch/autocore/files/x86/index.htm > package/lean/autocore/files/x86/index.htm
# curl -fsSL https://raw.githubusercontent.com/loso3000/other/master/patch/autocore/files/arm/index.htm > package/lean/autocore/files/arm/index.htm
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings2 > ./package/build/default-settings/files/zzz-default-settings
echo '添加关机'
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

sed -i 's/网络存储/存储/g' ./package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' ./package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' ./package/lean/luci-app-turboacc/po/zh-cn/turboacc.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' ./package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' ./package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' ./package/lean/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i 's/实时流量监测/流量/g' ./package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/KMS 服务器/KMS激活/g' ./package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/USB 打印服务器"/打印服务/g' ./package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/aMule设置/电驴下载/g' ./package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/网络存储/存储/g' ./package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./package/lean/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
sed -i 's/带宽监控/监控/g' ./feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/a.default = "0"/a.default = "1"/g' ./package/lean/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
echo  "        option tls_enable 'true'" >> ./package/lean/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/lean/samba4/files/smb.conf.template   #共享问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP用IPV6

#修正nat回流 
# cat ./package/build/set/sysctl.conf >>  package/base-files/files/etc/sysctl.conf
#修正连接数 
# sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# 最大连接数
sed -i 's/65535/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf

#echo "其他修改"
# sed -i 's/option commit_interval 24h/option commit_interval 10m/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为10分钟
#sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
#sed -i 's@interval: 5@interval: 1@g' package/lean/luci-app-wrtbwmon/htdocs/luci-static/wrtbwmon.js #wrtbwmon默认刷新时间更改为1秒

echo '灰色歌曲'
rm -rf ./package/lean/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

cat ./package/build/profile > package/base-files/files/etc/profile
# easymensh
# cat ./package/build/set/003-35-net-Add-netif_rx_any_context.diff.patch > ./target/linux/generic/backport-5.4/003-35-net-Add-netif_rx_any_context.diff.patch
# wifidog
# cat ./package/build/set/wifidog.init > ./feeds/packages/net/wifidog/files/wifidog.init
#libyang
# cat ../../path/libyang/Makefile > ./feeds/packages/libs/libyang/Makefile

# 全能推送
# rm -rf package/lean/luci-app-pushbot && \
# git clone https://github.com/zzsj0928/luci-app-pushbot package/lean/luci-app-pushbot
rm -rf package/lean/luci-app-jd-dailybonus && \
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus package/lean/luci-app-jd-dailybonus
# 京东签到 By Jerrykuku
rm -rf package/lean/luci-app-serverchan && \
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/lean/luci-app-serverchan

echo '替换aria2'
rm -rf feeds/luci/applications/luci-app-aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-aria2 feeds/luci/applications/luci-app-aria2
rm -rf feeds/packages/net/aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/net/aria2 feeds/packages/net/aria2

git clone https://github.com/kiddin9/luci-app-dnsfilter package/lean/luci-app-dnsfilter
# svn co https://github.com/small-5/luci-app-adblock-plus/trunk/ ./package/diy/luci-app-adblock-plus

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash

git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter

# Passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/passwall/luci-app-passwall
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile

echo ' ShadowsocksR Plus+'
git clone https://github.com/fw876/helloworld package/ssr
sed -i 's,default n,default y,g' ./package/ssr/luci-app-ssr-plus/Makefile
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus

cp -f ./package/build/set/myip.htm ./package/lean/luci-app-ssr-plus/luasrc/view/shadowsocksr/myip.htm
sed -i '/status/am:section(SimpleSection).template = "shadowsocksr/myip"' ./package/lean/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua
rm -rf package/build/pass
# sed -i 's,default n,default y,g' ./package/build/pass/luci-app-ssr-plus/Makefile

# rm -rf package/build/pass/luci-app-bypass
# sed -i 's,default n,default y,g' ./package/build/pass/luci-app-bypass/Makefile

git clone https://github.com/kiddin9/openwrt-bypass package/openwrt-bypass
sed -i 's,default n,default y,g' ./package/openwrt-bypass/luci-app-bypass/Makefile

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
sed -i 's,default n,default y,g' ./package/lean/luci-app-vssr/Makefile

# sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile

rm -rf ./package/diy/luci-theme-edge
rm -rf ./package/build/luci-theme-darkmatter
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/lean/luci-theme-atmaterial_new
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git package/diy/darkmatter
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge

# sed -i "/mediaurlbase/d" package/*/luci-theme*/root/etc/uci-defaults/*
# sed -i "/mediaurlbase/d" feed/*/luci-theme*/root/etc/uci-defaults/*
# 使用默认取消自动
# sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i "s/bootstrap/opentopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
# sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile

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


# 在 X86 架构下移除 Shadowsocks-rust
# sed -i '/Rust:/d' package/lean/luci-app-ssr-plus/Makefile
# sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
# sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile

# find ./ -name *.orig | xargs rm -f
# find ./ -name *.rej | xargs rm -f

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk

cp -f ./package/build/banner ./package/base-files/files/etc/
date1=' JZ '`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`' by Sirpdboy '
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-JZ-/g' include/image.mk
echo "DISTRIB_REVISION='${date1}'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}  >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/h"), 50)/h"), 10)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
# sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/lean/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i
