#!/usr/bin/env bash
# set -x


echo "--------------------start-----------------"

WORKDIR=/workdir
HOSTNAME=OpenWrt
IPADDRESS=192.168.8.1
SSID=Sirpdboy
ENCRYPTION=psk2
KEY=123456

# sed -i 's/O3/O2/g' include/target.mk
git clone https://github.com/sirpdboy/build.git ./package/build
git clone https://github.com/sirpdboy/sirpdboy-package ./package/diy
# rm -rf ./feeds/luci/applications/luci-app-cpufreq


rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-opentomcat
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf ./feeds/luci/applications/luci-app-adguardhome
rm -rf ./feeds/luci/applications/luci-app-cpulimit
rm -rf ./feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-socat
rm -rf ./feeds/luci/applications/luci-app-timecontrol
rm -rf ./feeds/packages/net/adguardhome
rm -rf ./feeds/packages/net/aria2

# rm -f feeds/packages/libs/libsodium
# svn co https://github.com/openwrt/packages/trunk/libs/libsodium  feeds/packages/libs/
# svn co https://github.com/openwrt/packages/trunk/libs/libsodium  package/lean/

# version=$(grep "DISTRIB_REVISION=" package/lean/default-settings/files/zzz-default-settings  | awk -F "'" '{print $2}')
# sed -i '/root:/d' ./package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$tzMxByg.$e0847wDvo3JGW4C3Qqbgb.:19052:0:99999:7:::/g' ./package/base-files/files/etc/shadow   #tiktok
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow    #password

#sed -i 's/US/CN/g ; s/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "s/hostname='OpenWrt'/hostname='${HOSTNAME}'/g" package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
# Modify default WiFi SSID
sed -i "s/set wireless.default_radio\${devidx}.ssid=OpenWrt/set wireless.default_radio\${devidx}.ssid='$SSID'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default WiFi Encryption
sed -i "s/set wireless.default_radio\${devidx}.encryption=none/set wireless.default_radio\${devidx}.encryption='$ENCRYPTION'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default WiFi Key
sed -i "/set wireless.default_radio\${devidx}.mode=ap/a\                        set wireless.default_radio\${devidx}.key='$KEY'" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Forced WiFi to enable
sed -i 's/set wireless.radio\${devidx}.disabled=1/set wireless.radio\${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/^EOF/i \            \set wireless.default_radio${devidx}.key=567890321' package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo 'smartdns'
# rm -rf ./package/diy/smartdns
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/applications/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./feeds/luci/applications/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
cat  ./package/build/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3 && rm -rf ./package/build/mwan3
# rm -rf ./package/build/mwan3 && curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
# rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3
# rm -rf ./feeds/packages/net/https-dns-proxy  && svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy ./feeds/packages/net/https-dns-proxy
# rm -rf ./feeds/packages/devel/ninja   && svn co https://github.com/Lienol/openwrt-packages/trunk/devel/ninja feeds/packages/devel/ninja
# rm -rf ./package/build/miniupnpd  
# rm -rf ./feeds/packages/net/miniupnpd  && svn co https://github.com/sirpdboy/build/trunk/miniupnpd ./feeds/packages/net/miniupnpd
rm -rf ./package/emortal/autosamba
# rm -rf ./package/build/autocore
rm -rf ./package/emortal/autocore
rm -rf ./package/emortal/default-settings
rm -rf ./feeds/luci/applications/luci-app-accesscontrol
rm -rf ./feeds/luci/applications/luci-app-arpbind
rm -rf ./feeds/luci/applications/luci-app-docker

# rm -rf packages/utils/dockerd/
# rm -rf ./feeds/packages-master/utils/docker


# rm -rf ./feeds/luci/applications/luci-app-vlmcsd
# rm -rf ./feeds/luci/applications/vlmcsd 


pushd feeds/luci/applications

# rm -rf  luci-app-mentohust 
# Add mentohust & luci-app-mentohust
# git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust 
# git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk


# Add luci-aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav

# Add ddnsto & linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease
sed -i 's/1/0/g' linkease/files/linkease.config

#zerotier
rm -rf  luci-app-zerotier && git clone https://github.com/rufengsuixing/luci-app-zerotier.git
sed -i '/45)./d' luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' luasrc/view/zerotier/zerotier_status.htm   #zerotier

#syncdial
rm -rf luci-app-syncdial  && git clone https://github.com/rufengsuixing/luci-app-syncdial.git 

popd


# Add luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools  package/new/luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw package/new/udp2raw
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder package/new/udpspeeder

# Add luci-app-dockerman
rm -rf ./feeds/luci/collections/luci-lib-docker
git clone --depth=1 https://github.com/lisaac/luci-lib-docker ./feeds/luci/collections/luci-lib-docker

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter  package/new/openwrt-subconverter 

#rm -rf ./feeds/packages/utils/runc/Makefile
#svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile

# Fix libssh
rm -rf feeds/packages/libs
svn co https://github.com/openwrt/packages/trunk/libs/libssh feeds/packages/libs/libssh
# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk package/new/apk

rm -rf ./feeds/luci/applications/luci-app-baidupcs-web && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-baidupcs-web ./feeds/luci/applications/luci-app-baidupcs-web
# ksmbd
# rm -rf ./feeds/packages/net/ksmbd-tools && svn co https://github.com/sirpdboy/build/trunk/ksmbd-tools ./feeds/packages/net/ksmbd-tools
# rm -rf ./feeds/luci/applications/luci-app-samba 
# svn co https://github.com/sirpdboy/build/trunk/luci-app-samba ./feeds/luci/applications/luci-app-samba
# rm -rf ./package/network/services/samba36 
# svn co https://github.com/sirpdboy/build/trunk/samba36 ./package/network/services/samba36

# samba4
rm -rf ./package/build/samba4
# rm -rf ./feeds/packages/net/samba4 && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/samba4 ./feeds/packages/net/samba4
# rm -rf ./feeds/packages/net/samba4 && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/samba4 ./package/build/set/samba4
rm -rf ./feeds/luci/applications/luci-app-samba4 &&svn co https://github.com/sirpdboy/build/trunk/luci-app-samba4 ./feeds/luci/applications/luci-app-samba4

git clone --depth 1 https://github.com/zxlhhyccc/luci-app-v2raya.git package/new/luci-app-v2raya
svn co https://github.com/v2rayA/v2raya-openwrt/trunk/v2raya package/new/v2raya

# Boost 
# curl -fsSL https://raw.githubusercontent.com/loso3000/other/master/patch/autocore/files/x86/index.htm > package/lean/autocore/files/x86/index.htm
# curl -fsSL https://raw.githubusercontent.com/loso3000/other/master/patch/autocore/files/arm/index.htm > package/lean/autocore/files/arm/index.htm
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/build/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
echo
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/实时流量监测/流量/g'  `grep "实时流量监测" -rl ./`

sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g' ./feeds/luci/applications/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/家庭云//g' ./feeds/luci/applications/luci-app-familycloud/luasrc/controller/familycloud.lua
sed -i 's/KMS 服务器/KMS激活/g' ./feeds/luci/applications/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/aMule设置/电驴下载/g' ./feeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./feeds/luci/applications/luci-app-qbittorrent/po/zh-cn/qbittorrent.po

sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误

sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/欢迎使用!请输入用户密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码

echo '灰色歌曲'
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
# git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

#nat
cat ./package/build/set/sysctl.conf >>  package/base-files/files/etc/sysctl.conf
#
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
#
sed -i 's/65535/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf

#docker err
#rm -rf ./feeds/packages/utils/runc/Makefile
#svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile

#echo "out"
# INTERFACE='$INTERFACE'
# INTERFACE...='$INTERFACE...'
# LOG='$LOG'
# sed -i "88a\      ifdown $INTERFACE" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3
# sed -i "89a\      sleep 3" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3
# sed -i "90a\      ifup $INTERFACE" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3
# sed -i "91a\      $LOG notice \"Recycled $INTERFACE...\"" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3

#echo "other"
sed -i 's/option commit_interval 24h/option commit_interval 4h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为2
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
# sed -i 's@interval: 5@interval: 2@g' package/lean/luci-app-wrtbwmon/htdocs/luci-static/wrtbwmon.js #wrtbwmon默认刷新时间更改为1秒


# echo ' Irqbalance'
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

cat ./package/build/profile > package/base-files/files/etc/profile


git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter

echo 'aria2'
rm -rf feeds/luci/applications/luci-app-aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-aria2 feeds/luci/applications/luci-app-aria2
rm -rf feeds/packages/net/aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/net/aria2 feeds/packages/net/aria2

# svn co https://github.com/small-5/luci-app-adblock-plus/trunk/ ./package/diy/luci-app-adblock-plus

#sed -i 's,kmod-r8169,kmod-r8168,g' target/linux/x86/image/64.mk

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
CONFIG_DRM=y
CONFIG_DRM_I915=y
' >> ./target/linux/x86/config-5.4


# svn co https://github.com/QiuSimons/openwrt-mos/trunk/mosdns package/new/mosdns
# svn co https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns package/new/luci-app-mosdns
# sed -i "/filter_aaaa='1'/d" package/new/luci-app-mosdns/root/etc/init.d/mosdns


git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's,1).dep,11).dep,g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua  #koolproxy

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash

git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter

# Fix libssh
# rm -rf feeds/packages/libs
# svn co https://github.com/openwrt/packages/trunk/libs/libssh feeds/packages/libs/
# Add apk (Apk Packages Manager)
# svn co https://github.com/openwrt/packages/trunk/utils/apk package/new/

# Add luci-udptools
# svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools  package/new/
# svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw package/new/
# svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder package/new/

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter  package/new/

# rm -rf ./feeds/packages/utils/runc/Makefile
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile


rm -rf ./packages/build/ddns-scripts_dnspod
rm -rf ./feeds/packages/net/ddns-scripts_aliyun
svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun

#bypass
#sed -i 's,default n,default y,g' ./package/build/pass/luci-app-bypass/Makefile
if $1 != "dz" then ;

rm -rf package/build/pass/luci-app-bypass
git clone https://github.com/kiddin9/openwrt-bypass package/bypass
sed -i 's,default n,default y,g' ./package/bypass/luci-app-bypass/Makefile
else

fi

#svn co https://github.com/MilesPoupart/openwrt-passwall/trunk/ package/wall
#svn co https://github.com/xiaorouji/openwrt-passwall/branches/packages package/passwall
rm -rf ./feeds/luci/applications/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/passwall/luci-app-passwall
pushd package/passwall/luci-app-passwall
sed -i 's,default n,default y,g' Makefile
sed -i '/trojan-go/d' Makefile
sed -i '/v2ray-core/d' Makefile
sed -i '/v2ray-plugin/d' Makefile
sed -i '/xray-plugin/d' Makefile
sed -i '/shadowsocks-libev-ss-redir/d' Makefile
sed -i '/shadowsocks-libev-ss-server/d' Makefile
sed -i '/shadowsocks-libev-ss-local/d' Makefile
popd

rm -rf ./feeds/luci/applications/luci-app-ssr-plus
pushd package/pass/luci-app-ssr-plus
sed -i 's,default n,default y,g' Makefile
sed -i '/trojan-go/d' Makefile
sed -i '/v2ray-core/d' Makefile
sed -i '/v2ray-plugin/d' Makefile
sed -i '/xray-plugin/d' Makefile
sed -i '/shadowsocks-libev-ss-redir/d' Makefile
sed -i '/shadowsocks-libev-ss-server/d' Makefile
sed -i '/shadowsocks-libev-ss-local/d' Makefile
popd

#  Shadowsocks-rust
sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
# sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile
sed -i '/Rust:/d' ./package/build/pass/luci-ssr-plus/Makefile
# sed -i '/Rust:/d' ./package/build/pass/luci-app-bypass/Makefile
# sed -i '/Rust:/d' ./package/bypass/luci-app-bypass/Makefile

#
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile

# 使用默认取消自动
# sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

rm -rf ./package/diy/luci-theme-edge
rm -rf ./package/build/luci-theme-darkmatter

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/lean/luci-theme-atmaterial_new
git clone https://github.com/john-shine/luci-theme-darkmatter.git package/diy/darkmatter
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge

# git clone https://github.com/openwrt-dev/po2lmo.git
# cd po2lmo
# make && sudo make install

# Fix SDK
# sed -i '/$(SDK_BUILD_DIR)\/$(STAGING_SUBDIR_HOST)\/usr\/bin/d;/LICENSE/d' ./target/sdk/Makefile

sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus//luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/+"), 10)/+"), 0)/g' ./package/lean/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
# sed -i 's/h"), 50)/h"), 8)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter

# Fix mt76 wireless driver
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' package/kernel/mt76/Makefile

sed -i 's/option enabled.*/option enabled 0/' feeds/*/*/*/*/upnpd.config
sed -i 's/option dports.*/option dports 0/' feeds/*/*/*/*/upnpd.config
sed -i "s/ImmortalWrt/OpenWrt/" {$config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config

#default packages
sed -i 's/default-settings-chn/default-settings/g' include/target.mk
#add running
chmod +x ./package/*/root/etc/init.d/*  
chmod +x ./package/*/root/usr/*/*  
chmod +x ./package/*/*/root/etc/init.d/*  
chmod +x ./package/*/*/root/usr/*/*  