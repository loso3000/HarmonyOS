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

rm -rf ./cfeeds/luci/themes/luci-theme-argon
rm -rf ./cfeeds/luci/applications/luci-app-wrtbwmon
# rm -rf cfeeds/luci/applications/luci-app-openvpn-server
rm -rf ./cfeeds/packages/net/mentohust
rm -rf ./cfeeds/packages/net/open-app-filter

# 清理
rm -rf cfeeds/*/*/{smartdns,wrtbwmon,luci-app-smartdns,luci-app-timecontrol,luci-app-ikoolproxy,luci-app-smartinfo,luci-app-socat,luci-app-netdata,luci-app-wolplus,luci-app-arpbind,luci-app-baidupcs-web}
rm -rf package/*/{autocore,autosamba,default-settings}
rm -rf cfeeds/*/*/{luci-app-dockerman,luci-app-aria2,luci-app-beardropper,oaf,luci-app-adguardhome,luci-app-appfilter,open-app-filter,luci-app-openclash,luci-app-vssr,luci-app-ssr-plus,luci-app-passwall,luci-app-bypass,luci-app-wrtbwmon,luci-app-samba,luci-app-samba4,luci-app-unblockneteasemusic}

git clone https://github.com/loso3000/other ./package/other
git clone https://github.com/sirpdboy/sirpdboy-package ./package/diy

#管控
sed -i 's/gk-jzgk/control-parentcontrol/g' ./package/other/up/luci-app-gk-jzgk/Makefile
mv -f  ./package/other/up/luci-app-jzgk ./package/other/up/luci-app-control-parentcontrol

# netwizard
sed -i 's/owizard/netwizard/g' ./package/other/up/luci-app-owizard/Makefile
mv -f  ./package/other/up/luci-app-owizard ./package/other/up/luci-app-netwizard
 
echo advancedplus
# svn export https://github.com/loso3000/mypk/trunk/up/luci-app-kplus ./package/lean/luci-app-advancedplus
svn export https://github.com/loso3000/mypk/trunk/up/luci-app-zplus ./package/lean/luci-app-advancedplus
sed -i 's/pdadplus/advancedplus/g' ./package/lean/luci-app-advancedplus
sed -i 's/pdadplus/advancedplus/g' ./feeds/luci/applications/luci-app-advancedplus

echo kucat
# mv -f  ./package/other/up/luci-app-xkucat ./package/other/up/luci-app-kucat
# svn export https://github.com/loso3000/mypk/trunk/up/luci-theme-catq ./package/lean/luci-theme-kucat
svn export https://github.com/loso3000/mypk/trunk/up/luci-theme-zcat ./package/lean/luci-theme-kucat
sed -i 's/qcatku/kucat/g' ./package/lean/luci-app-kucat

# alist
# git clone https://github.com/sbwml/luci-app-alist package/alist
# rm -rf cfeeds/packages/lang/golang
# svn export https://github.com/sbwml/packages_lang_golang/branches/19.x cfeeds/packages/lang/golang
# sed -i 's/网络存储/存储/g' ./package/alist/luci-app-alist/po/zh-cn/alist.po

#luci-app-easymesh
# rm -rf ./cfeeds/luci/applications/luci-app-easymesh
# svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-easymesh  ./cfeeds/luci/applications/luci-app-easymesh
# sed -i "s/wpad-openssl/wpad-mesh-wolfssl/g" ./cfeeds/luci/applications/luci-app-easymesh/Makefile

# svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-autotimeset  ./package/luci-app-autotimeset

# sed -i 's/-D_GNU_SOURCE/-D_GNU_SOURCE -Wno-error=use-after-free/g' ./package/libs/elfutils/Makefile

# rm -rf ./cfeeds/luci/applications/netspeedtest
# svn export https://github.com/sirpdboy/netspeedtest  ./packages/netspeedtest

#  coremark
sed -i '/echo/d' ./feeds/packages/utils/coremark/coremark

#  git clone https://github.com/gdy666/luci-app-lucky ./package/luck ./package/lucky
git clone https://github.com/sirpdboy/luci-app-lucky ./package/lucky
# git clone https://github.com/sirpdboy/luci-app-ddns-go ./package/ddns-go

# rm -rf ./package/other/up/OpenAppFilter
# git clone https://github.com/destan19/OpenAppFilter ./package/OpenAppFilter

# nlbwmon
sed -i 's/524288/16777216/g' cfeeds/packages/net/nlbwmon/files/nlbwmon.config
# 可以设置汉字名字
sed -i '/o.datatype = "hostname"/d' cfeeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/system.lua
# sed -i '/= "hostname"/d' /usr/lib/lua/luci/model/cbi/admin_system/system.lua

rm -rf ./cfeeds/packages/utils/cups
rm -rf ./cfeeds/packages/utils/cupsd
rm -rf ./cfeeds/luci/applications/luci-app-cupsd
rm -rf ./package/cfeeds/packages/luci-app-cupsd 
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cupsd/cups ./cfeeds/packages/utils/cups
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-cupsd/ ./cfeeds/luci/applications/luci-app-cupsd

# Add ddnsto & linkease
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/ ./package/diy1/luci
svn export https://github.com/linkease/nas-packages/trunk/network/services/ ./package/diy1/linkease
svn export https://github.com/linkease/nas-packages/trunk/multimedia/ffmpeg-remux/ ./package/diy1/ffmpeg-remux
svn export https://github.com/linkease/istore/trunk/luci/ ./package/diy1/istore
sed -i 's/1/0/g' ./package/diy1/linkease/linkease/files/linkease.config
sed -i 's/luci-lib-ipkg/luci-base/g' package/diy1/istore/luci-app-store/Makefile
# svn export https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui


# rm -rf ./package/other/luci-app-mwan3  ./package/other/mwan3
rm -rf ./cfeeds/luci/applications/luci-app-mwan3
rm -rf ./cfeeds/packages/net/mwan3
mv -f  ./package/other/mwan3 ./cfeeds/packages/net/mwan3
mv -f  ./package/other/luci-app-mwan3 ./cfeeds/luci/applications/luci-app-mwan3

# svn export https://github.com/Lienol/openwrt-packages/branches/21.02/net/mwan3 ./cfeeds/packages/net/mwan3
# svn export https://github.com/Lienol/openwrt-luci/branches/21.02/applications/luci-app-mwan3 ./cfeeds/luci/applications/luci-app-mwan3
# cp -f ./package/other/patch/mwan3  ./cfeeds/packages/net/mwan3/files/etc/config/mwan3
# cat   ./package/other/patch/mwan3 > ./cfeeds/packages/net/mwan3/files/etc/config/mwan3

rm -rf ./package/other/up/pass/mosdns
rm -rf ./cfeeds/packages/net/mosdns
rm -rf cfeeds/packages/net/mosdns package/cfeeds/packages/mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns cfeeds/packages/net/mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/new/mosdns
rm -rf package/cfeeds/packages/luci-app-mosdns ./cfeeds/luci/applications/luci-app-mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns ./cfeeds/luci/applications/luci-app-mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/new/luci-app-mosdns

# git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
rm -rf ./cfeeds/packages/net/v2ray-geodata
git clone https://github.com/sbwml/v2ray-geodata package/geodata
sed -i "/filter_aaaa='1'/d" ./cfeeds/luci/applications/luci-app-mosdns/root/etc/init.d/mosdns

#dnsmasq
#rm -rf ./package/network/services/dnsmasq package/cfeeds/packages/dnsmasq
#svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/network/services/dnsmasq ./package/network/services/dnsmasq

#upnp
#rm -rf ./cfeeds/packages/net/miniupnpd
#svn export https://github.com/sirpdboy/sirpdboy-package/trunk/upnpd/miniupnp   ./cfeeds/packages/net/miniupnp
rm -rf ./cfeeds/luci/applications/luci-app-upnp  package/cfeeds/packages/luci-app-upnp
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/upnpd/luci-app-upnp ./cfeeds/luci/applications/luci-app-upnp
rm -rf  ./package/diy/upnpd

mkdir -p ./package/lean
# mv ./package/other/up/myautocore ./package/lean/autocore
rm -rf ./package/lean/autocore  
rm -rf ./package/other/up/autocore
rm -rf ./package/other/up/myautocore
# rm -rf  ./package/emortal/autocore package/cfeeds/packages/autocore
svn export https://github.com/loso3000/other/trunk/up/myautocore ./package/lean/autocore
sed -i 's/myautocore/autocore/g' ./package/lean/autocore/Makefile

rm -rf ./package/lean/autosamba
rm -rf ./package/other/up/autosamba-samba4
svn export https://github.com/loso3000/other/trunk/up/autosamba-samba4 ./package/lean/autosamba
sed -i 's/autosamba-samba4/autosamba/g' ./package/lean/autosamba/Makefile

mv ./package/other/up/automount-ntfs3g ./package/lean/automount-ntfs3g
rm -rf ./package/lean/automount  
rm -rf ./package/other/up/automount
rm -rf  package/emortal/automount package/cfeeds/packages/automount
svn export https://github.com/loso3000/other/trunk/up/automount-ntfs3g ./package/lean/automount
sed -i 's/automount-ntfs/automount/g' ./package/lean/automount/Makefile

 
mv ./package/other/up/default-settings ./package/lean/default-settings
rm -rf ./package/lean/default-settings  
rm -rf  package/emortal/default-settings 
rm -rf ./package/other/up/default-settings package/cfeeds/packages/default-settings
svn export https://github.com/loso3000/other/trunk/up/default-settings ./package/lean/default-settings


echo "poweroff"
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./cfeeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./cfeeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

#设置
sed -i 's/option enabled.*/option enabled 0/' cfeeds/*/*/*/*/upnpd.config
sed -i 's/option dports.*/option enabled 2/' cfeeds/*/*/*/*/upnpd.config

sed -i "s/ImmortalWrt/OpenWrt/" {package/base-files/files/bin/config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config

echo '替换smartdns'
rm -rf ./cfeeds/packages/net/smartdns
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./cfeeds/packages/net/smartdns

# netdata 
rm -rf ./cfeeds/luci/applications/luci-app-netdata package/cfeeds/packages/luci-app-netdata
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./cfeeds/luci/applications/luci-app-netdata
ln -sf ../../../cfeeds/luci/applications/luci-app-netdata ./package/cfeeds/luci/luci-app-netdata

rm -rf ./cfeeds/luci/applications/luci-app-arpbind
svn export https://github.com/loso3000/other/trunk/up/luci-app-arpbind ./cfeeds/luci/applications/luci-app-arpbind 
ln -sf ../../../cfeeds/luci/applications/luci-app-arpbind ./package/cfeeds/luci/luci-app-arpbind
rm -rf ./package/other/up/luci-app-arpbind

# Add luci-app-dockerman
rm -rf ./cfeeds/luci/applications/luci-app-dockerman
rm -rf ./cfeeds/luci/applications/luci-app-docker
rm -rf ./cfeeds/luci/collections/luci-lib-docker
rm -rf ./package/diy/luci-app-dockerman
# rm -rf ./cfeeds/packages/utils/docker
# git clone --depth=1 https://github.com/lisaac/luci-lib-docker ./package/new/luci-lib-docker
# git clone --depth=1 https://github.com/lisaac/luci-app-dockerman ./package/new/luci-app-dockerman

svn export https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker ./package/new/luci-lib-docke
svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman ./package/new/luci-app-dockerman
# sed -i '/auto_start/d' ./package/diy/luci-app-dockerman/root/etc/uci-defaults/luci-app-dockerman
# sed -i '/sysctl.d/d' cfeeds/packages/utils/dockerd/Makefile
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.10
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.15
# sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' ./package/new/luci-app-dockerman/Makefile
# sed -i '$i /etc/init.d/dockerd restart &' ./package/new/luci-app-dockerman/root/etc/uci-defaults/*

# vlmcsd
# rm -rf ./cfeeds/luci/applications/vlmcsd
# svn export https://github.com/wongsyrone/lede-1/trunk/package/external/vlmcsd ./cfeeds/luci/applications/vlmcsd
# ln -sf ../../../cfeeds/packages/net/vlmcsd ./package/cfeeds/packages/vlmcsd 
# ln -sf ../../../cfeeds/luci/applications/luci-app-vlmcsd ./cfeeds/luci/applications/luci-app-vlmcsd

# Add luci-aliyundrive-webdav
rm -rf ./cfeeds/luci/applications/luci-app-aliyundrive-webdav 
rm -rf ./cfeeds/luci/applications/aliyundrive-webdav

svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav ./cfeeds/luci/applications/aliyundrive-webdav
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav ./cfeeds/luci/applications/luci-app-aliyundrive-webdav 

# samba4
rm -rf ./package/other/up/samba4
# rm -4f ./cfeeds/packages/net/samba4  package/cfeeds/packages/samba4
# mv ./package/other/up/samba4 ./cfeeds/packages/net/samba4 
# svn export https://github.com/loso3000/other/trunk/up/samba4 ./cfeeds/packages/net/samba4
rm -rf ./cfeeds/luci/applications/luci-app-samba4  ./package/other/up/luci-app-samba4
svn export https://github.com/loso3000/other/trunk/up/luci-app-samba4 ./cfeeds/luci/applications/luci-app-samba4

#zerotier 
# rm -rf  luci-app-zerotier && git clone https://github.com/rufengsuixing/luci-app-zerotier.git cfeeds/luci/applications/luci-app-zerotier  #取消防火墙
# svn export https://github.com/immortalwrt/luci/trunk/applications/luci-app-zerotier cfeeds/luci/applications/luci-app-zerotier
# ln -sf ../../../cfeeds/luci/applications/luci-app-zerotier ./package/cfeeds/luci/luci-app-zerotier
# rm -rf ./cfeeds/packages/net/zerotier
# svn export https://github.com/openwrt/packages/trunk/net/zerotier cfeeds/packages/net/zerotier
# rm -rf ./cfeeds/packages/net/zerotier/files/etc/init.d/zerotier
sed -i '/45)./d' cfeeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' cfeeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' cfeeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier

rm -rf ./cfeeds/packages/net/softethervpn5 package/cfeeds/packages/softethervpn5
svn export https://github.com/loso3000/other/trunk/up/softethervpn5 ./cfeeds/packages/net/softethervpn5

rm -rf ./cfeeds/luci/applications/luci-app-socat  ./package/cfeeds/luci/luci-app-socat
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-socat ./cfeeds/luci/applications/luci-app-socat
sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./cfeeds/luci/applications/luci-app-socat/po/zh-cn/socat.po
ln -sf ../../../cfeeds/luci/applications/luci-app-socat ./package/cfeeds/luci/luci-app-socat

sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/实时流量监测/流量/g'  `grep "实时流量监测" -rl ./`
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g'  `grep "解锁网易云灰色歌曲" -rl ./`
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g'  `grep "解除网易云音乐播放限制" -rl ./`
sed -i 's/家庭云//g'  `grep "家庭云" -rl ./`

sed -i 's/aMule设置/电驴下载/g' ./cfeeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./cfeeds/luci/applications/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
# echo  "        option tls_enable 'true'" >> ./cfeeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./cfeeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/管理登陆/g' ./cfeeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码

#cifs
sed -i 's/nas/services/g' ./cfeeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua   #dnsfilter
sed -i 's/a.default = "0"/a.default = "1"/g' ./cfeeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
echo  "        option tls_enable 'true'" >> ./cfeeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./cfeeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误


echo '灰色歌曲'
rm -rf ./cfeeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

#断线不重拨
sed -i 's/q reload/q restart/g' ./package/network/config/firewall/files/firewall.hotplug

#echo "其他修改"
sed -i 's/option commit_interval.*/option commit_interval 1h/g' cfeeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h
# sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' cfeeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置

# echo '默认开启 Irqbalance'
# sed -i "s/enabled '0'/enabled '1'/g" cfeeds/packages/utils/irqbalance/files/irqbalance.config

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust package/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk package/MentoHUST-OpenWrt-ipk

# 全能推送
rm -rf ./cfeeds/luci/applications/luci-app-pushbot && \
git clone https://github.com/zzsj0928/luci-app-pushbot ./cfeeds/luci/applications/luci-app-pushbot
rm -rf ./cfeeds/luci/applications/luci-app-jd-dailybonus && \
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus ./cfeeds/luci/applications/luci-app-jd-dailybonus
rm -rf ./cfeeds/luci/applications/luci-app-serverchan && \
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./cfeeds/luci/applications/luci-app-serverchan

git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter

rm -rf ./cfeeds/packages/net/adguardhome
svn export https://github.com/openwrt/packages/trunk/net/adguardhome cfeeds/packages/net/adguardhome

git clone https://github.com/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/, 1).d/, 11).d/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua

# svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash
svn export https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash package/new/luci-app-openclash
sed -i 's/+libcap /+libcap +libcap-bin /' package/new/luci-app-openclash/Makefile

# Fix libssh
# rm -rf cfeeds/packages/libs
svn export https://github.com/openwrt/packages/trunk/libs/libssh cfeeds/packages/libs/
# Add apk (Apk Packages Manager)
svn export https://github.com/openwrt/packages/trunk/utils/apk package/new/

# ChinaDNS
# git clone -b luci --depth 1 https://github.com/pexcn/openwrt-chinadns-ng.git package/new/luci-app-chinadns-ng
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng

# CPU 控制相关
rm -rf  cfeeds/luci/applications/luci-app-cpufreq
svn export -r 19495 https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq cfeeds/luci/applications/luci-app-cpufreq
ln -sf ../../../cfeeds/luci/applications/luci-app-cpufreq ./package/cfeeds/luci/luci-app-cpufreq
sed -i 's,1608,1800,g' cfeeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
sed -i 's,2016,2208,g' cfeeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq
sed -i 's,1512,1608,g' cfeeds/luci/applications/luci-app-cpufreq/root/etc/uci-defaults/10-cpufreq

# Passwall
rm -rf ./cfeeds/packages/net/pdnsd-alt
rm -rf ./cfeeds/packages/net/shadowsocks-libev
rm -rf ./cfeeds/packages/net/xray-core
rm -rf ./cfeeds/packages/net/kcptun
rm -rf ./cfeeds/packages/net/brook
rm -rf ./cfeeds/packages/net/chinadns-ng
rm -rf ./cfeeds/packages/net/dns2socks
rm -rf ./cfeeds/packages/net/hysteria
rm -rf ./cfeeds/packages/net/ipt2socks
rm -rf ./cfeeds/packages/net/microsocks
rm -rf ./cfeeds/packages/net/naiveproxy
rm -rf ./cfeeds/packages/net/shadowsocks-rust
rm -rf ./cfeeds/packages/net/simple-obfs
rm -rf ./cfeeds/packages/net/ssocks
rm -rf ./cfeeds/packages/net/tcping
rm -rf ./cfeeds/packages/net/v2ray*
rm -rf ./cfeeds/packages/net/xray*
rm -rf ./cfeeds/packages/net/trojan*

#bypass
# rm -rf package/other/up/pass/luci-app-bypass 
rm -rf ./cfeeds/luci/applications/luci-app-ssr-plus  package/cfeeds/packages/luci-app-ssr-plus
# git clone https://github.com/kiddin9/openwrt-bypass package/bypass
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/bypass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plus/Makefile
sed -i 's,default n,default y,g' package/other/up/pass/luci-app-ssr-plusdns/Makefile

#  git clone https://github.com/loso3000/openwrt-passwall package/passwall
# svn export https://github.com/loso3000/openwrt-passwall/trunk/luci-app-passwall  package/passwall/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/passwall/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
 pushd ./cfeeds/luci/applications/luci-app-passwall
 sed -i 's,default n,default y,g' Makefile
 popd
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
rm -rf ./cfeeds/packages/net/kcptun
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
svn export https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook

svn export https://github.com/xiaorouji/openwrt-passwall/trunk/brook cfeeds/packages/net/brook

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
rm -rf ./cfeeds/packages/net/shadowsocks-libev
svn export https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/lean/shadowsocks-libev
svn export https://github.com/fw876/helloworld/trunk/redsocks2 package/lean/redsocks2
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/srelay package/lean/srelay
svn export https://github.com/fw876/helloworld/trunk/trojan package/lean/trojan
svn export https://github.com/fw876/helloworld/trunk/tcping package/lean/tcping
svn export https://github.com/fw876/helloworld/trunk/dns2tcp package/lean/dns2tcp
svn export https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/lean/shadowsocksr-libev
svn export https://github.com/fw876/helloworld/trunk/simple-obfs package/lean/simple-obfs
svn export https://github.com/fw876/helloworld/trunk/naiveproxy package/lean/naiveproxy

rm -rf ./cfeeds/packages/net/v2ray-core
svn export https://github.com/fw876/helloworld/trunk/v2ray-core package/lean/v2ray-core
svn export https://github.com/fw876/helloworld/trunk/hysteria package/lean/hysteria
svn export https://github.com/fw876/helloworld/trunk/sagernet-core package/lean/sagernet-core

# svn export https://github.com/fw876/helloworld/trunk/xray-core package/lean/xray-core
rm -rf ./feeds/packages/net/xray-core
svn export https://github.com/loso3000/openwrt-passwall/trunk/xray-core  package/passwall/xray-core
svn export https://github.com/loso3000/openwrt-passwall/trunk/xray-core  ./feeds/packages/net/xray-core

svn export https://github.com/fw876/helloworld/trunk/v2ray-plugin package/lean/v2ray-plugin
svn export https://github.com/fw876/helloworld/trunk/xray-plugin package/lean/xray-plugin
svn export https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/lean/shadowsocks-rust
rm -rf ./cfeeds/packages/net/kcptun
svn export https://github.com/immortalwrt/packages/trunk/net/kcptun cfeeds/packages/net/kcptun
ln -sf ../../../cfeeds/packages/net/kcptun ./package/cfeeds/packages/kcptun

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
# sed -i "s/bootstrap/chuqitopd/g" cfeeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' cfeeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' cfeeds/luci/collections/luci/Makefile
# sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' cfeeds/luci/collections/luci/Makefile
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' cfeeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名


rm -rf ./cfeeds/luci/applications/luci-theme-argon package/cfeeds/packages/luci-theme-argon
rm -rf ./cfeeds/luci/themes/luci-theme-argon package/cfeeds/packages/luci-theme-argon  ./package/diy/luci-theme-edge
rm -rf ./cfeeds/luci/applications/luci-app-argon-config ./cfeeds/luci/applications/luci-theme-opentomcat ./cfeeds/luci/applications/luci-theme-ifit
rm -rf ./package/diy/luci-theme-argon ./package/diy/luci-theme-opentopd  ./package/diy/luci-theme-ifit   ./package/diy/luci-theme-opentomcat
rm -rf ./cfeeds/luci/applications/luci-theme-opentopd package/cfeeds/packages/luci-theme-opentopd
# svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-opentopd package/new/luci-theme-opentopd
# svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-theme-argon package/new/luci-theme-argon
# git clone https://github.com/john-shine/luci-theme-darkmatter.git package/diy/darkmatter
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
# git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge
# git clone https://github.com/thinktip/luci-theme-neobird.git   package/new/luci-theme-neobird

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
sed -i 's/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk

#修正nat回流 
cat ./package/other/patch/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
cat ./package/other/patch/banner > ./package/base-files/files/etc/banner
cat ./package/other/patch/profile > package/base-files/files/etc/profile
cat ./package/other/patch/network.lua > ./cfeeds/luci/modules/luci-base/luasrc/model/network.lua
cp -rf ./package/other/luci/*  ./cfeeds/luci/*

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


# sed -i '/boot()/,+2d' cfeeds/packages/net/ddns-scripts/files/etc/init.d/ddns
# svn export https://github.com/jjm2473/openwrt-third/trunk/ddns-scripts_aliyun cfeeds/packages/net/ddns-scripts_aliyun
# svn export https://github.com/jjm2473/openwrt-third/trunk/ddns-scripts_dnspod cfeeds/packages/net/ddns-scripts_dnspod

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

# 修改makefile
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/cfeeds\/luci\/luci\.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/cfeeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}

sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名

sed -i 's/kmod-usb-net-rtl8152/kmod-usb-net-rtl8152-vendor/' target/linux/rockchip/image/armv8.mk target/linux/sunxi/image/cortexa53.mk target/linux/sunxi/image/cortexa7.mk

#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' ./target/linux/*/Makefile
# Fix mt76 wireless driver
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' package/kernel/mt76/Makefile

# Change default shell to zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# 删除定时coremark
# rm -rf ./cfeeds/packages/utils/coremark
# svn export https://github.com/DHDAXCW/packages/trunk/utils/coremark cfeeds/packages/utils/coremark

# 风扇脚本
wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3399/base-files/etc/init.d/fa-rk3399-pwmfan
wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3399/base-files/usr/bin/start-rk3399-pwm-fan.sh


#zzz-default-settingsim
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingsim > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingsim > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings


#sed -i 's/US/CN/g ; s/OpenWrt/iNet/g ; s/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
sed -i "s/192.168.6.1/192.168.8.1/g"  package/base-files/files/bin/config_generate

# echo '默认开启 Irqbalance'
ver1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
export VER2="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"

date1='Ipv6-Plus-R'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
#date1='Ipv6-Plus-R2023.03.01'
#sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20230301-Ipv6-Plus-5.15-/g' include/image.mk
if [ "$VER2" = "5.4" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Plus-5.4-/g' include/image.mk
elif [ "$VER2" = "5.10" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Plus-5.10-/g' include/image.mk
elif [ "$VER2" = "5.15" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Plus-5.15-/g' include/image.mk
elif [ "$VER2" = "6.1" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Plus-6.1-/g' include/image.mk
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