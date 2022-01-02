#!/bin/bash
#=================================================

rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/lean/luci-theme-opentomcat
rm -rf ./package/lean/luci-app-wrtbwmon

# git clone https://github.com/sirpdboy/build.git ./package/build
echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
# rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3
# rm -rf ./package/lean/automount
rm -rf ./package/lean/autosamba
rm -rf ./package/lean/luci-app-accesscontrol
rm -rf ./package/lean/autocore
rm -rf ./package/lean/default-settings
# rm -rf ./package/lean/luci-app-ramfree
rm -rf ./package/lean/luci-app-arpbind
rm -rf ./package/lean/luci-app-docker
rm -rf ./package/lean/luci-app-dockerman

rm -rf ./feeds/packages-master/utils/docker
rm -rf ./package/lean/trojan

# rm -rf ./package/lean/luci-app-vlmcsd
# rm -rf ./package/lean/vlmcsd 

rm -rf ./package/diy/luci-theme-edge
rm -rf ./package/build/luci-theme-darkmatter
 

svn co https://github.com/sirpdboy/build/trunk/my-autocore ./packages/build/my-autocore
svn co https://github.com/sirpdboy/build/trunk/default-settings ./packages/build/default-settings
svn co https://github.com/sirpdboy/build/trunk/autosamba ./packages/build/autosamba

# rm -rf ./feeds/package/net/samba4 && svn co https://github.com/sirpdboy/build/trunk/samba4 ./feeds/package/net/samba4
rm -rf ./package/lean/luci-app-samba4
svn co https://github.com/sirpdboy/build/trunk/luci-app-samba4 ./packages/builde/luci-app-samba4


# change 8m-16M
sed -i 's/8000k/16192k/g' ./target/linux/ath79/image/common-tp-link.mk
sed -i 's/tplink-8mlzma/tplink-16mlzma/g' ./target/linux/ath79/image/generic-tp-link.mk
sed -i 's/0x7d0000/0xfd0000/g' ./target/linux/ath79/dts/qca953x_tplink_tl-wr810n.dtsi

sed -i '/45)./d' ./package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' ./package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier

sed -i 's/vpn/services/g' ./package/lean/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
rm -rf ./package/build/luci-app-zerotier
rm -rf ./package/build/zerotier

rm -rf ./package/lean/luci-app-baidupcs-web && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-baidupcs-web ./package/lean/luci-app-baidupcs-web
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings2 > ./package/build/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/set/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
echo '添加关机'
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/ath79/Makefile


svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/lean/luci-theme-atmaterial_new
git clone https://github.com/apollo-ng/luci-theme-darkmatter.git package/diy/darkmatter
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge
git  clone   https://github.com/sirpdboy/luci-theme-opentopd.git package/new/luci-theme-opentopd

sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate


sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus//luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/+"), 10)/+"), 0)/g' ./package/lean/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
# sed -i 's/h"), 50)/h"), 8)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i
