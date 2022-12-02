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

# 清理
rm -rf feeds/*/*/{smartdns,wrtbwmon,luci-app-smartdns,luci-app-timecontrol,luci-app-ikoolproxy,luci-app-smartinfo,luci-app-socat,luci-app-netdata,luci-app-wolplus,luci-app-arpbind,luci-app-baidupcs-web,luci-app-vnstat2,luci-app-vnstat}
rm -rf package/*/{autocore,autosamba,default-settings}
rm -rf feeds/*/*/{luci-app-dockerman,luci-app-aria2,luci-app-beardropper,oaf,luci-app-adguardhome,luci-app-appfilter,open-app-filter,luci-app-openclash,luci-app-vssr,luci-app-ssr-plus,luci-app-passwall,luci-app-bypass,luci-app-wrtbwmon,luci-app-koolddns,luci-app-samba,luci-app-samba4,luci-app-wol,luci-app-unblockneteasemusic,luci-app-accesscontrol}

git clone https://github.com/loso3000/other ./package/other
git clone https://github.com/sirpdboy/sirpdboy-package ./package/diy

#git clone https://github.com/sirpdboy/luci-app-lucky ./package/lucky
#git clone https://github.com/sirpdboy/luci-app-ddns-go ./package/ddns-go
# nlbwmon
sed -i 's/524288/16777216/g' feeds/packages/net/nlbwmon/files/nlbwmon.config
# 可以设置汉字名字
sed -i '/o.datatype = "hostname"/d' feeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/system.lua
# sed -i '/= "hostname"/d' /usr/lib/lua/luci/model/cbi/admin_system/system.lua

# Add ddnsto & linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/ ./package/diy1/luci
svn co https://github.com/linkease/nas-packages/trunk/network/services/ ./package/diy1/linkease
svn co https://github.com/linkease/istore/trunk/luci/ ./package/diy1/istore
sed -i 's/1/0/g' ./package/diy1/linkease/linkease/files/linkease.config
sed -i 's/luci-lib-ipkg/luci-base/g' package/diy1/istore/luci-app-store/Makefile
# svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui


rm -rf ./package/other/up/pass/mosdns
rm -rf ./feeds/packages/net/mosdns
rm -rf feeds/packages/net/mosdns package/feeds/packages/mosdns
# svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
# svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns #lean中包含,feeds/packages/net
# svn export https://github.com/kenzok8/openwrt-packages/trunk/mosdns ./feeds/packages/net/mosdns
git clone https://github.com/sbwml/luci-app-mosdns package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/geodata
sed -i "/filter_aaaa='1'/d" package/luci-app-mosdns/root/etc/init.d/mosdns

#dnsmasq
rm -rf ./package/network/services/dnsmasq
svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/network/services/dnsmasq ./package/network/services/dnsmasq

#upnp
# rm -rf ./feeds/packages/net/miniupnpd &&  svn co https://github.com/sirpdboy/sirpdboy-package/trunk/upnpd/miniupnp   ./feeds/packages/net/miniupnp
# rm -rf ./feeds/luci/applications/luci-app-upnp &&\
# svn co https://github.com/sirpdboy/sirpdboy-package/trunk/upnpd/luci-app-upnp ./feeds/luci/applications/luci-app-upnp
rm -rf  ./package/diy/upnpd

mkdir -p ./package/lean
mv ./package/other/up/autocore ./package/lean/autocore
rm -rf ./package/lean/autocore  
rm -rf ./package/other/up/autocore
rm -rf  ./package/emortal/autocore
svn co https://github.com/loso3000/other/trunk/up/autocore ./package/lean/autocore

mv ./package/other/up/automount-ntfs3g ./package/lean/automount-ntfs3g
rm -rf ./package/lean/automount  
rm -rf ./package/other/up/automount
rm -rf  package/emortal/automount
svn co https://github.com/loso3000/other/trunk/up/automount-ntfs3g ./package/lean/automount
  
mv ./package/other/up/default-settings ./package/lean/default-settings
rm -rf ./package/lean/default-settings  
rm -rf  package/emortal/default-settings 
rm -rf ./package/other/up/default-settings
svn co https://github.com/loso3000/other/trunk/up/default-settings ./package/lean/default-settings


echo "poweroff"
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

#设置
sed -i 's/option enabled.*/option enabled 0/' feeds/*/*/*/*/upnpd.config
sed -i 's/option dports.*/option enabled 2/' feeds/*/*/*/*/upnpd.config

sed -i "s/ImmortalWrt/OpenWrt/" {package/base-files/files/bin/config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns

# netdata 
rm -rf ./feeds/luci/applications/luci-app-netdata
# rm -rf ./feeds/packages/admin/netdata
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./feeds/luci/applications/luci-app-netdata


rm -rf ./feeds/luci/applications/luci-app-arpbind
svn co https://github.com/loso3000/other/trunk/up/luci-app-arpbind ./feeds/luci/applications/luci-app-arpbind 
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

# docker
rm -rf ./feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-docker
# rm -rf ./package/diy/luci-app-dockerman
# rm -rf ./feeds/packages/utils/docker
# Add luci-app-dockerman
rm -rf ./feeds/luci/collections/luci-lib-docker
git clone --depth=1 https://github.com/lisaac/luci-lib-docker ./package/lean/luci-lib-docker
# sed -i '/auto_start/d' ./package/diy/luci-app-dockerman/root/etc/uci-defaults/luci-app-dockerman
# sed -i '/sysctl.d/d' feeds/packages/utils/dockerd/Makefile
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.10
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.15

# vlmcsd
# rm -rf ./feeds/luci/applications/vlmcsd
# svn export https://github.com/wongsyrone/lede-1/trunk/package/external/vlmcsd ./feeds/luci/applications/vlmcsd
# ln -sf ../../../feeds/packages/net/vlmcsd ./package/feeds/packages/vlmcsd 
# ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./feeds/luci/applications/luci-app-vlmcsd

# Add luci-aliyundrive-webdav
rm -rf ./feeds/luci/applications/luci-app-aliyundrive-webdav 
rm -rf ./feeds/luci/applications/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav ./feeds/luci/applications/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav ./feeds/luci/applications/luci-app-aliyundrive-webdav 

# samba4
rm -rf ./feeds/luci/applications/luci-app-samba4 &&svn co https://github.com/loso3000/other/trunk/up/luci-app-samba4 ./feeds/luci/applications/luci-app-samba4

git clone --depth 1 https://github.com/zxlhhyccc/luci-app-v2raya.git package/new/luci-app-v2raya
svn co https://github.com/v2rayA/v2raya-openwrt/trunk/v2raya package/new/v2raya


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

# 添加额外软件包
git clone https://github.com/sbwml/luci-app-alist package/alist
sed -i 's/网络存储/存储/g' ./package/alist/luci-app-alist/po/zh-cn/alist.po
# Alist-3.2.0 依赖 1.19.x
#rm -rf feeds/packages/lang/golang
#cp -rf $GITHUB_WORKSPACE/general/golang feeds/packages/lang/golang
sed -i 's/GO_VERSION_MAJOR_MINOR:=.*/GO_VERSION_MAJOR_MINOR:=1.19/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/GO_VERSION_PATCH:=.*/GO_VERSION_PATCH:=2/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b/g' feeds/packages/lang/golang/golang/Makefile
# svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang

svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-syncthing package/luci-app-syncthing
cp -r package/luci-app-syncthing/po/zh_Hans/ package/luci-app-syncthing/po/zh-cn/
svn co https://github.com/immortalwrt/packages/trunk/utils/syncthing package/syncthing
# Syncthing 1.20.4 -> 1.22.0 由于 golang 升级 1.19.X
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.22.0/g' package/syncthing/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=b9644e814b4c7844a59e4e7705c550361cb4ed6c36bf9b46617de386ee2dad45/g' package/syncthing/Makefile

rm -rf ./feeds/luci/applications/luci-app-socat && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat ./feeds/luci/applications/luci-app-socat
sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./feeds/luci/applications/luci-app-socat/po/zh-cn/socat.po
ln -sf ../../../feeds/luci/applications/luci-app-socat ./package/feeds/luci/luci-app-socat

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
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误


echo '灰色歌曲'
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

#断线不重拨
sed -i 's/q reload/q restart/g' ./package/network/config/firewall/files/firewall.hotplug

#echo "其他修改"
sed -i 's/option commit_interval.*/option commit_interval 1h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h
# sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置

# echo '默认开启 Irqbalance'
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

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

rm -rf ./feeds/packages/net/adguardhome
svn export https://github.com/openwrt/packages/trunk/net/adguardhome feeds/packages/net/adguardhome

git clone https://github.com/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/告"), 1)/告"), 11)/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua  #koolproxy

# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash
svn export https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash package/new/luci-app-openclash

# Fix libssh
# rm -rf feeds/packages/libs
svn co https://github.com/openwrt/packages/trunk/libs/libssh feeds/packages/libs/
# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk package/new/

# ChinaDNS
# git clone -b luci --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git package/new/luci-app-chinadns-ng
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng

# CPU 控制相关
rm -rf  feeds/luci/applications/luci-app-cpufreq
svn export -r 19495 https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq
sed -i 's,1608,1800,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
sed -i 's,2016,2208,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
sed -i 's,1512,1608,g' feeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq

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
# rm -rf package/other/up/pass/luci-app-bypass 
rm -rf ./feeds/luci/applications/luci-app-ssr-plus  package/feeds/packages/luci-app-ssr-plus
# git clone https://github.com/kiddin9/openwrt-bypass package/bypass
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/bypass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plus/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plusdns/Makefile

#  git clone https://github.com/loso3000/openwrt-passwall package/passwall
# svn co https://github.com/loso3000/openwrt-passwall/trunk/luci-app-passwall  package/passwall/luci-app-passwall

git clone https://github.com/xiaorouji/openwrt-passwall2 package/passwall2
# svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/passwall/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/passwall/luci-app-passwall
pushd package/passwall/luci-app-passwall
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

echo ' ShadowsocksR Plus+'
# git clone https://github.com/fw876/helloworld package/ssr
# rm -rf  ./package/ssr/luci-app-ssr-plus
# ShadowsocksR Plus+ 依赖
rm -rf ./feeds/packages/net/kcptun
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/new/ssocks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/new/microsocks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/new/dns2socks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/new/ipt2socks
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/new/pdnsd

svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/new/trojan
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/new/trojan-plus

# svn export https://github.com/QiuSimons/OpenWrt-Add/trunk/trojan-plus package/new/trojan-plus
# svn export https://github.com/sirpdboy/openwrt-trojan-go/trunk/trojan-go package/new/trojan-go
# svn export https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-geodata package/lean/v2ray-geodata  #用sbwml版本更多更好。
# svn export https://github.com/QiuSimons/openwrt-mos/trunk/v2ray-geodata package/new/v2ray-geodata

svn export https://github.com/fw876/helloworld/trunk/lua-neturl package/lean/lua-neturl
rm -rf ./feeds/packages/net/shadowsocks-libev
svn export https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/lean/shadowsocks-libev
svn export https://github.com/fw876/helloworld/trunk/redsocks2 package/lean/redsocks2
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/srelay package/lean/srelay
svn export https://github.com/fw876/helloworld/trunk/trojan package/lean/trojan
svn export https://github.com/fw876/helloworld/trunk/tcping package/lean/tcping
svn export https://github.com/fw876/helloworld/trunk/dns2tcp package/lean/dns2tcp
svn export https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/lean/shadowsocksr-libev
svn export https://github.com/fw876/helloworld/trunk/simple-obfs package/lean/simple-obfs
svn export https://github.com/fw876/helloworld/trunk/naiveproxy package/lean/naiveproxy

rm -rf ./feeds/packages/net/v2ray-core
svn export https://github.com/fw876/helloworld/trunk/v2ray-core package/lean/v2ray-core
svn export https://github.com/fw876/helloworld/trunk/hysteria package/lean/hysteria
svn export https://github.com/fw876/helloworld/trunk/sagernet-core package/lean/sagernet-core
rm -rf ./feeds/packages/net/xray-core
svn export https://github.com/fw876/helloworld/trunk/xray-core package/lean/xray-core
svn export https://github.com/fw876/helloworld/trunk/v2ray-plugin package/lean/v2ray-plugin
svn export https://github.com/fw876/helloworld/trunk/xray-plugin package/lean/xray-plugin
svn export https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/lean/shadowsocks-rust
rm -rf ./feeds/packages/net/kcptun
svn export https://github.com/immortalwrt/packages/trunk/net/kcptun feeds/packages/net/kcptun
ln -sf ../../../feeds/packages/net/kcptun ./package/feeds/packages/kcptun

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/diy/luci-app-vssr
pushd package/diy/luci-app-vssr
sed -i 's,default n,default y,g' Makefile
sed -i 's,+shadowsocks-libev-ss-local ,,g' Makefile
popd

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
rm -rf ./package/build/luci-theme-darkmatter
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/lean/luci-theme-atmaterial_new
# git clone https://github.com/john-shine/luci-theme-darkmatter.git package/diy/darkmatter
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge
git clone https://github.com/thinktip/luci-theme-neobird.git   package/new/luci-theme-neobird

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
sed -i 's/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk


# wget -qO package/base-files/files/etc/banner https://raw.githubusercontent.com/loso3000/other/master/patch/banner
# wget -qO package/base-files/files/etc/profile https://raw.githubusercontent.com/loso3000/other/master/patch/profile
# wget -qO package/base-files/files/etc/sysctl.conf https://raw.githubusercontent.com/loso3000/other/master/patch/sysctl.conf
cp -f ./package/other/patch/mwan3  ./feeds/packages/net/mwan3/files/etc/config/mwan3
#修正nat回流 
cp -f ./package/other/patch/sysctl.conf ./package/base-files/files/etc/sysctl.conf
cp -f ./package/other/patch/banner ./package/base-files/files/etc/banner
cp -f ./package/other/patch/profile package/base-files/files/etc/profile
# cp -rf ./package/other/luci/*  ./feeds/luci/*

# version=$(grep "DISTRIB_REVISION=" package/lean/default-settings/files/zzz-default-settings  | awk -F "'" '{print $2}')
# sed -i '/root:/d' ./package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$tzMxByg.$e0847wDvo3JGW4C3Qqbgb.:19052:0:99999:7:::/g' ./package/base-files/files/etc/shadow   #tiktok
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow    #password

# temporary fix for upx
sed -i 's/a46b63817a9c6ad5af7cf519332e859f11558592/1050de5171f70fd4ba113016e4db994e898c7be3/' package/lean/upx/Makefile

  # enable r2s oled plugin by default
  sed -i "s/enable '0'/enable '1'/" `find package/ -follow -type f -path '*/luci-app-oled/root/etc/config/oled'`

# kernel:fix bios boot partition is under 1 MiB
  # https://github.com/WYC-2020/lede/commit/fe628c4680115b27f1b39ccb27d73ff0dfeecdc2
  sed -i 's/256/1024/' target/linux/x86/image/Makefile

config_file_turboacc=`find package/ -follow -type f -path '*/luci-app-turboacc/root/etc/config/turboacc'`
sed -i "s/option hw_flow '1'/option hw_flow '0'/" $config_file_turboacc
sed -i "s/option sfe_flow '1'/option sfe_flow '0'/" $config_file_turboacc
sed -i "s/option sfe_bridge '1'/option sfe_bridge '0'/" $config_file_turboacc
sed -i "/dep.*INCLUDE_.*=n/d" `find package/ -follow -type f -path '*/luci-app-turboacc/Makefile'`

sed -i "s/option limit_enable '1'/option limit_enable '0'/" `find package/ -follow -type f -path '*/nft-qos/files/nft-qos.config'`
sed -i "s/option enabled '1'/option enabled '0'/" `find package/ -follow -type f -path '*/vsftpd-alt/files/vsftpd.uci'`


# sed -i '/boot()/,+2d' feeds/packages/net/ddns-scripts/files/etc/init.d/ddns
# svn export https://github.com/jjm2473/openwrt-third/trunk/ddns-scripts_aliyun feeds/packages/net/ddns-scripts_aliyun
# svn export https://github.com/jjm2473/openwrt-third/trunk/ddns-scripts_dnspod feeds/packages/net/ddns-scripts_dnspod

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

# 修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}

sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名

sed -i 's/kmod-usb-net-rtl8152/kmod-usb-net-rtl8152-vendor/' target/linux/rockchip/image/armv8.mk target/linux/sunxi/image/cortexa53.mk target/linux/sunxi/image/cortexa7.mk

#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile

#zzz-default-settingsim
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingsim > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingsim > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings


#sed -i 's/US/CN/g ; s/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
sed -i "s/192.168.6.1/192.168.8.1/g"  package/base-files/files/bin/config_generate
# echo '默认开启 Irqbalance'
ver1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
export VER2="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"

date1='Ipv6-Mini-Sirpdboy-R'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
date1='Ipv6-Mini-R2022.12.01'
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20221201-Ipv6-Mini-5.15-/g' include/image.mk
if [ "$VER2" = "5.4" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.4-/g' include/image.mk
elif [ "$VER2" = "5.10" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.10-/g' include/image.mk
elif [ "$VER2" = "5.15" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.15-/g' include/image.mk
elif [ "$VER2" = "5.19" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.19-/g' include/image.mk
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
