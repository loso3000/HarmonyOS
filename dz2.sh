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
git clone https://github.com/kenzok8/small ./package/small
# version=$(grep "DISTRIB_REVISION=" package/lean/default-settings/files/zzz-default-settings  | awk -F "'" '{print $2}')

rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-theme-opentomcat

rm -rf ./package/lean/luci-app-wrtbwmon
# rm -rf ./package/lean/luci-app-vlmcsd

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
cat  ./package/build/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3 && rm -rf ./package/build/mwan3
# rm -rf ./package/build/mwan3 && curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
# rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3
# rm -rf ./feeds/packages/net/https-dns-proxy  && svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy ./feeds/packages/net/https-dns-proxy
rm -rf ./feeds/packages/devel/ninja   && svn co https://github.com/Lienol/openwrt-packages/trunk/devel/ninja feeds/packages/devel/ninja
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
rm -rf ./package/build/shortcut-fe

# rm -rf ./package/lean/ddns-scripts_aliyun
# rm -rf ./package/lean/ddns-scripts_dnspod
# rm -rf ./package/lean/luci-app-zerotier
# rm -rf ./feeds/packages/net/zerotier
sed -i '/45)./d' ./package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' ./package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' ./package/lean/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
rm -rf ./package/build/luci-app-zerotier
rm -rf ./package/build/zerotier
# sed -i '/45)./d' ./package/build/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
# sed -i 's/vpn/services/g' ./package/build/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
# sed -i 's/vpn/services/g' ./package/build/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier

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
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
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

#修正连接数 
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf
#修正nat回流 
cat ./package/build/set/sysctl.conf >>  package/base-files/files/etc/sysctl.conf
# 最大连接数
sed -i 's/16384/65535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf
echo '灰色歌曲'
rm -rf ./package/lean/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

cat ./package/build/profile > package/base-files/files/etc/profile
# easymensh
cat ./package/build/set/003-35-net-Add-netif_rx_any_context.diff.patch > ./target/linux/generic/backport-5.4/003-35-net-Add-netif_rx_any_context.diff.patch
# wifidog
cat ./package/build/set/wifidog.init > ./feeds/packages/net/wifidog/files/wifidog.init
#libyang
# cat ../../path/libyang/Makefile > ./feeds/packages/libs/libyang/Makefile

# Boost 通用即插即用
rm -rf feeds/packages/libs/boost && svn co https://github.com/openwrt/packages/trunk/libs/boost feeds/packages/libs/boost
# 全能推送
rm -rf package/lean/luci-app-pushbot && \
git clone https://github.com/zzsj0928/luci-app-pushbot package/lean/luci-app-pushbot
rm -rf package/lean/luci-app-jd-dailybonus && \
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus package/lean/luci-app-jd-dailybonus
# 京东签到 By Jerrykuku
# sed -i 's/wget-ssl/wget/g' package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/newapp.sh package/lean/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua
# rm -rf ./package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/JD_DailyBonus.js
# wget -P ./package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/ https://github.com/NobyDa/Script/raw/master/JD-DailyBonus/JD_DailyBonus.js
rm -rf package/lean/luci-app-serverchan && \
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./package/lean/luci-app-serverchan

echo '替换aria2'
rm -rf feeds/luci/applications/luci-app-aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-aria2 feeds/luci/applications/luci-app-aria2
rm -rf feeds/packages/net/aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/net/aria2 feeds/packages/net/aria2

#echo 'amule'
#git clone https://github.com/MatteoRagni/AmuleWebUI-Reloaded files/usr/share/amule/webserver/AmuleWebUI-Reloaded
#sed -i 's/runasuser "$config_dir"/runasuser "$config_dir"\nwget -P "$config_dir" -O "$config_dir\/nodes.dat" http:\/\/upd.emule-security.org\/nodes.dat/g' package/lean/luci-app-amule/root/etc/init.d/amule
#sed -i "s/tb.innerHTML = '<em>/tb.innerHTML = '<em><b><font color=red>/g" package/lean/luci-app-amule/luasrc/view/amule/overview_status.htm
#sed -i "s/var links = '<em>/var links = '<em><b><font color=green>/g" package/lean/luci-app-amule/luasrc/view/amule/overview_status.htm
#rm -rf package/lean/antileech/src/* && \
#git clone https://github.com/persmule/amule-dlp.antiLeech package/lean/antileech/src

git clone https://github.com/kiddin9/luci-app-dnsfilter package/lean/luci-app-dnsfilter
#svn co https://github.com/small-5/luci-app-adblock-plus/trunk/ ./package/diy/luci-app-adblock-plus

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash
# rm -rf package/luci-app-openclash/root/usr/share/openclash/yacd   #clash插件显示统计
# wget https://github.com/haishanh/yacd/archive/gh-pages.zip
# unzip gh-pages.zip
# mv yacd-gh-pages package/luci-app-openclash/root/usr/share/openclash/yacd
# rm -rf gh-pages.zip

# mkdir -p files/etc/openclash/core
# open_clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# offical_clash_main_url=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# wget -qO- $open_clash_main_url | tar xOvz > files/etc/openclash/core/clash
# wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
# wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game
# chmod +x files/etc/openclash/core/clash*

# git clone https://github.com/AlexZhuo/luci-app-bandwidthd /package/diy/luci-app-bandwidthd
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter
 # 花生壳内网穿透
# svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
# svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/phtunnel package/new/phtunnel
# svn co https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
# svn co https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/phtunnel package/new/phtunnel
# svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-oray package/new/luci-app-oray

# Passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/passwall
# git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/passwall/luci-app-passwall
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile

echo ' ShadowsocksR Plus+'
# git clone https://github.com/fw876/helloworld package/ssr
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
# rm -rf package/build/luci-app-ssr-plus
# cp -f ./package/build/set/myip.htm ./package/lean/luci-app-ssr-plus/luasrc/view/shadowsocksr/myip.htm
# sed -i '/status/am:section(SimpleSection).template = "shadowsocksr/myip"' ./package/lean/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua
# pushd package/lean
# wget -qO - https://github.com/fw876/helloworld/pull/513.patch | patch -p1
# wget -qO - https://github.com/QiuSimons/helloworld-fw876/commit/c1674ad.patch | patch -p1
# popd
# pushd package/lean/luci-app-ssr-plus
# sed -i 's,default n,default y,g' ./package/lean/luci-app-ssr-plus/Makefile
# sed -i 's,Xray:xray ,Xray:xray-core ,g' package/lean/luci-app-ssr-plus
# sed -i '/V2ray:v2ray/d' Makefile
# sed -i '/plugin:v2ray/d' Makefile

sed -i 's,default n,default y,g' ./package/build/pass/luci-app-ssr-plus/Makefile
sed -i 's,default n,default y,g' ./package/build/pass/luci-app-bypass/Makefile

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
sed -i 's,default n,default y,g' ./package/lean/luci-app-vssr/Makefile

# git clone https://github.com/jerrykuku/luci-app-ttnode.git     package/diy/luci-app-ttnode
# svn co https://github.com/jerrykuku/luci-app-ttnode/trunk/  package/diy/luci-app-ttnode
# sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
# sed -i "/mediaurlbase/d" package/*/luci-theme*/root/etc/uci-defaults/*
# sed -i "/mediaurlbase/d" feed/*/luci-theme*/root/etc/uci-defaults/*
# 使用默认取消自动
# sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile

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

# patch -p1 < ../PATCH/new/main/r8168-fix_LAN_led-for_r4s-from_TL.patch

# Add driver for rtl8821cu & rtl8812au-ac
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/ctcgfw/rtl8812au-ac ./package/ctcgfw
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/ctcgfw/rtl8821cu ./package/ctcgfw

# git clone https://github.com/openwrt-dev/po2lmo.git
# cd po2lmo
# make && sudo make install

# 在 X86 架构下移除 Shadowsocks-rust
# sed -i '/Rust:/d' package/lean/luci-app-ssr-plus/Makefile
# sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
# sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile

# find ./ -name *.orig | xargs rm -f
# find ./ -name *.rej | xargs rm -f

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
# Mod zzz-default-settings

#sed -i '/http/d' package/build/default-settings/files/zzz-default-settings
#sed -i '/openwrt_luci/d' package/build/default-settings/files/zzz-default-settings

# Fix SDK
# sed -i '/$(SDK_BUILD_DIR)\/$(STAGING_SUBDIR_HOST)\/usr\/bin/d;/LICENSE/d' ./target/sdk/Makefile

# Disable opkg signature check
# sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf
# Add execute permission for ipv6-helper
#chmod +x /bin/ipv6-helper

#echo '默认开启 Irqbalance'
#sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

cp -f ./package/build/banner ./package/base-files/files/etc/
# date1='${version} Ipv6-Mini-S'`TZ=UTC-8 date +%Y.%m.%d -d +"8"hour`
# date1=' JZ '`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`' '
date1=' JZ '`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`' by Sirpdboy '
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-JZ-/g' include/image.mk
echo "DISTRIB_REVISION='${date1}'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}  >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner
# sed -i 's/请输入用户名和密码。/欢迎登陆，请输入密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码
# sed -i '/root:/d' ./package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$g9j2tj.v$w0Bg75cJu0mlJLcg2xoAk.:18870:0:99999:7:::/g' ./package/base-files/files/etc/shadow   #chuqi
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow    #password
# sed -i 's/root::0:0:99999:7:::/root:$1$fBBokrlW$4855fjGMAYdopNbA9F/mk.:0:0:99999:7:::/g'  ./package/base-files/files/etc/shadow    #root
# echo "root:$1$fBBokrlW$4855fjGMAYdopNbA9F/mk.:18878:0:99999:7::::" >>  ./package/base-files/files/etc/shadow  #root
# sed -i "s/hostname='OpenWrt'/hostname='CHUQi_WiFi'/g" package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
# cp -f package/build/shortcut-fe ./package/base-files/files/etc/init.d

# Modify default WiFi SSID
# sed -i "s/set wireless.default_radio\${devidx}.ssid=OpenWrt/set wireless.default_radio\${devidx}.ssid='$SSID'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default WiFi Encryption
# sed -i "s/set wireless.default_radio\${devidx}.encryption=none/set wireless.default_radio\${devidx}.encryption='$ENCRYPTION'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default WiFi Key
# sed -i "/set wireless.default_radio\${devidx}.mode=ap/a\                        set wireless.default_radio\${devidx}.key='$KEY'" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Forced WiFi to enable
# sed -i 's/set wireless.radio\${devidx}.disabled=1/set wireless.radio\${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#内核设置 甜糖
# cat ./package/build/set/Config-kernel.in   > ./config/Config-kernel.in
# echo  'CONFIG_BINFMT_MISC=y' >> ./package/target/linux/x86/config-5.10
# sed -i '/CONFIG_NVME_MULTIPATH /d' ./package/target/linux/x86/config-5.4
# sed -i '/CONFIG_NVME_TCP /d' ./package/target/linux/x86/config-5.4
# echo  'CONFIG_EXTRA_FIRMWARE="i915/kbl_dmc_ver1_04.bin"'   >> ./package/target/linux/x86/config-5.10
# echo  'CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"'  >> ./package/target/linux/x86/config-5.10
# echo  'CONFIG_NVME_FABRICS=y'  >> ./package/target/linux/x86/config-5.4
# echo  'CONFIG_NVME_FC=y' >> ./package/target/linux/x86/config-5.4
# echo  'CONFIG_NVME_MULTIPATH=y' >> ./package/target/linux/x86/config-5.4
# echo  'CONFIG_NVME_TCP=y' >> ./package/target/linux/x86/config-5.4

# find target/linux -path "target/linux/*/config-*" | xargs -i sed -i '$a CONFIG_ACPI=y\nCONFIG_X86_ACPI_CPUFREQ=y\n \
# CONFIG_NR_CPUS=128\nCONFIG_FAT_DEFAULT_IOCHARSET="utf8"\nCONFIG_CRYPTO_CHACHA20_NEON=y\nCONFIG_CRYPTO_CHACHA20POLY1305=y\nCONFIG_BINFMT_MISC=y' {}
# for X in $(ls -1 target/linux/x86 | grep "config-"); do echo -e "\n$(cat ./package/build/DRM-I915)" >> target/linux/x86/${X}; done
# sed -i "/dns_caching_dns/d" $(PKG_Finder d package luci-app-turboacc)/root/etc/config/turboacc
# echo "	option dns_caching_dns '223.5.5.5,114.114.114.114'" >> $(PKG_Finder d package luci-app-turboacc)/root/etc/config/turboacc

sed -i 's/+"), 10)/+"), 0)/g' ./package/lean/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/h"), 50)/h"), 8)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
# sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/lean/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i

PKG_Finder() {
	local Result
	[[ $# -ne 3 ]] && {
		TIME "Usage: PKG_Finder <f | d> Search_Path Target_Name/Target_Path"
		return 0
	}
	Result=$(find $2 -name $3 -type $1 -exec echo {} \;)
	[[ -n ${Result} ]] && echo "${Result}"
}
