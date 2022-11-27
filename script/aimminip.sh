#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
WORKDIR=/workdir
HOSTNAME=OpenWrt
IPADDRESS=192.168.8.1
SSID=Sirpdboy
ENCRYPTION=psk2
KEY=123456
config_generate=package/base-files/files/bin/config_generate

rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/luci/applications/luci-app-openvpn-server
rm -rf ./feeds/packages/net/mentohust
rm -rf ./feeds/packages/net/open-app-filter

rm -rf ./feeds/packages/utils/cupsd
rm -rf ./feeds/packages/utils/cups-bjnp
rm -rf ./feeds/luci/applications/luci-app-cupsd
rm -rf ./feeds/luci/applications/luci-app-beardropper

# 清理
# rm -rf feeds/*/*/{smartdns,wrtbwmon,luci-app-smartdns,luci-app-ikoolproxy,luci-app-socat,luci-app-netdata,luci-app-wolplus,luci-app-arpbind}
# rm -rf package/*/{autocore,autosamba,default-settings}
# rm -rf feeds/*/*/{luci-app-aria2,luci-app-beardropper,oaf,luci-app-adguardhome,luci-app-appfilter,open-app-filter,luci-app-bypass,luci-app-wrtbwmon,luci-app-samba4,}

git clone https://github.com/loso3000/other ./package/other
# git clone https://github.com/sirpdboy/sirpdboy-package ./package/diy

git clone https://github.com/sirpdboy/luci-app-lucky ./package/lucky
git clone https://github.com/sirpdboy/luci-app-ddns-go ./package/ddns-go

# nlbwmon
sed -i 's/524288/16777216/g' feeds/packages/net/nlbwmon/files/nlbwmon.config

# 可以设置汉字名字
sed -i '/o.datatype = "hostname"/d' feeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/system.lua
# sed -i '/= "hostname"/d' /usr/lib/lua/luci/model/cbi/admin_system/system.lua

# Add ddnsto & linkease
svn export  https://github.com/linkease/nas-packages-luci/trunk/luci/ ./package/diy1/luci
svn export  https://github.com/linkease/nas-packages/trunk/network/services/ ./package/diy1/linkease
svn export  https://github.com/linkease/istore/trunk/luci/ ./package/diy1/istore
sed -i 's/1/0/g' ./package/diy1/linkease/linkease/files/linkease.config
sed -i 's/luci-lib-ipkg/luci-base/g' package/diy1/istore/luci-app-store/Makefile
# svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui

rm -rf ./feeds/packages/net/mosdns
rm -rf feeds/packages/net/mosdns package/feeds/packages/mosdns
svn export  https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
# svn co https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns #lean中包含,feeds/packages/net
# svn co https://github.com/kenzok8/openwrt-packages/trunk/mosdns ./feeds/packages/net/mosdns
# git clone https://github.com/sbwml/luci-app-mosdns package/mosdns
rm -rf ./feeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/v2ray-geodata package/geodata
sed -i "/filter_aaaa='1'/d" package/luci-app-mosdns/root/etc/init.d/mosdns
#upnp
#rm -rf ./feeds/packages/net/miniupnpd
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/upnpd/miniupnp   ./feeds/packages/net/miniupnp
rm -rf ./feeds/luci/applications/luci-app-upnp
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/upnpd/luci-app-upnp ./feeds/luci/applications/luci-app-upnp
rm -rf  ./package/diy/upnpd

mkdir -p ./package/lean
mv ./package/other/up/autocore ./package/lean/autocore
rm -rf ./package/lean/autocore  
rm -rf ./package/other/up/autocore
rm -rf  ./package/emortal/autocore
svn export  https://github.com/loso3000/other/trunk/up/autocore ./package/lean/autocore


mv ./package/other/up/automount-ntfs3g ./package/lean/automount-ntfs3g
rm -rf ./package/lean/automount  
rm -rf ./package/other/up/automount
rm -rf  package/emortal/automount
svn export  https://github.com/loso3000/other/trunk/up/automount-ntfs3g ./package/lean/automount
 
 
mv ./package/other/up/default-settings ./package/lean/default-settings
rm -rf ./package/lean/default-settings  
rm -rf  package/emortal/default-settings 
rm -rf ./package/other/up/default-settings
svn export  https://github.com/loso3000/other/trunk/up/default-settings ./package/lean/default-settings

# rm -rf  ./package/system/fstools
rm -rf  ./package/other/up/fstools
# svn export  https://github.com/loso3000/other/trunk/up/fstools ./package/system/fstools

echo "poweroff"
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

#设置
sed -i 's/option enabled.*/option enabled 0/' feeds/*/*/*/*/upnpd.config
# sed -i 's/option dports.*/option enabled 0/' feeds/*/*/*/*/upnpd.config

sed -i "s/ImmortalWrt/OpenWrt/" {package/base-files/files/bin/config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/applications/luci-app-smartdns
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns ./packages/new/luci-app-smartdns

svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit ./packages/new/luci-app-control-speedlimit

rm -rf ./feeds/luci/applications/luci-app-cupsd
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cupsd ./packages/luci-app-cupsd

rm -rf ./feeds/packages/net/adguardhome
svn export https://github.com/openwrt/packages/trunk/net/adguardhome feeds/packages/net/adguardhome
rm -rf ./feeds/luci/applications/luci-app-adguardhome
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome ./packages/luci-app-adguardhome

rm -rf ./feeds/luci/applications/luci-app-advanced
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-advanced ./packages/luci-app-advanced

rm -rf ./feeds/luci/applications/luci-app-rebootschedule
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule ./packages/luci-app-rebootschedule
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-rebootschedule ./feeds/luci/applications/luci-app-rebootschedule

rm -rf ./feeds/luci/applications/luci-app-wizard
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard  ./packages/luci-app-wizard
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard  ./feeds/luci/applications/luci-app-wizard

rm -rf ./feeds/luci/applications/wrtbwmon
rm -rf ./feeds/packages/net/wrtbwmon
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/wrtbwmon  ./feeds/packages/net/wrtbwmon
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wrtbwmon  ./feeds/luci/applications/wrtbwmon

rm -rf ./feeds/luci/applications/luci-app-wolplus
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wolplus  ./packages/luci-app-wolplus

rm -rf ./feeds/luci/applications/luci-theme-argon
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-argon  ./packages/luci-theme-argon

rm -rf ./feeds/luci/applications/luci-theme-opentopd
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentopd  ./packages/luci-theme-opentopd

rm -rf ./feeds/luci/applications/netspeedtest
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/netspeedtest  ./packages/netspeedtest
rm -rf ./feeds/luci/applications/lua-maxminddb
rm -rf ./feeds/packages/net/lua-maxminddb
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/lua-maxminddb ./feeds/packages/net/lua-maxminddb

rm -rf ./feeds/luci/applications/luci-app-control-timewol
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-timewol ./packages/new/luci-app-control-timewol

# netdata 
rm -rf ./feeds/luci/applications/luci-app-netdata
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./feeds/luci/applications/luci-app-netdata

#rm -rf ./feeds/luci/applications/luci-app-arpbind
#svn co https://github.com/loso3000/other/trunk/up/luci-app-arpbind ./feeds/luci/applications/luci-app-arpbind 
#ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind
rm -rf ./package/other/up/luci-app-arpbind

# docker
# rm -rf ./feeds/luci/applications/luci-app-dockerman
# rm -rf ./feeds/luci/applications/luci-app-docker
# rm -rf ./feeds/luci/collections/luci-lib-docker
# git clone --depth=1 https://github.com/lisaac/luci-lib-docker ./package/new/luci-lib-docker
# git clone --depth=1 https://github.com/lisaac/luci-app-dockerman ./package/new/luci-app-dockerman

# samba4
rm -rf ./feeds/luci/applications/luci-app-samba4 &&svn co https://github.com/loso3000/other/trunk/up/luci-app-samba4 ./feeds/luci/applications/luci-app-samba4

# rm -rf ./feeds/luci/applications/luci-app-socat && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat ./feeds/luci/applications/luci-app-socat
sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./feeds/luci/applications/luci-app-socat/po/zh-cn/socat.po
# ln -sf ../../../feeds/luci/applications/luci-app-socat ./package/feeds/luci/luci-app-socat

sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/实时流量监测/流量/g'  `grep "实时流量监测" -rl ./`
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g'  `grep "解锁网易云灰色歌曲" -rl ./`
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g'  `grep "解除网易云音乐播放限制" -rl ./`
sed -i 's/家庭云//g'  `grep "家庭云" -rl ./`

sed -i 's/aMule设置/电驴下载/g' ./feeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./feeds/luci/applications/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
# echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/管理登陆/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码

sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误


#断线不重拨
sed -i 's/q reload/q restart/g' ./package/network/config/firewall/files/firewall.hotplug

#echo "其他修改"
sed -i 's/option commit_interval.*/option commit_interval 1h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h

git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter


svn export  https://github.com/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/告"), 1)/告"), 11)/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua  #koolproxy

./feeds/luci/applications/luci-app-openclash
svn export https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash ./feeds/luci/applications/luci-app-openclash

#bypass
#rm -rf package/other/up/pass/luci-app-bypass
./feeds/luci/applications/luci-app-ssr-plus
#git clone https://github.com/kiddin9/openwrt-bypass package/bypass
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plus/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plusdns/Makefile

# git clone https://github.com/xiaorouji/openwrt-passwall2 package/passwall2
#svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/passwall/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
 pushd ./feeds/luci/applications/luci-app-passwall
 sed -i 's,default n,default y,g' Makefile
 popd
line_number_INCLUDE_Xray=$[`grep -m1 -n 'Include Xray' package/passwall/luci-app-passwall/Makefile|cut -d: -f1`-1]
sed -i $line_number_INCLUDE_Xray'd' package/custom/openwrt-passwall/luci-app-passwall/Makefile
sed -i $line_number_INCLUDE_Xray'd' package/custom/openwrt-passwall/luci-app-passwall/Makefile
sed -i $line_number_INCLUDE_Xray'd' package/custom/openwrt-passwall/luci-app-passwall/Makefile
line_number_INCLUDE_V2ray=$[`grep -m1 -n 'Include V2ray' package/passwall/luci-app-passwall/Makefile|cut -d: -f1`-1]
sed -i $line_number_INCLUDE_V2ray'd' package/custom/openwrt-passwall/luci-app-passwall/Makefile
sed -i $line_number_INCLUDE_V2ray'd' package/custom/openwrt-passwall/luci-app-passwall/Makefile
sed -i $line_number_INCLUDE_V2ray'd' package/custom/openwrt-passwall/luci-app-passwall/Makefile

rm -rf ./feeds/packages/net/trojan-plus
svn export https://github.com/QiuSimons/OpenWrt-Add/trunk/trojan-plus package/new/trojan-plus

# VSSR
# svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/diy/luci-app-vssr
# pushd package/diy/luci-app-vssr
# sed -i 's,default n,default y,g' Makefile
# sed -i 's,+shadowsocks-libev-ss-local ,,g' Makefile
# popd

# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
sed -i '/Rust:/d' package/diy/luci-app-vssr/Makefile
sed -i '/Rust:/d' ./package/other/up/pass/luci-app-bypass/Makefile
sed -i '/Rust:/d' ./package/other/up/pass/luci-ssr-plus/Makefile
sed -i '/Rust:/d' ./package/other/up/pass/luci-ssr-plusdns/Makefile

# 使用默认取消自动
# sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名

rm -rf ./package/diy/luci-theme-edge
svn co  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentopd package/new/luci-theme-opentopd
svn export  https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-argon package/new/luci-theme-argon
# git clone https://github.com/john-shine/luci-theme-darkmatter.git package/diy/darkmatter
# git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge
# git clone https://github.com/thinktip/luci-theme-neobird.git   package/new/luci-theme-neobird

# wget -qO package/base-files/files/etc/banner https://raw.githubusercontent.com/loso3000/other/master/patch/banner
# wget -qO package/base-files/files/etc/profile https://raw.githubusercontent.com/loso3000/other/master/patch/profile
# wget -qO package/base-files/files/etc/sysctl.conf https://raw.githubusercontent.com/loso3000/other/master/patch/sysctl.conf
# cp -f ./package/other/patch/mwan3  ./feeds/packages/net/mwan3/files/etc/config/mwan3
#修正nat回流 
cp -f ./package/other/patch/sysctl.conf ./package/base-files/files/etc/sysctl.conf
cp -f ./package/other/patch/banner ./package/base-files/files/etc/banner
cp -f ./package/other/patch/profile package/base-files/files/etc/profile
# cp -rf ./package/other/luci/*  ./feeds/luci/*

# sed -i '/root:/d' ./package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$tzMxByg.$e0847wDvo3JGW4C3Qqbgb.:19052:0:99999:7:::/g' ./package/base-files/files/etc/shadow   #tiktok
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow    #password
#zzz-default-settingsim
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingsim > ./package/lean/default-settings/files/zzz-default-settings
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingsim > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings

#sed -i 's/US/CN/g ; s/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i "s/192.168.6.1/192.168.10.1/g"  package/base-files/files/bin/config_generate

# echo '默认开启 Irqbalance'
ver1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
export VER2="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"

date1='Ipv4-Bypass-Vip-R'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
# date1='Ipv4-Bypass-Vip-R2022.11.01'
# sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20221101-Ipv4-Bypass-Vip-5.10-/g' include/image.mk
if [ "$VER2" = "5.4" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv4-Bypass-Vip-5.4-/g' include/image.mk
elif [ "$VER2" = "5.10" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv4-Bypass-Vip-5.10-/g' include/image.mk
elif [ "$VER2" = "5.15" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv4-Bypass-Vip-5.15-/g' include/image.mk
elif [ "$VER2" = "6.0" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv4-Bypass-Vip-6.0-/g' include/image.mk
fi

echo "DISTRIB_REVISION='${date1} by Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' by Sirpdboy ' >> ./package/base-files/files/etc/banner

echo '---------------------------------' >> ./package/base-files/files/etc/banner

sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus//luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/+"), 10)/+"), 0)/g' ./package/lean/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
# sed -i 's/h"), 50)/h"), 8)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i
