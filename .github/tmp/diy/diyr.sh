#!/bin/bash

is_vip() {
case "${CONFIG_S}" in
     "Vip"*) return 0 ;;
     "Free"*) return 1 ;;
esac
}

github="github.com"
rm -rf ./package/lean/r8101
# rm -rf ./package/lean/r8168
# rm -rf ./package/lean/r8152
# rm -rf ./package/lean/r8125
# rm -rf ./package/lean/r8126
# Realtek driver - R8168 & R8125 & R8126 & R8152 & R8101
# git clone https://$github/sbwml/package_kernel_r8168 package/kernel/r8168
# git clone https://$github/sbwml/package_kernel_r8152 package/kernel/r8152
git clone https://$github/sbwml/package_kernel_r8101 package/kernel/r8101
# git clone https://$github/sbwml/package_kernel_r8125 package/kernel/r8125
# git clone https://$github/sbwml/package_kernel_r8126 package/kernel/r8126
# mac80211 - fix linux 6.6 & add rtw89
# rm -rf package/kernel/mac80211
# git clone https://$github/sbwml/package_kernel_mac80211 package/kernel/mac80211
# mt76 - update to 2023-12-18
# rm -rf package/kernel/mt76
# git clone https://$github/sbwml/package_kernel_mt76 package/kernel/mt76
# curl/8.5.0 - fix passwall `time_pretransfer` check
# rm -rf feeds/packages/net/curl
# git clone https://$github/sbwml/feeds_packages_net_curl feeds/packages/net/curl

config_generate=package/base-files/files/bin/config_generate
[ ! -d files/root ] || mkdir -p files/root

[[ -n $CONFIG_S ]] || CONFIG_S=Vip-Mini
rm -rf ./feeds/luci/themes/luci-app-filter
rm -rf ./feeds/luci/themes/luci-app-oaf
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/packages/net/mentohust
rm -rf ./feeds/packages/net/open-app-filter
rm -rf  ./feeds/luci/applications/luci-app-arpbind
rm -rf  ./feeds/packages/net/oaf
rm -rf  ./feeds/packages/net/wget

rm -rf  ./feeds/packages/net/zsh
rm -rf  ./feeds/packages/net/homebox
rm -rf  ./feeds/packages/net/naiveproxy
# 修复 hostapd 报错
cp -f diy/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 清理
# Add luci-app-passwall
# git clone --depth=1 https://$github/xiaorouji/openwrt-passwall-packages  ./package/openwrt-passwall
git clone --depth=1 https://$github/xiaorouji/openwrt-passwall2 ./package/passwall2
git clone --depth=1 https://$github/xiaorouji/openwrt-passwall ./package/passwall

rm -rf ./package/passwall2/luci-app-passwall2/htdocs/luci-static/resources/

#20240831error
sed -i '/^UBOOT_TARGETS := rk3528-evb rk3588-evb/s/^/#/' package/boot/uboot-rk35xx/Makefile

git clone https://$github/sbwml/openwrt_helloworld  ./package/ssr
rm -rf ./package/ssr/luci-app-ssr-plus
rm -rf ./package/ssr/luci-app-passwall
rm -rf ./package/ssr/luci-app-passwall2

rm -rf ./package/ssr/mosdns
rm -rf ./package/ssr/trojan-plus
# rm -rf ./package/ssr/xray-core
rm -rf ./package/ssr/xray-plugin
# rm -rf ./package/ssr/naiveproxy
rm -rf ./package/ssr/v2ray-plugin
rm -rf ./package/ssr/v2ray-core
rm -rf ./package/ssr/pdnsd
rm -rf ./package/ssr/lua-neturl
rm -rf ./package/ssr/redsocks2
# rm -rf ./package/ssr/shadow-tls

rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/trojan-plus
rm -rf ./package/openwrt-passwall/xray-core
rm -rf ./package/openwrt-passwall/xray-plugin
rm -rf ./package/openwrt-passwall/mosdns
rm -rf ./package/openwrt-passwall/naiveproxy

git clone https://$github/loso3000/other ./package/other
git clone https://$github/sirpdboy/sirpdboy-package ./package/diy

rm -rf ./package/other/up/pass/shadow-tls
rm -rf ./package/other/up/pass/xray-core
rm -rf ./package/other/up/pass/naiveproxy

#daed
#cp -rf ./package/other/up/daed/netsupport.mk   ./package/kernel/linux/modules/netsupport.mk
# add luci-app-daed
# git clone https://$github/sbwml/luci-app-daed-next ./package/daed-next
# cp -rf ./package/other/up/daed/bpf.mk ./include/bpf.mk

# luci-app-daed-next
git clone --depth=1 https://github.com/QiuSimons/luci-app-daed-next ./package/luci-app-daed-next

#samrtdns
rm -rf ./feeds/luci/applications/luci-app-smartdns
rm -rf  ./feeds/packages/net/smartdns
rm -rf ./package/diy/luci-app-smartdns
rm -rf ./package/diy/smartdns
# git clone -b lede --single-branch https://$github/pymumu/luci-app-smartdns ./feeds/luci/applications/luci-app-smartdns
mv -f ./package/other/up/tool/smartdns/smartdns  ./feeds/packages/net/smartdns
mv -f ./package/other/up/tool/smartdns/luci-app-smartdns ./feeds/luci/applications/luci-app-smartdns

mv -f ./package/other/up/tool/netspeedtest/*  ./package/other/
mv -f ./package/other/up/tool/oaf/*  ./package/other/
mv -f ./package/other/up/tool/smartdns/*  ./package/other/
rm -rf ./package/other/up/luci-theme-argon
rm -rf ./package/other/up/luci-app-wrtbwmon
rm -rf ./package/other/up/luci-theme-design
rm -rf ./package/other/up/luci-theme-edge
rm -rf ./package/other/up/luci-theme-ifit
rm -rf ./package/other/up/luci-theme-neobird
rm -rf ./package/other/up/luci-theme-opentopd
rm -rf ./package/other/up/lluci-app-udpxy
rm -rf ./package/other/up/luci-app-arpbind
rm -rf ./package/other/up/luci-app-argon-config
rm -rf ./package/other/up/luci-app-arpbind


rm -rf ./package/diy/luci-app-adguardhome
rm -rf ./package/diy/luci-app-parentcontrol
rm -rf ./package/diy/luci-app-partexp
rm -rf  ./package/diy/luci-app-netwizard
rm -rf  ./package/diy/luci-app-autotimeset
rm -rf  ./package/diy/luci-app-timecontrol
rm -rf  ./package/diy/luci-app-socat
rm -rf  ./package/diy/netspeedtest
rm -rf  ./package/diy/luci-theme-kucat
rm -rf  ./package/diy/luci-app-advancedplus
rm -rf  ./package/diy/luci-app-fileassistant
rm -rf  ./package/diy/luci-app-wrtbwmon
rm -rf  ./package/diy/luci-app-cpulimit
rm -rf  ./package/diy/luci-app-dockerman
rm -rf  ./package/diy/luci-app-eqosplus
rm -rf  ./package/diy/luci-app-lucky
rm -rf  ./package/diy/luci-app-netdata
rm -rf  ./package/diy/luci-app-poweroffdevice
rm -rf  ./package/diy/luci-app-pppoe-server
rm -rf  ./package/diy/luci-app-pptpserver
rm -rf  ./package/diy/luci-app-smartdns
rm -rf  ./package/diy/luci-app-wifidog
rm -rf  ./package/diy/luci-app-wolplus
rm -rf  ./package/diy/wrtbwmon
rm -rf  ./feeds/luci/applications/luci-app-netdata


rm -rf ./feeds/packages/net/aria2
rm -rf ./feeds/luci/applications/luci-app-aria2  package/feeds/packages/luci-app-aria2
sed -i 's/ariang/ariang +webui-aria2/g' ./package/diy/luci-app-aria2/Makefile

sed -i 's,default n,default y,g' package/other/up/pass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plus/Makefile
# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
sed -i '/Rust:/d' package/diy/luci-app-vssr/Makefile
sed -i '/Rust:/d' ./package/other/up/pass/luci-app-bypass/Makefile
sed -i '/Rust:/d' ./package/other/up/pass/luci-ssr-plus/Makefile
sed -i '/Rust:/d' ./package/other/up/pass/luci-ssr-plusdns/Makefile

#修正nat回流 
cat ./package/other/patch/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
cat ./package/other/patch/banner > ./package/base-files/files/etc/banner
cat ./package/other/patch/profile > ./package/base-files/files/etc/profile

rm -rf ./feeds/luci/applications/luci-app-udpxy
rm -rf ./feeds/luci/applications/luci-app-msd_lite
rm -rf  ./feeds/packages/net/msd_lite


mkdir -p ./package/lean
rm -rf ./package/lean/autocore ./package/emortal/autocore
mv ./package/other/up/myautocore ./package/lean/autocore
sed -i 's/myautocore/autocore/g' ./package/lean/autocore/Makefile

# samba4
rm -rf ./package/lean/autosamba
rm -rf  package/emortal/autosamba
# mv ./package/other/up/autosamba-samba4 ./package/lean/autosamba
# sed -i 's/autosamba-samba4/autosamba/g' ./package/lean/autosamba/Makefile

rm -rf ./feeds/luci/applications/luci-app-samba4
mv -f ./package/other/up/luci-app-samba4 ./feeds/luci/applications/luci-app-samba4

rm -rf  package/emortal/automount
rm -rf ./package/lean/automount
# mv ./package/other/up/automount-ntfs3g ./package/lean/automount
# sed -i 's/automount-ntfs/automount/g' ./package/lean/automount/Makefile

rm -rf ./package/lean/default-settings
rm -rf  package/emortal/default-settings
# mv -rf  ./package/other/up/default-settings  ./package/lean/default-settings

# transmission web error
sed -i "s/procd_add_jail transmission log/procd_add_jail_mount '$web_home'/g"  feeds/packages/net/transmission/files/transmission.init

rm -rf ./feeds/luci/applications/luci-app-beardropper

rm -rf ./feeds/luci/applications/luci-app-p910nd
rm -rf ./package/diy/luci-app-eqosplus
rm -rf ./package/diy/luci-app-poweroffdevice
#rm -rf ./package/diy/luci-app-wrtbwmon


rm -rf ./package/other/up/wrtbwmon
rm -rf ./package/other/up/luci-app-wrtbwmon
rm -rf ./feeds/packages/net/wrtbwmon ./package/feeds/packages/wrtbwmon
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon ./package/feeds/packages/luci-app-wrtbwmon

# sed -i 's/-D_GNU_SOURCE/-D_GNU_SOURCE -Wno-error=use-after-free/g' ./package/libs/elfutils/Makefile

#  coremark
sed -i '/echo/d' ./feeds/packages/utils/coremark/coremark

git clone https://github.com/sirpdboy/luci-app-lucky ./package/lucky
# rm ./package/lucky/luci-app-lucky/po/zh_Hans
# mv ./package/lucky/luci-app-lucky/po/zh-cn ./package/ddns-go/luci-app-lucky/po/zh_Hans
rm -rf ./feeds/packages/net/ddns-go
rm -rf  ./feeds/luci/applications/luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go ./package/ddns-go
# rm ./package/ddns-go/luci-app-ddns-go/po/zh_Hans
# mv ./package/ddns-go/luci-app-ddns-go/po/zh-cn ./package/ddns-go/luci-app-ddns-go/po/zh_Hans
# nlbwmon
sed -i 's/524288/16777216/g' feeds/packages/net/nlbwmon/files/nlbwmon.config
# 可以设置汉字名字
sed -i '/o.datatype = "hostname"/d' feeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/system.lua
# sed -i '/= "hostname"/d' /usr/lib/lua/luci/model/cbi/admin_system/system.lua


# Add ddnsto & linkease
 git clone  https://$github/linkease/nas-packages-luci ./package/nas-packages-luci
 git clone  https://$github/linkease/nas-packages ./package/nas-packages
 git clone  https://$github/linkease/istore ./package/istore
sed -i 's/1/0/g' ./package/nas-packages/network/services/linkease/files/linkease.config
sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci/luci-app-store/Makefile

# rm -rf ./package/other/luci-app-mwan3 ./package/other/mwan3
rm -rf ./feeds/luci/applications/luci-app-mwan3
rm -rf ./feeds/packages/net/mwan3
mv -f ./package/other/up/mwan3 ./feeds/packages/net/mwan3
mv -f ./package/other/up/luci-app-mwan3 ./feeds/luci/applications/luci-app-mwan3

rm -rf ./feeds/packages/utils/v2dat
rm -rf ./feeds/packages/net/mosdns
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata
git clone https://$github/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/luci-app-mosdns -b v5-lua package/mosdns
git clone https://$github/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://$github/sbwml/v2ray-geodata feeds/packages/net/v2ray-geodata

# alist
 rm -rf ./feeds/packages/net/alist
 rm -rf  ./feeds/luci/applications/luci-app-alist
# alist
git clone https://$github/sbwml/luci-app-alist package/alist
# git clone -b v3.32.0 --depth 1 https://$github/sbwml/luci-app-alist package/alist
sed -i '/config.json/a\ rm -rf \/var\/run\/alist.sock' package/alist/alist/files/alist.init
sed -i 's/网络存储/存储/g' ./package/alist/luci-app-alist/po/zh-cn/alist.po
rm -rf feeds/packages/lang/golang
# git clone https://$github/sbwml/packages_lang_golang -b 21.x feeds/packages/lang/golang
git clone https://$github/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

#upnp
rm -rf ./feeds/luci/applications/luci-app-upnp  package/feeds/packages/luci-app-upnp
# rm -rf  ./package/diy/upnpd
#设置
sed -i 's/option enabled.*/option enabled 0/' feeds/*/*/*/*/upnpd.config
sed -i 's/option dports.*/option enabled 2/' feeds/*/*/*/*/upnpd.config

sed -i "s/ImmortalWrt/EzOpWrt/" {package/base-files/files/bin/config_generate,include/version.mk}
sed -i "s/OpenWrt/EzOpWrt/" {package/base-files/files/bin/config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config
#修改默认主机名
sed -i "s/hostname='.*'/hostname='EzOpWrt'/g" ./package/base-files/files/bin/config_generate

# netdata 
rm -rf ./feeds/luci/applications/luci-app-netdata package/feeds/packages/luci-app-netdata

rm -rf ./feeds/luci/applications/luci-app-arpbind

# Add luci-app-dockerman
# rm -rf ./feeds/luci/applications/luci-app-dockerman
# rm -rf ./feeds/luci/applications/luci-app-docker
# rm -rf ./feeds/luci/collections/luci-lib-docker
# rm -rf ./package/diy/luci-app-dockerman
#rm -rf ./feeds/packages/utils/docker
# git clone --depth=1 https://$github/lisaac/luci-lib-docker ./package/new/luci-lib-docker
# git clone --depth=1 https://$github/lisaac/luci-app-dockerman ./package/new/luci-app-dockerman

# sed -i '/auto_start/d' ./package/diy/luci-app-dockerman/root/etc/uci-defaults/luci-app-dockerman
# sed -i '/sysctl.d/d' feeds/packages/utils/dockerd/Makefile
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.10
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.15
# sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' ./package/new/luci-app-dockerman/Makefile
# sed -i '$i /etc/init.d/dockerd restart &' ./package/new/luci-app-dockerman/root/etc/uci-defaults/*

rm -rf ./feeds/packages/net/softethervpn5 package/feeds/packages/softethervpn5

rm -rf ./feeds/luci/applications/luci-app-socat  ./package/feeds/luci/luci-app-socat
#sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./feeds/luci/applications/luci-app-socat/po/zh-cn/socat.po

rm -rf ./package/diy/luci-app-socat
#sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./package/diy/luci-app-socat/po/zh-cn/socat.po

sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"P910nd - 打印服务器"/"打印服务"/g' `grep "P910nd - 打印服务器" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/实时流量监测/流量/g'  `grep "实时流量监测" -rl ./`
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g'  `grep "解锁网易云灰色歌曲" -rl ./`
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g'  `grep "解除网易云音乐播放限制" -rl ./`
sed -i 's/家庭云//g'  `grep "家庭云" -rl ./`
sed -i 's/msgstr "挂载 SMB 网络共享"/msgstr "CIFS挂载共享"/g' ./feeds/luci/applications/luci-app-cifs-mount/po/zh-cn/cifs.po

sed -i 's/aMule设置/电驴下载/g' ./feeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./feeds/luci/applications/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
# echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/管理登陆/g' ./feeds/luci/modules/luci-base/po/*/base.po   #用户名密码

#cifs挂pan
sed -i 's/mount -t cifs/busybox mount -t cifs/g' ./feeds/luci/applications/luci-app-cifs-mount/root/etc/init.d/cifs

#cifs
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua   #dnsfilter
sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题

echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误

echo '灰色歌曲'
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://$github/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

#断线重拨
sed -i 's/q reload/q restart/g' ./package/network/config/firewall/files/firewall.hotplug

#echo "其他修改"
sed -i 's/option commit_interval.*/option commit_interval 1h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h
# sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
# nlbwmon - disable syslog
sed -i 's/stderr 1/stderr 0/g' feeds/packages/net/nlbwmon/files/nlbwmon.init

# echo '默认开启 Irqbalance'
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://$github/BoringCat/luci-app-mentohust package/luci-app-mentohust
git clone --depth=1 https://$github/KyleRicardo/MentoHUST-OpenWrt-ipk package/MentoHUST-OpenWrt-ipk

# 全能推送
rm -rf ./feeds/luci/applications/luci-app-pushbot && \
git clone https://$github/zzsj0928/luci-app-pushbot ./feeds/luci/applications/luci-app-pushbot
rm -rf ./feeds/luci/applications/luci-app-jd-dailybonus && \
git clone https://$github/jerrykuku/luci-app-jd-dailybonus ./feeds/luci/applications/luci-app-jd-dailybonus
rm -rf ./feeds/luci/applications/luci-app-serverchan && \
git clone -b master --single-branch https://$github/tty228/luci-app-serverchan ./feeds/luci/applications/luci-app-serverchan

rm -rf ./feeds/packages/net/adguardhome

git clone https://$github/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/, 1).d/, 11).d/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua

#qbittorrent
rm -rf ./feeds/packages/net/qbittorrent
rm -rf ./feeds/packages/net/qBittorrent-Enhanced-Edition
rm -rf ./feeds/packages/net/qBittorrent-static
rm -rf ./feeds/luci/applications/luci-app-qbittorrent  package/feeds/packages/luci-app-qbittorrent

# Add OpenClash
rm -rf  ./feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://$github/vernesong/OpenClash package/openclash
# sed -i 's/+libcap /+libcap +libcap-bin /' package/openclash/luci-app-openclash/Makefile

# 使用默认取消自动
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-kucat/g' feeds/luci/collections/luci/Makefile
# sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
# set default theme to argon
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase="/luci-static/kucat"' `find package -type f -path '*/default-settings/files/*-default-settings'`

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名

rm -rf ./feeds/luci/applications/luci-theme-argon package/feeds/packages/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-argon package/feeds/packages/luci-theme-argon  ./package/diy/luci-theme-edge
rm -rf ./feeds/luci/applications/luci-app-argon-config ./feeds/luci/applications/luci-theme-opentomcat ./feeds/luci/applications/luci-theme-ifit
rm -rf ./package/diy/luci-theme-argon ./package/diy/luci-theme-opentopd  ./package/diy/luci-theme-ifit   ./package/diy/luci-theme-opentomcat
rm -rf ./feeds/luci/applications/luci-theme-opentopd package/feeds/packages/luci-theme-opentopd

rm -rf ./feeds/luci/themes/luci-theme-design
 git clone -b js https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design
rm -rf ./feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon
sed -i 's,media .. \"\/b,resource .. \"\/b,g' ./package/luci-theme-argon/luasrc/view/themes/argon/sysauth.htm
sed -i 's,media .. \"\/b,resource .. \"\/b,g' ./feeds/luci/themes/luci-theme-argon/luasrc/view/themes/argon/sysauth.htm
# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
# sed -i 's/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
#Add x550
git clone https://$github/shenlijun/openwrt-x550-nbase-t package/openwrt-x550-nbase-t
git clone https://$github/NateLol/luci-app-oled  package/luci-app-oled
sed -i "s/enable '0'/enable '1'/" `find package/ -follow -type f -path '*/luci-app-oled/root/etc/config/oled'`

# temporary fix for upx
# sed -i 's/a46b63817a9c6ad5af7cf519332e859f11558592/1050de5171f70fd4ba113016e4db994e898c7be3/' package/lean/upx/Makefile

# enable r2s oled plugin by default
# sed -i "s/enable '0'/enable '1'/" `find package/ -follow -type f -path '*/luci-app-oled/root/etc/config/oled'`

# kernel:fix bios boot partition is under 1 MiB
# https://$github/WYC-2020/lede/commit/fe628c4680115b27f1b39ccb27d73ff0dfeecdc2
sed -i 's/256/1024/' target/linux/x86/image/Makefile

 config_file_turboacc=`find package/ -follow -type f -path '*/luci-app-turboacc/root/etc/config/turboacc'`
 sed -i "s/option hw_flow '1'/option hw_flow '0'/" $config_file_turboacc
 sed -i "s/option sfe_flow '1'/option sfe_flow '0'/" $config_file_turboacc
 sed -i "s/option sfe_bridge '1'/option sfe_bridge '0'/" $config_file_turboacc
 sed -i "/dep.*INCLUDE_.*=n/d" `find package/ -follow -type f -path '*/luci-app-turboacc/Makefile'`

sed -i "s/option limit_enable '1'/option limit_enable '0'/" `find package/ -follow -type f -path '*/nft-qos/files/nft-qos.config'`
sed -i "s/option enabled '1'/option enabled '0'/" `find package/ -follow -type f -path '*/vsftpd-alt/files/vsftpd.uci'`

# 取消主题默认设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;
sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名
sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

# 修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}

# 修复 hostapd 报错
#cp -f $GITHUB_WORKSPACE/scriptx/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch




# sed -i 's/kmod-usb-net-rtl8152/kmod-usb-net-rtl8152-vendor/' target/linux/rockchip/image/armv8.mk target/linux/sunxi/image/cortexa53.mk target/linux/sunxi/image/cortexa7.mk

#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile
# 风扇脚本
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
#wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://$github/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/etc/init.d/fa-rk3328-pwmfan
#wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://$github/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/usr/bin/start-rk3328-pwm-fan.sh

case "${CONFIG_S}" in
Free-Plus)
;;
Vip-Super)
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/*/Makefile
sed -i '/45)./d' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-samba4/luasrc/controller/samba4.lua 
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua 
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/root/usr/share/luci/menu.d/luci-app-zerotier.json
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/root/usr/share/luci/menu.d/luci-app-alist.json
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/view/alist/admin_info.htm
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/view/alist/alist_status.htm
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/view/alist/admin_info.htm
sed -i '/NAS/d' ./feeds/luci/applications/luci-app-alist/luasrc/controller/alist.lua
sed -i '/NAS/d' ./package/alist/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/view/alist/alist_status.htm
;;
Vip-Mini)
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/*/Makefile
sed -i '/45)./d' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-samba4/luasrc/controller/samba4.lua 
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua 
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/root/usr/share/luci/menu.d/luci-app-zerotier.json
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/root/usr/share/luci/menu.d/luci-app-alist.json
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/view/alist/admin_info.htm
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/view/alist/alist_status.htm
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/view/alist/admin_info.htm
sed -i '/NAS/d' ./feeds/luci/applications/luci-app-alist/luasrc/controller/alist.lua
sed -i '/NAS/d' ./package/alist/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/view/alist/alist_status.htm

;;
Vip-Plus)
# sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/*/Makefile
;;
Vip-Bypass)
# sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/*/Makefile
;;
Free-Mini)
sed -i '/45)./d' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-samba4/luasrc/controller/samba4.lua 
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua 
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/root/usr/share/luci/menu.d/luci-app-zerotier.json
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/root/usr/share/luci/menu.d/luci-app-alist.json
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/view/alist/admin_info.htm
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-alist/view/alist/alist_status.htm
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/view/alist/admin_info.htm
sed -i '/NAS/d' ./feeds/luci/applications/luci-app-alist/luasrc/controller/alist.lua
sed -i '/NAS/d' ./package/alist/luci-app-alist/luasrc/controller/alist.lua
sed -i 's/nas/services/g' ./package/alist/luci-app-alist/view/alist/alist_status.htm
;;
*)
;;
esac


# echo '默认开启 Irqbalance'
if  [[ $TARGET_DEVICE == 'x86_64' ]] ;then
VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"
CLASH="amd64"
elif  [ $TARGET_DEVICE == 'rm2100' ]  || [ $TARGET_DEVICE == 'xm2100' ] ;then
VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/rockchip/Makefile | cut -d = -f 2)"
CLASH="mipsle_softfloat"
else
VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/rockchip/Makefile | cut -d = -f 2)"
CLASH="arm64"
fi

if [[ $DATE_S == 'default' ]]; then
   DATA=`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
else 
   DATA=$DATE_S
fi
# 预处理下载相关文件，保证打包固件不用单独下载
for sh_file in `ls ${GITHUB_WORKSPACE}/openwrt/package/other/common/*.sh`;do
    source $sh_file $CLASH
done

VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"
ver54=`grep "LINUX_VERSION-5.4 ="  include/kernel-5.4 | cut -d . -f 3`
ver515=`grep "LINUX_VERSION-5.15 ="  include/kernel-5.15 | cut -d . -f 3`
ver61=`grep "LINUX_VERSION-6.1 ="  include/kernel-6.1 | cut -d . -f 3`
ver66=`grep "LINUX_VERSION-6.6 ="  include/kernel-6.6 | cut -d . -f 3`
date1="${CONFIG_S}-${DATA}_by_Sirpdboy"
if [ "$VER1" = "5.4" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver54}_by_Sirpdboy"
elif [ "$VER1" = "5.15" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver515}_by_Sirpdboy"
elif [ "$VER1" = "6.1" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver61}_by_Sirpdboy"
elif [ "$VER1" = "6.6" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver66}_by_Sirpdboy"
fi
echo "${date1}" > ./package/base-files/files/etc/ezopenwrt_version
echo "${date2}" >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner
[ -f ./files/root/.zshrc ] || mv -f ./package/other/patch/z.zshrc ./files/root/.zshrc
[ -f ./files/root/.zshrc ] || curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/.zshrc > ./files/root/.zshrc
[ -f ./files/etc/profiles ] || mv -f ./package/other/patch/profiles ./files/etc/profiles
[ -f ./files/etc/profiles ] || curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/profiles > ./files/etc/profiles

#判断固件版本
if [ ${TARGET_DEVICE} = "x86_64" ] ; then

cat>buildmd5.sh<<-\EOF
#!/bin/bash
r_version=`cat ./package/base-files/files/etc/ezopenwrt_version`
VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"
ver54=`grep "LINUX_VERSION-5.4 ="  include/kernel-5.4 | cut -d . -f 3`
ver515=`grep "LINUX_VERSION-5.15 ="  include/kernel-5.15 | cut -d . -f 3`
ver61=`grep "LINUX_VERSION-6.1 ="  include/kernel-6.1 | cut -d . -f 3`
ver66=`grep "LINUX_VERSION-6.6 ="  include/kernel-6.6 | cut -d . -f 3`
# gzip bin/targets/*/*/*.img | true

pushd bin/targets/*/*/
rm -rf   config.buildinfo
rm -rf   feeds.buildinfo
rm -rf   *.manifest
rm -rf   *rootfs.tar.gz
rm -rf   *generic-squashfs-rootfs.img*
rm -rf   *generic-rootfs*
rm -rf  *generic.manifest
rm -rf  sha256sums
rm -rf version.buildinfo
rm -rf *generic-ext4-rootfs.img*
rm -rf  *generic-ext4-combined-efi.img*
rm -rf  *generic-ext4-combined.img*
rm -rf  profiles.json
rm -rf  *kernel.bin
# BINDIR=`pwd`
sleep 2
if [ "$VER1" = "5.4" ]; then
mv  *generic-squashfs-combined.img.gz       EzOpenWrt-${r_version}_${VER1}.${ver54}-${TARGET_DEVICE}-combined.img.gz   
mv  *generic-squashfs-combined-efi.img.gz   EzOpenWrt-${r_version}_${VER1}.${ver54}-${TARGET_DEVICE}-combined-efi.img.gz
md5_EzOpWrt=EzOpenWrt-${r_version}_${VER1}.${ver54}-${TARGET_DEVICE}-combined.img.gz   
md5_EzOpWrt_uefi=EzOpenWrt-${r_version}_${VER1}.${ver54}-${TARGET_DEVICE}-combined-efi.img.gz
elif [ "$VER1" = "5.15" ]; then
mv  *generic-squashfs-combined.img.gz       EzOpenWrt-${r_version}_${VER1}.${ver515}-${TARGET_DEVICE}-combined.img.gz   
mv  *generic-squashfs-combined-efi.img.gz   EzOpenWrt-${r_version}_${VER1}.${ver515}-${TARGET_DEVICE}-combined-efi.img.gz
md5_EzOpWrt=EzOpenWrt-${r_version}_${VER1}.${ver515}-${TARGET_DEVICE}-combined.img.gz   
md5_EzOpWrt_uefi=EzOpenWrt-${r_version}_${VER1}.${ver515}-${TARGET_DEVICE}-combined-efi.img.gz
elif [ "$VER1" = "6.1" ]; then
mv  *generic-squashfs-combined.img.gz       EzOpenWrt-${r_version}_${VER1}.${ver61}-${TARGET_DEVICE}-combined.img.gz   
mv  *generic-squashfs-combined-efi.img.gz   EzOpenWrt-${r_version}_${VER1}.${ver61}-${TARGET_DEVICE}-combined-efi.img.gz
md5_EzOpWrt=EzOpenWrt-${r_version}_${VER1}.${ver61}-${TARGET_DEVICE}-combined.img.gz   
md5_EzOpWrt_uefi=EzOpenWrt-${r_version}_${VER1}.${ver61}-${TARGET_DEVICE}-combined-efi.img.gz
elif [ "$VER1" = "6.6" ]; then
mv  *generic-squashfs-combined.img.gz       EzOpenWrt-${r_version}_${VER1}.${ver66}-${TARGET_DEVICE}-combined.img.gz   
mv  *generic-squashfs-combined-efi.img.gz   EzOpenWrt-${r_version}_${VER1}.${ver66}-${TARGET_DEVICE}-combined-efi.img.gz
md5_EzOpWrt=EzOpenWrt-${r_version}_${VER1}.${ver66}-x86-64-combined.img.gz   
md5_EzOpWrt_uefi=EzOpenWrt-${r_version}_${VER1}.${ver66}-x86-64-combined-efi.img.gz
fi
#md5
md5sum ${md5_EzOpWrt} > EzOpWrt_combined.md5  || true
md5sum ${md5_EzOpWrt_uefi} > EzOpWrt_combined-efi.md5 || true
popd

EOF
else

cat>buildmd5.sh<<-\EOF
#!/bin/bash

r_version=`cat ./package/base-files/files/etc/ezopenwrt_version`
ver54=`grep "LINUX_VERSION-5.4 ="  include/kernel-5.4 | cut -d . -f 3`
ver515=`grep "LINUX_VERSION-5.15 ="  include/kernel-5.15 | cut -d . -f 3`
ver61=`grep "LINUX_VERSION-6.1 ="  include/kernel-6.1 | cut -d . -f 3`
ver66=`grep "LINUX_VERSION-6.6 ="  include/kernel-6.6 | cut -d . -f 3`
# gzip bin/targets/*/*/*.img | true
VER1="$(grep "KERNEL_PATCHVER:=" ./target/linux/rockchip/Makefile | cut -d = -f 2)"
pushd bin/targets/*/*/
rm -rf   config.buildinfo
rm -rf   feeds.buildinfo
rm -rf   *.manifest
rm -rf   *rootfs.tar.gz
rm -rf   *generic-squashfs-rootfs.img*
rm -rf   *generic-rootfs*
rm -rf  *generic.manifest
rm -rf  sha256sums
rm -rf version.buildinfo
rm -rf *generic-ext4-rootfs.img*
rm -rf  *generic-ext4-combined-efi.img*
rm -rf  *generic-ext4-combined.img*
rm -rf  profiles.json
rm -rf  *kernel.bin
# BINDIR=`pwd`
sleep 2

if [ "$VER1" = "5.4" ]; then
mv   *squashfs-sysupgrade.img.gz EzOpenWrt-${r_version}_${VER1}.${ver54}-${TARGET_DEVICE}-squashfs-sysupgrade.img.gz 
mv  *ext4-sysupgrade.img.gz EzOpenWrt-${r_version}_${VER1}.${ver54}-${TARGET_DEVICE}-ext4-sysupgrade.img.gz
md5_EzOpWrt=*squashfs-sysupgrade.img.gz  
md5_EzOpWrt_uefi=*ext4-sysupgrade.img.gz
elif [ "$VER1" = "5.15" ]; then
mv   *squashfs-sysupgrade.img.gz EzOpenWrt-${r_version}_${VER1}.${ver515}-${TARGET_DEVICE}-squashfs-sysupgrade.img.gz 
mv   *ext4-sysupgrade.img.gz EzOpenWrt-${r_version}_${VER1}.${ver515}-${TARGET_DEVICE}-ext4-sysupgrade.img.gz
md5_EzOpWrt=*squashfs-sysupgrade.img.gz  
md5_EzOpWrt_uefi=*ext4-sysupgrade.img.gz
elif [ "$VER1" = "6.1" ]; then
mv *squashfs-sysupgrade.img.gz EzOpenWrt-${r_version}_${VER1}.${ver61}-${TARGET_DEVICE}-squashfs-sysupgrade.img.gz 
mv *ext4-sysupgrade.img.gz EzOpenWrt-${r_version}_${VER1}.${ver61}-${TARGET_DEVICE}-ext4-sysupgrade.img.gz
md5_EzOpWrt=*squashfs-sysupgrade.img.gz  
md5_EzOpWrt_uefi=*ext4-sysupgrade.img.gz
fi
#md5
md5sum ${md5_EzOpWrt} > EzOpWrt_squashfs-sysupgrade.md5  || true
md5sum ${md5_EzOpWrt_uefi} > EzOpWrt_ext4-sysupgrade.md5 || true
popd

exit 0
EOF
fi
cat>bakkmod.sh<<-\EOF
#!/bin/bash
kmoddirdrv=./files/etc/kmod.d/drv
kmoddirdocker=./files/etc/kmod.d/docker
bakkmodfile=./kmod.source
cp -rf ./patch/list.txt $bakkmodfile
nowkmodfile=./files/etc/kmod.now
mkdir -p $kmoddirdrv 2>/dev/null
mkdir -p $kmoddirdocker 2>/dev/null
while IFS= read -r line; do  
    cp -v $(find bin/ -type f -name "*${line}*") $kmoddirdrv
    echo "$line"  
        a=`find ./bin/ -name "$line" `
    echo $a
    if [ -z "$a" ]; then
        echo "no find: $line"
    else
        cp -f $a $kmoddirdrv
	echo $line >> $nowkmodfile
        if [ $? -eq 0 ]; then
            echo "cp ok: $line"
        else
            echo "no cp:$line"
        fi
    fi
done < "$bakkmodfile"
    # find ./bin/ -name  $file | xargs -i cp -f {}  $kmoddirdrv
    # cp -v $(find bin/targets/ -type f -name "*${FIRMWARE_TYPE}*") ../firmware
find ./bin/ -name "*dockerman*.ipk" | xargs -i cp -f {} $kmoddirdocker
find ./bin/ -name "*dockerd*.ipk" | xargs -i cp -f {} $kmoddirdocker
EOF


case "${CONFIG_S}" in
     "Vip"*) 
#修改默认IP地址
sed -i "s/192.168.1.1/192.168.10.1/g" package/base-files/files/bin/config_generate
sed -i "s/192.168.1.1/192.168.10.1/g" package/base-files/luci2/bin/config_generate
sed -i "s/192.168.1.1/192.168.10.1/g" package/base-files/Makefile
#修改immortalwrt.lan关联IP
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192\.168\.10\.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
#修改默认IP地址
# sed -i "s/192\.168\.[0-9]*\.[0-9]*/192\.168\.10\.1/g" package/base-files/files/bin/config_generate


cat>./package/base-files/files/etc/kmodreg<<-\EOF
#!/bin/bash
# EzOpenWrt By Sirpdboy
IPK=$1
nowkmoddir=/etc/kmod.d/$IPK
[ -d $nowkmoddir ]  || exit
is_docker() {
    [ -s "/usr/lib/lua/luci/controller/dockerman.lua" ] && return 0  || return 1
}

run_drv() {
opkg update
echo "正在安装全部驱动（包括有线和无线）,请耐心等待...大约需要1-5分钟 "
for file in `ls $nowkmoddir/*.ipk`;do
    opkg install "$file"  --force-depends
done
echo "所有驱动已经安装完成！请重启系统生效！ "
}
run_docker() {
if is_docker; then
	echo " Docker服务已经存在！无须安装！"
else
    local opkg_conf="/etc/opkg.conf"
    sed -i '/option check_signature/d' "$opkg_conf"
	opkg update
	echo "正在安装Docker及相关服务...请耐心等待...大约需要1-5分钟 "
	opkg install $nowkmoddir/dockerd*.ipk --force-depends >/dev/null 2>&1
	opkg install $nowkmoddir/luci-app-dockerman*.ipk --force-depends  >/dev/null 2>&1
	opkg install $nowkmoddir/luci-i18n-dockerman*.ipk --force-depends  >/dev/null 2>&1
    	opkg install avahi-daemon >/dev/null 2>&1
	if is_docker; then
		echo "本地成功安装Docker及相关服务！"
	else
   		echo "本地安装失败！"
   		echo "在线重新安装Docker及相关服务...请耐心等待...大约需要1-5分钟"
   		opkg install dockerd --force-depends >/dev/null 2>&1
    		opkg install luci-app-dockerman >/dev/null 2>&1
    		opkg install luci-i18n-dockerman* >/dev/null 2>&1
    		opkg install avahi-daemon >/dev/null 2>&1
    		if is_docker; then 
    		    echo "在线成功安装Docker及相关服务！" 
    		fi

	fi
fi
if is_docker; then
      		echo "设置Docker服务自动启动成功！"
      		echo "Docker菜单注销重新登陆才能看到！"
		uci -q get dockerd.globals 2>/dev/null && {
		uci -q set dockerd.globals.data_root='/opt/docker/'
		uci -q set dockerd.globals.auto_start='1'
		uci commit dockerd
  		/etc/init.d/dockerd enabled
		rm -rf /tmp/luci*
		 /etc/init.d/avahi-daemon enabled
		 /etc/init.d/avahi-daemon start
		/etc/init.d/dockerd restart
		}
    else
      echo "安装Docker失败！请保证出国插件线路和网络正常！BUG请联系TG群：sirpdboy！"
    fi
}
case "$IPK" in
	"drv")
		run_drv
	;;
	"docker")
		run_docker
	;;
esac
EOF
;;
"Free"*)


#修改默认IP地址
sed -i 's/192\.168\.1\.1/192\.168\.8\.1/g' package/base-files/files/bin/config_generate

sed -i "s/192.168.1.1/192.168.8.1/g" package/base-files/Makefile
sed -i "s/192.168.1.1/192.168.8.1/g" package/base-files/luci2/bin/config_generate
#修改immortalwrt.lan关联IP
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192\.168\.8\.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
#修改默认IP地址
#sed -i "s/192\.168\.[0-9]*\.[0-9]*/192\.168\.8\.1/g" package/base-files/files/bin/config_generate

cat>./package/base-files/files/etc/kmodreg<<-\EOF
#!/bin/bash
# EzOpenWrt By Sirpdboy
IPK=$1
nowkmoddir=/etc/kmod.d/$IPK
[ -d $nowkmoddir ]  || exit
run_drv() {
echo "目前此功能仅限VIP版本提供！ "
exit
}
run_docker() {
echo "目前此功能仅限VIP版本提供！ "
exit
}
case "$IPK" in
	"drv")
		run_drv
	;;
	"docker")
		run_docker
	;;
esac
exit
EOF
;;
esac
./scripts/feeds update -i
