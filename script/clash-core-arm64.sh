
#!/bin/bash
rm -rf /package/lean/r8168/patches/020-5.18-support.patch
mkdir -p files/etc/openclash/core
# sed -i "s/PKG_HASH:=.*/PKG_HASH:=5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72/g"  ./feeds/packages/utils/jq/Makefile

open_clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# offical_clash_main_url=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | sed 's/.*url\": \"//g' | sed 's/\"//g')

wget -qO- $open_clash_main_url | tar xOvz > files/etc/openclash/core/clash
# wget -qO- $offical_clash_main_url | gunzip -c > files/etc/openclash/core/clash
wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game

chmod +x files/etc/openclash/core/clash*

## opkg ##
PLATFORM=$(cat .config | grep CONFIG_TARGET_ARCH_PACKAGES | awk -F '"' '{print $2}')
TARGET=$(cat .config | grep CONFIG_TARGET_BOARD | awk -F '"' '{print $2}')
SUBTARGET=$(cat .config | grep CONFIG_TARGET_SUBTARGET | awk -F '"' '{print $2}')

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
