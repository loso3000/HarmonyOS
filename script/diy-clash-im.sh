#!/bin/bash
# rm -rf /package/lean/r8168/patches/020-5.18-support.patch

#删除冲突插件
# rm -rf $(find ./feeds/luci/ -type d -regex ".*\(argon\|design\|openclash\).*")
#修改默认主题
# sed -i "s/luci-theme-bootstrap/luci-theme-$OWRT_THEME/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
#修改默认IP地址
# sed -i "s/192\.168\.[0-9]*\.[0-9]*/$OWRT_IP/g" ./package/base-files/files/bin/config_generate
#修改默认主机名
# sed -i "s/hostname='.*'/hostname='$OWRT_NAME'/g" ./package/base-files/files/bin/config_generate
#修改默认时区
sed -i "s/timezone='.*'/timezone='CST-8'/g" ./package/base-files/files/bin/config_generate
sed -i "/timezone='.*'/a\\\t\t\set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate

#预置OpenClash内核和GEO数据
mkdir -p files/etc/openclash/core
# cd ./OpenClash/luci-app-openclash/root/etc/openclash
pushd files/etc/openclash/core
export CORE_TYPE=$1
export CORE_VER=https://raw.githubusercontent.com/vernesong/OpenClash/core/dev/core_version
export CORE_TUN=https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux
export CORE_DEV=https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux
export CORE_MATE=https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux
export TUN_VER=$(curl -sfL $CORE_VER | sed -n "2{s/\r$//;p;q}")

curl -sfL -o ./tun.gz "$CORE_TUN"-"$CORE_TYPE"-"$TUN_VER".gz
gzip -d ./tun.gz && mv ./tun ./clash_tun
curl -sfL -o ./meta.tar.gz "$CORE_MATE"-"$CORE_TYPE".tar.gz
tar -zxf ./meta.tar.gz && mv ./clash ./clash_meta
curl -sfL -o ./dev.tar.gz "$CORE_DEV"-"$CORE_TYPE".tar.gz
tar -zxf ./dev.tar.gz
chmod +x ./clash* ; rm -rf ./*.gz
# chmod +x files/etc/openclash/core/clash*
popd
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# oh-my-zsh
mkdir -p files/root
pushd files/root

## Install oh-my-zsh
# Clone oh-my-zsh repository
git clone https://github.com/ohmyzsh/ohmyzsh ./.oh-my-zsh

# Install extra plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions

# Get .zshrc dotfile
# cp $GITHUB_WORKSPACE/scripts/.zshrc .
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/z.zshrc > ./.zshrc
popd

mv -f ./package/other/patch/z.zshrc ./files/root/.zshrc
mv -f ./package/other/patch/profiles ./files/etc/profiles
ls -a ./files/root
echo "------------------------------------------------------"
ls -a ./files/etc
echo "------------------------------------------------------"
## opkg ##
PLATFORM=$(cat .config | grep CONFIG_TARGET_ARCH_PACKAGES | awk -F '"' '{print $2}')
TARGET=$(cat .config | grep CONFIG_TARGET_BOARD | awk -F '"' '{print $2}')
SUBTARGET=$(cat .config | grep CONFIG_TARGET_SUBTARGET | awk -F '"' '{print $2}')

mkdir -p files/etc/opkg
sed -i "s/subtarget/$SUBTARGET/g" ../configx/opkg/distfeeds*.conf
sed -i "s/target\//$TARGET\//g" ../configx/opkg/distfeeds*.conf
sed -i "s/platform/$PLATFORM/g" ../configx/opkg/distfeeds*.conf
mkdir -p files/etc/opkg/keys
cp ../configx/opkg/1035ac73cc4e59e3 files/etc/opkg/keys/1035ac73cc4e59e3
cp ../configx/opkg/distfeeds-18.06-remote.conf files/etc/opkg/distfeeds.conf
cp ../configx/opkg/distfeeds-packages-server.conf files/etc/opkg/distfeeds.conf.server
cp files/etc/opkg/distfeeds.conf.server files/etc/opkg/distfeeds.conf.mirror
sed -i "s/http:\/\/192.168.10.1:2345\/snapshots/https:\/\/openwrt.cc\/snapshots\/$(date +"%Y-%m-%d")\/lean/g" files/etc/opkg/distfeeds.conf.mirror
     
mkdir -p files/etc/opkg
pushd files/etc/opkg
cat <<-EOF > "distfeeds.conf"
src/gz openwrt_core https://openwrt.cc/snapshots/targets/$TARGET/$SUBTARGET/packages
src/gz openwrt_base https://openwrt.cc/snapshots/packages/$PLATFORM/base
src/gz openwrt_luci https://openwrt.cc/snapshots/packages/$PLATFORM/luci
src/gz openwrt_packages https://openwrt.cc/snapshots/packages/$PLATFORM/packages
src/gz openwrt_routing https://openwrt.cc/snapshots/packages/$PLATFORM/routing
src/gz openwrt_telephony https://openwrt.cc/snapshots/packages/$PLATFORM/telephony
EOF
popd
