#!/bin/bash

wget -qO package/base-files/files/etc/banner https://raw.githubusercontent.com/sirpdboy/build/master/banner
wget -qO package/base-files/files/etc/profile https://raw.githubusercontent.com/sirpdboy/build/master/profile
wget -qO package/base-files/files/etc/sysctl.conf https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf

curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3 > ./feeds/packages/net/mwan3/files/etc/config/mwan3
#mosdns
# git clone https://github.com/QiuSimons/openwrt-mos.git package/A/mosdns
# sed -i "/filter_aaaa='1'/d" package/A/mosdns/luci-app-mosdns/root/etc/init.d/mosdns

 #dnsfilter
# git clone https://github.com/kiddin9/luci-app-dnsfilter package/A/luci-app-dnsfilter
# sed -i 's/),9)/),12)/g' package/A/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua

rm -rf  ./feeds/packages/net/smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns

rm -rf ./feeds/luci/applications/luci-app-smartdns
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-smartdns ./feeds/luci/applications/luci-app-smartdns

rm -rf ./feeds/luci/applications/luci-app-socat
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat ./feeds/luci/applications/luci-app-socat

rm -rf ./feeds/luci/applications/luci-app-netdata
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/new/luci-app-netdata
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./feeds/luci/applications/luci-app-netdata

rm -rf  ./feeds/packages/net/adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/adguardhome ./feeds/packages/net/adguardhome
rm -rf ./feeds/luci/applications/luci-app-adguardhome
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-adguardhome ./feeds/luci/applications/luci-app-adguardhome

svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard ./package/new/luci-app-wizard
rm -rf ./feeds/luci/applications/luci-app-wolplus
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wolplus ./feeds/luci/applications/luci-app-wolplus

svn co https://github.com/sirpdboy/build/trunk/autosamba-samba4 ./package/new/autosamba-samba4

rm -rf ./feeds/luci/applications/luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./feeds/luci/applications/luci-app-openclash

rm -rf ./feeds/luci/applications/luci-app-bypass
rm -rf ./feeds/luci/applications/luci-app-vssr
svn co https://github.com/sirpdboy/build/trunk/pass ./package/pass

# samba4
# rm -rf ./feeds/luci/applications/luci-app-samba4 &&svn co https://github.com/sirpdboy/build/trunk/luci-app-samba4 ./feeds/luci/applications/luci-app-samba4

rm -rf ./feeds/luci/applications/luci-app-arpbind 
svn co https://github.com/sirpdboy/build/trunk/luci-app-arpbind ./feeds/luci/applications/luci-app-arpbind 
# ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

# Add ddnsto & linkease
# svn co https://github.com/linkease/nas-packages-luci/trunk/luci/ ./package/lean/luci
# svn co https://github.com/linkease/nas-packages/trunk/network/services/ ./package/lean/linkease
# svn co https://github.com/linkease/istore/trunk/luci/ ./package/lean/istore
# sed -i 's/1/0/g' ./package/lean/linkease/linkease/files/linkease.config

# Add luci-aliyundrive-webdav
# rm -rf ./feeds/luci/applications/luci-app-aliyundrive-webdav 
# rm -rf ./feeds/luci/applications/aliyundrive-webdav
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav ./feeds/luci/applications/aliyundrive-webdav
# svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav ./feeds/luci/applications/luci-app-aliyundrive-webdav 

# rm -rf ./feeds/luci/applications/vlmcsd
# svn export https://github.com/wongsyrone/lede-1/trunk/package/external/vlmcsd ./feeds/luci/applications/vlmcsd
# ln -sf ../../../feeds/packages/net/vlmcsd ./package/feeds/packages/vlmcsd 
# ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./feeds/luci/applications/luci-app-vlmcsd

#设置
sed -i 's/option enabled.*/option enabled 0/' feeds/*/*/*/*/upnpd.config
sed -i 's/option dports.*/option enabled 2/' feeds/*/*/*/*/upnpd.config
sed -i "s/ImmortalWrt/OpenWrt/" {$config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config


color cy "自定义设置.... "
config_generate="package/base-files/files/bin/config_generate"
sed -i "s/192.168.1.1/192.168.8.1/" $config_generate

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

date1='Ipv6-Super S'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
echo "DISTRIB_REVISION='${date1} by Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' by Sirpdboy ' >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

chmod +x ./package/*/root/etc/init.d/*  
chmod +x ./package/*/root/usr/*/*  
chmod +x ./package/*/*/root/etc/init.d/*  
chmod +x ./package/*/*/root/usr/*/*  
chmod +x ./package/*/*/*/root/etc/init.d/*  
chmod +x ./package/*/*/*/root/usr/*/*
./scripts/feeds update -i
