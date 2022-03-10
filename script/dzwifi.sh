git clone https://github.com/sirpdboy/build.git ./package/build

rm -rf ./package/build/miniupnpd
rm -rf ./package/lean/automount
rm -rf ./package/lean/autosamba
rm -rf ./feeds/luci/applications/luci-app-accesscontrol
rm -rf ./package/build/autocore
rm -rf ./package/lean/autocore
rm -rf ./feeds/luci/applications/luci-app-arpbind
rm -rf ./feeds/luci/applications/luci-app-docker
rm -rf ./feeds/luci/applications/luci-app-dockerman

sed -i 's/root::0:0:99999:7:::/root:$1$tzMxByg.$e0847wDvo3JGW4C3Qqbgb.:19052:0:99999:7:::/g' ./package/base-files/files/etc/shadow
sed -i "s/hostname='OpenWrt'/hostname='JituTiktok'/g" package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

date1='JituTiktok R'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
echo "DISTRIB_REVISION='${date1}'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}  >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

# 使用默认取消自动
sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settingswifi > ./package/lean/default-settings/files/zzz-default-settings
sed -i 's/opentopd/chuqitopd/g'    ./package/build/default-settings/files/zzz-default-settings

sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf
sed -i 's/请输入用户名和密码。/欢迎使用~请输入登陆密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' ./target/linux/*/Makefile

# Passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/pass2
#rm -rf package/passwall/shadowsocksr-libev
# svn co https://github.com/loso3000/openwrt-pswall/trunk/luci-app-passwall ./package/passwall/luci-app-passwall
svn co https://github.com/loso3000/openwrt-pswall/trunk/ ./package/passwall
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile
# svn co https://github.com/loso3000/openwrt-pswall/trunk/shadowsocksr-libev ./package/passwall/shadowsocksr-libev
rm -rf ./package/build/pass
svn co https://github.com/hubutui/p7zip-lede/trunk package/p7zip
./scripts/feeds update -i
