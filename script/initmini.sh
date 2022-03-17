#!/bin/bash
# git clone https://github.com/sirpdboy/sirpdboy-package ./package/diy
git clone https://github.com/sirpdboy/build.git ./package/build

rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./package/lean/autosamba
rm -rf ./package/lean/autocore
rm -rf ./package/lean/default-settings
rm -rf ./feeds/luci/applications/luci-app-accesscontrol
rm -rf ./feeds/luci/applications/luci-app-arpbind
rm -rf ./feeds/luci/applications/luci-app-docker
rm -rf ./feeds/luci/applications/luci-app-dockerman
# rm -rf ./feeds/packages-master/utils/docker

# rm -rf ./feeds/luci/applications/luci-app-vlmcsd
# rm -rf ./feeds/luci/applications/vlmcsd 

mv -f ./package/diy   ./package
mv -f ./package/build   ./package
cat ./package/banner > package/base-files/files/etc/banner
cat ./package/profile > package/base-files/files/etc/profile

# Modify default IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile

echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile

pushd feeds/luci/applications

# Add luci-aliyundrive-webdav
rm -rf ./luci-app-aliyundrive-webdav 
rm -rf ./aliyundrive-webdav
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

#baidupcs-web
rm -rf luci-app-baidupcs-web && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-baidupcs-web

# samba4
rm -rf luci-app-samba4 &&svn co https://github.com/sirpdboy/build/trunk/luci-app-samba4

rm -rf luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata

rm -rf luci-app-xlnetacc && git clone https://github.com/kiddin9/luci-app-xlnetacc.git 

echo '灰色歌曲'
rm -rf luci-app-unblockmusic && git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

#luci-app-filebrowser
rm -rf luci-app-filebrowser && svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-filebrowser
popd

# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/build/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
cat  ./package/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3 && rm -rf ./package/build/mwan3

#修正nat回流 
cat ./package/set/sysctl.conf >>  package/base-files/files/etc/sysctl.conf
#修正连接数 
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# 最大连接数
sed -i 's/65535/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf
#echo "其他修改"
sed -i 's/option commit_interval 24h/option commit_interval 2h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h小时
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置

rm -rf ./package/lean/ddns-scripts_aliyun && svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
# echo '默认开启 Irqbalance'
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

pushd feeds/packages/net

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns feeds/packages/net/smartdns

rm -rf filebrowser
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/filebrowser

rm -rf samba4
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/samba4

# kxyl
rm -rf pdnsd-alt
rm -rf shadowsocks-libev
rm -rf xray-core
rm -rf kcptun
rm -rf brook
rm -rf chinadns-ng
rm -rf dns2socks
rm -rf hysteria
rm -rf ipt2socks
rm -rf microsocks
rm -rf naiveproxy
rm -rf shadowsocks-rust
rm -rf simple-obfs
rm -rf ssocks
rm -rf tcping
rm -rf v2ray*
rm -rf xray*
rm -rf trojan*

popd

#添加额外软件包 


git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's,1).dep,11).dep,g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua  #koolproxy

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/luci-app-openclash

git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
git clone https://github.com/john-shine/luci-theme-darkmatter.git package/darkmatter
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/luci-theme-edge

svn co https://github.com/MilesPoupart/openwrt-passwall/trunk/ package/wall

sed -i 's,default n,default y,g' package/wall/luci-app-passwall/Makefile

echo ' ShadowsocksR Plus+'
# git clone https://github.com/fw876/helloworld package/ssr
# rm  ./package/ssr/luci-app-ssr-plus
# rm -rf ./package/pass/luci-app-ssr-plus
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus ./package/ssr/luci-app-ssr-plus
sed -i 's,default n,default y,g' ./package/pass/luci-app-ssr-plus/Makefile 

#sed -i 's,default n,default y,g' ./package/build/pass/luci-app-bypass/Makefile
rm -rf package/pass/luci-app-bypass
git clone https://github.com/kiddin9/openwrt-bypass package/bypass
sed -i 's,default n,default y,g' ./package/bypass/luci-app-bypass/Makefile

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/lean/luci-app-vssr
sed -i 's,default n,default y,g' ./package/lean/luci-app-vssr/Makefile

git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/OpenAppFilter
git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper

svn co https://github.com/QiuSimons/openwrt-mos/trunk/mosdns package/mosdns
svn co https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns package/luci-app-mosdns
sed -i "/filter_aaaa='1'/d" package/luci-app-mosdns/root/etc/init.d/mosdns



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
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/欢迎使用!请输入用户密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码

ver1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
export VER2="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"
date1='Ipv6-Mini-S'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
# date1='Ipv6-S2022.02.01'
if [ "$VER2" = "5.4" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.4-/g' include/image.mk
elif [ "$VER2" = "5.10" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.10-/g' include/image.mk
elif [ "$VER2" = "5.15" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.15-/g' include/image.mk
fi
# sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220201-Ipv6-Mini-${str1}-/g' include/image.mk
echo "DISTRIB_REVISION='${date1} by Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' by Sirpdboy ' >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

# sed -i '/root:/d' ./package/base-files/files/etc/shadow
sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus//luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/+"), 10)/+"), 0)/g' ./package/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
# sed -i 's/h"), 50)/h"), 8)/g' ./package/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
sed -i 's/+"),1)/+"),11)/g' ./package/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i
exit 0
