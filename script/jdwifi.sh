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

rm -rf ./package/build/miniupnpd
# rm -rf ./package/lean/automount
rm -rf ./package/lean/autosamba
rm -rf ./feeds/luci/applications/luci-app-accesscontrol
rm -rf ./package/build/autocore
rm -rf ./package/lean/autocore
rm -rf ./package/lean/default-settings
rm -rf ./feeds/luci/applications/luci-app-arpbind
rm -rf ./feeds/luci/applications/luci-app-docker
rm -rf ./feeds/luci/applications/luci-app-dockerman

rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-theme-opentomcat
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf ./feeds/luci/applications/luci-app-mentohust 
rm -rf ./feeds/packages/net/MentoHUST-OpenWrt-ipk
rm -rf ./feeds/luci/applications/luci-proto-minieap
# rm -rf ./feeds/luci/applications/luci-app-samba4
# rm -rf ./feeds/luci/applications/luci-app-cpufreq

sed -i 's/root::0:0:99999:7:::/root:$1$tzMxByg.$e0847wDvo3JGW4C3Qqbgb.:19052:0:99999:7:::/g' ./package/base-files/files/etc/shadow
sed -i "s/hostname='OpenWrt'/hostname='CytuTiktok'/g" package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
#sed -i "s/hostname='OpenWrt'/hostname='${HOSTNAME}'/g" package/base-files/files/bin/config_generate

# cp -f ./package/build/banner ./package/base-files/files/etc/
# replace banner
cp -f $GITHUB_WORKSPACE/general/openwrt_banner package/base-files/files/etc/banner
cat ./package/build/profile > package/base-files/files/etc/profile

date1='Tiktok R'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
echo "DISTRIB_REVISION='${date1}'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}  >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

# 使用默认取消自动
sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingswifi > ./package/build/default-settings/files/zzz-default-settings
sed -i 's/opentopd/chuqitopd/g'    ./package/build/default-settings/files/zzz-default-settings

sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/请输入用户名和密码。/欢迎使用~请输入登陆密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile

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
#修正nat回流 
cat ./package/build/set/sysctl.conf >>  package/base-files/files/etc/sysctl.conf
#修正连接数 
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# 最大连接数
sed -i 's/65535/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf

# Passwall

rm -rf ./package/build/pass

svn co https://github.com/loso3000/openwrt-passwall/trunk package/pass
rm -rf package/pass/luci-app-passwall

svn co https://github.com/loso3000/openwrt-pswall/trunk/ ./package/passwall
sed -i '/naiveproxy/d' package/passwall/luci-app-passwall/Makefile
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile


svn co https://github.com/hubutui/p7zip-lede/trunk package/p7zip

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns

#zerotier
sed -i '/45)./d' ./feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
rm -rf ./package/build/luci-app-zerotier
rm -rf ./package/build/zerotier
#unblockmusic
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

./scripts/feeds update -i
