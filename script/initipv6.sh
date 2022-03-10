#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
WORKDIR=/workdir
HOSTNAME=OpenWrt
IPADDRESS=192.168.8.1
SSID=Sirpdboy
ENCRYPTION=psk2
KEY=123456

# 使用 O2 级别的优化
# sed -i 's/O3/O2/g' include/target.mk
git clone https://github.com/sirpdboy/build.git ./package/build

# cp -f ./package/build/banner ./package/base-files/files/etc/
# replace banner
cp -f $GITHUB_WORKSPACE/general/openwrt_banner package/base-files/files/etc/banner

# rm -rf ./package/lean/r8152
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-theme-opentomcat
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf ./feeds/luci/applications/luci-app-mentohust 
rm -rf ./feeds/packages/net/MentoHUST-OpenWrt-ipk
rm -rf ./feeds/luci/applications/luci-proto-minieap

rm -rf ./feeds/luci/applications/luci-app-cpufreq

# socat
#rm -rf feeds/packages/net/socat
svn co https://github.com/openwrt/packages/trunk/net/socat feeds/packages/net/socat
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.7.4.3/g' feeds/packages/net/socat/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/socat/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007/g' feeds/packages/net/socat/Makefile
sed -i '75i\	  sc_cv_getprotobynumber_r=2 \\' feeds/packages/net/socat/Makefile
#rm -f feeds/packages/net/socat/patches/100-usleep.patch

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

#echo 'Model '
sed -i 's/HNET C108/Mifi/g' target/linux/ramips/dts/mt7620a_hnet_c108.dts
sed -i 's/wwan0/usb0/g' target/linux/ramips/mt7620/base-files/etc/board.d/01_leds
# sed -i 's/760000/f80000/g' target/linux/ramips/dts/mt7620n_zbtlink_zbt-cpe102.dts
# sed -i '/zbtlink_zbt-cpe102/{s/7552k))$/15872k))/;}' target/linux/ramips/image/mt7620.mk

#=================================================
# EC20.patches
pushd target/linux/ramips/patches-5.4
rm -rf 997-hxd-ec20.patch
wget https://github.com/hanxd/extd/releases/download/V1/997-hxd-ec20.patch
popd
# pushd package/base-files/files/etc/init.d
# wget https://github.com/hanxd/extd/releases/download/V1/quectel
# popd
#=================================================

pushd feeds/luci/applications
# Add cpufreq
rm -rf ./luci-app-cpufreq
# svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-cpufreq
# sed -i 's,1608,1800,g' luci-app-cpufreq/root/etc/uci-defaults/cpufreq
# # sed -i 's,2016,2208,g' luci-app-cpufreq/root/etc/uci-defaults/cpufreq
# sed -i 's,1512,1608,g' luci-app-cpufreq/root/etc/uci-defaults/cpufreq

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust 
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

git clone -b v3.0 https://github.com/Mmx233/BitSrunLoginGo_Openwrt

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add luci-aliyundrive-webdav
rm -rf ./luci-app-aliyundrive-webdav 
rm -rf ./aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav

# Add ddnsto & linkease
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
svn co https://github.com/linkease/nas-packages/trunk/network/services/linkease

# Add luci-app-oled (R2S Only)
git clone --depth=1 https://github.com/NateLol/luci-app-oled

#add clash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
cd luci-app-openclash && mkdir -p files/etc/openclash/core
open_clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-amd64 | sed 's/.*url\": \"//g' | sed 's/\"//g')
# offical_clash_main_url=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-amd64 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-amd64 | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-amd64 | sed 's/.*url\": \"//g' | sed 's/\"//g')

wget -qO- $open_clash_main_url | tar xOvz > files/etc/openclash/core/clash
# wget -qO- $offical_clash_main_url | gunzip -c > files/etc/openclash/core/clash
wget -qO- $clash_tun_url | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game
chmod +x files/etc/openclash/core/clash*

popd



# Add p7zip
svn co https://github.com/hubutui/p7zip-lede/trunk package/p7zip
# btrfs-progs
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.16.2/g' feeds/packages/utils/btrfs-progs/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9e9b303a1d0fd9ceaaf204ee74c1c8fa1fd55794e223d9fe2bc62875ecbd53d2/g' feeds/packages/utils/btrfs-progs/Makefile
rm -rf feeds/packages/utils/btrfs-progs/patches
#sed -i '68i\	--disable-libudev \\' feeds/packages/utils/btrfs-progs/Makefile
# node 
sed -i "s/PKG_VERSION:=v14.18.3/PKG_VERSION:=v14.19.0/g" feeds/packages/lang/node/Makefile
sed -i "s/PKG_HASH:=783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d608/PKG_HASH:=e92e846300e6117547d37ea8d5bd32244c19b2fcefcb39e1420a47637f45030c/g" feeds/packages/lang/node/Makefile
# runc
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.1.0/g' feeds/packages/utils/runc/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=a8de57edbf0ff741ea798ccdd99ac0e1b79914f552871bd7cd92b0569f200964/g' feeds/packages/utils/runc/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=067aaf8548d78269dcb2c13b856775e27c410f9c/g' feeds/packages/utils/runc/Makefile

# bsdtar
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.6.0/g' feeds/packages/libs/libarchive/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=df283917799cb88659a5b33c0a598f04352d61936abcd8a48fe7b64e74950de7/g' feeds/packages/libs/libarchive/Makefile

# pcre
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.45/g' package/libs/pcre/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=$(AUTORELEASE)/g' package/libs/pcre/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8/g' package/libs/pcre/Makefile

# pcre2
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=10.39/g' feeds/packages/libs/pcre2/Makefile
sed -i 's|PKG_SOURCE_URL:=.*|PKG_SOURCE_URL:=https://github.com/PhilipHazel/pcre2/releases/download/$(PKG_NAME)-$(PKG_VERSION)|g' feeds/packages/libs/pcre2/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440/g' feeds/packages/libs/pcre2/Makefile

# libseccomp
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.5.3/g' feeds/packages/libs/libseccomp/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=59065c8733364725e9721ba48c3a99bbc52af921daf48df4b1e012fbc7b10a76/g' feeds/packages/libs/libseccomp/Makefile
# python-docker
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.0.3/g' feeds/packages/lang/python/python-docker/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d916a26b62970e7c2f554110ed6af04c7ccff8e9f81ad17d0d40c75637e227fb/g' feeds/packages/lang/python/python-docker/Makefile
# parted
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.4/g' feeds/packages/utils/parted/Makefile
sed -i 's/PKG_MD5SUM:=.*/PKG_MD5SUM:=357d19387c6e7bc4a8a90fe2d015fe80/g' feeds/packages/utils/parted/Makefile
# expat
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.4.6/g' feeds/packages/libs/expat/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=de55794b7a9bc214852fdc075beaaecd854efe1361597e6268ee87946951289b/g' feeds/packages/libs/expat/Makefile
# transmission-web-control
sed -i 's/PKG_SOURCE_DATE:=.*/PKG_SOURCE_DATE:=2021-09-25/g' feeds/packages/net/transmission-web-control/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=4b2e1858f7a46ee678d5d1f3fa1a6cf2c739b88a/g' feeds/packages/net/transmission-web-control/Makefile
sed -i 's/PKG_MIRROR_HASH:=.*/PKG_MIRROR_HASH:=ea014c295766e2efc7b890dc6a6940176ba9c5bdcf85a029090f2bb850e59708/g' feeds/packages/net/transmission-web-control/Makefile
# python3
sed -i 's/PYTHON3_VERSION_MICRO:=.*/PYTHON3_VERSION_MICRO:=10/g' feeds/packages/lang/python/python3-version.mk
sed -i 's/PYTHON3_SETUPTOOLS_VERSION:=.*/PYTHON3_SETUPTOOLS_VERSION:=58.1.0/g' feeds/packages/lang/python/python3-version.mk
sed -i 's/PYTHON3_PIP_VERSION:=.*/PYTHON3_PIP_VERSION:=21.2.4/g' feeds/packages/lang/python/python3-version.mk
#sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python3/Makefile
#sed -i 's/PKG_HASH:=.*/PKG_HASH:=06828c04a573c073a4e51c4292a27c1be4ae26621c3edc7cf9318418ce3b6d27/g' feeds/packages/lang/python/python3/Makefile
svn co https://github.com/openwrt/packages/branches/openwrt-21.02/lang/python/python3 feeds/packages/lang/python/python3
sed -i '28i\python3-readline: readline\' feeds/packages/lang/python/python3-find-stdlib-depends.sh

# python-yaml
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=6.0/g' feeds/packages/lang/python/python-yaml/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-yaml/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2/g' feeds/packages/lang/python/python-yaml/Makefile
sed -i '22i\HOST_PYTHON3_PACKAGE_BUILD_DEPENDS:=Cython\n' feeds/packages/lang/python/python-yaml/Makefile

# python-websocket-client
#sed -i 's/PYPI_NAME:=.*/PYPI_NAME:=websocket-client/g' feeds/packages/lang/python/python-websocket-client/Makefile
#sed -i 's/PKG_LICENSE:=*/PKG_LICENSE:=Apache-2.0/g' feeds/packages/lang/python/python-websocket-client/Makefile
#sed -i 's/DEPENDS:=.*/DEPENDS:=+python3-light +python3-logging +python3-openssl/g' feeds/packages/lang/python/python-websocket-client/Makefile
#sed -i '34i\define Py3Package/python3-websocket-client/filespec' feeds/packages/lang/python/python-websocket-client/Makefile
#sed -i '35i\+|$(PYTHON3_PKG_DIR)' feeds/packages/lang/python/python-websocket-client/Makefile
#sed -i '36i\-|$(PYTHON3_PKG_DIR)/websocket/tests' feeds/packages/lang/python/python-websocket-client/Makefile
#sed -i '37i\endef\n' feeds/packages/lang/python/python-websocket-client/Makefile
rm -f feeds/packages/lang/python/python-websocket-client/Makefile
wget -P feeds/packages/lang/python/python-websocket-client https://raw.githubusercontent.com/openwrt/packages/master/lang/python/python-websocket-client/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.2.3/g' feeds/packages/lang/python/python-websocket-client/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=1315816c0acc508997eb3ae03b9d3ff619c9d12d544c9a9b553704b1cc4f6af5/g' feeds/packages/lang/python/python-websocket-client/Makefile

# python-texttable
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.6.4/g' feeds/packages/lang/python/python-texttable/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9/g' feeds/packages/lang/python/python-texttable/Makefile

# python-urllib3
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.26.8/g' feeds/packages/lang/python/python-urllib3/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c/g' feeds/packages/lang/python/python-urllib3/Makefile

# python-sqlalchemy
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.4.31/g' feeds/packages/lang/python/python-sqlalchemy/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=582b59d1e5780a447aada22b461e50b404a9dc05768da1d87368ad8190468418/g' feeds/packages/lang/python/python-sqlalchemy/Makefile

# python-simplejson
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.17.6/g' feeds/packages/lang/python/python-simplejson/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6/g' feeds/packages/lang/python/python-simplejson/Makefile

# python-pyrsistent
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.18.1/g' feeds/packages/lang/python/python-pyrsistent/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96/g' feeds/packages/lang/python/python-pyrsistent/Makefile

# python-pycparser
rm -rf feeds/packages/lang/python/python-pycparser
svn co https://github.com/openwrt/packages/trunk/lang/python/python-pycparser feeds/packages/lang/python/python-pycparser

# python-paramiko
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.9.2/g' feeds/packages/lang/python/python-paramiko/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=944a9e5dbdd413ab6c7951ea46b0ab40713235a9c4c5ca81cfe45c6f14fa677b/g' feeds/packages/lang/python/python-paramiko/Makefile

# python-lxml
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=4.8.0/g' feeds/packages/lang/python/python-lxml/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23/g' feeds/packages/lang/python/python-lxml/Makefile

# python-idna
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.3/g' feeds/packages/lang/python/python-idna/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d/g' feeds/packages/lang/python/python-idna/Makefile

# python-dns
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.1.0/g' feeds/packages/lang/python/python-dns/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4/g' feeds/packages/lang/python/python-dns/Makefile

# python-certifi
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2021.10.8/g' feeds/packages/lang/python/python-certifi/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872/g' feeds/packages/lang/python/python-certifi/Makefile

# bcrypt
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.2.0/g' feeds/packages/lang/python/bcrypt/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/bcrypt/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29/g' feeds/packages/lang/python/bcrypt/Makefile

# python-dotenv
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.19.2/g' feeds/packages/lang/python/python-dotenv/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=a5de49a31e953b45ff2d2fd434bbc2670e8db5273606c1e737cc6b93eff3655f/g' feeds/packages/lang/python/python-dotenv/Makefile

# python-cffi
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.15.0/g' feeds/packages/lang/python/python-cffi/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954/g' feeds/packages/lang/python/python-cffi/Makefile

# python-cryptography
rm -rf feeds/packages/lang/python/python-cryptography
svn co https://github.com/openwrt/packages/trunk/lang/python/python-cryptography feeds/packages/lang/python/python-cryptography

# python-distro
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.6.0/g' feeds/packages/lang/python/python-distro/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-distro/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424/g' feeds/packages/lang/python/python-distro/Makefile

# python-dateutil
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2.8.2/g' feeds/packages/lang/python/python-dateutil/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/lang/python/python-dateutil/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86/g' feeds/packages/lang/python/python-dateutil/Makefile

# python-requests
rm -rf feeds/packages/lang/python/python-requests
svn co https://github.com/openwrt/packages/trunk/lang/python/python-requests feeds/packages/lang/python/python-requests

# host-pip-requirements
sed -i 's/cffi==1.14.5 --hash=sha256:fd78e5fee591709f32ef6edb9a015b4aa1a5022598e36227500c8f4e02328d9c/cffi==1.15.0 --hash=sha256:920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954/g' feeds/packages/lang/python/host-pip-requirements/cffi.txt
sed -i 's/pycparser==2.20 --hash=sha256:2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0/pycparser==2.21 --hash=sha256:e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206/g' feeds/packages/lang/python/host-pip-requirements/cffi.txt
sed -i 's/Cython==0.29.21 --hash=sha256:e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad/Cython==0.29.24 --hash=sha256:cdf04d07c3600860e8c2ebaad4e8f52ac3feb212453c1764a49ac08c827e8443/g' feeds/packages/lang/python/host-pip-requirements/Cython.txt
sed -i 's/setuptools-scm==4.1.2 --hash=sha256:a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8/setuptools-scm==6.0.1 --hash=sha256:d1925a69cb07e9b29416a275b9fadb009a23c148ace905b2fb220649a6c18e92/g' feeds/packages/lang/python/host-pip-requirements/setuptools-scm.txt

# gzip
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.11/g' feeds/packages/utils/gzip/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/utils/gzip/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=9b9a95d68fdcb936849a4d6fada8bf8686cddf58b9b26c9c4289ed0c92a77907/g' feeds/packages/utils/gzip/Makefile

# openssh
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=8.9p1/g' feeds/packages/net/openssh/Makefile
sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/g' feeds/packages/net/openssh/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7/g' feeds/packages/net/openssh/Makefile
sed -i '175i\	--with-sandbox=no \\' feeds/packages/net/openssh/Makefile
# nss
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=3.75/g' feeds/packages/libs/nss/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=fd571507827284644f4dd522a032acda2286835f6683ed22a1c2d3878cc58582/g' feeds/packages/libs/nss/Makefile

# softethervpn5
rm -rf feeds/packages/net/softethervpn5
svn co https://github.com/openwrt/packages/trunk/net/softethervpn5 feeds/packages/net/softethervpn5

# hwdata
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.356/g' feeds/packages/utils/hwdata/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=117cbd0a7414153b0842cba3346e7fe5ed3b90335795e6ee230ec1d9fdf5d624/g' feeds/packages/utils/hwdata/Makefile

# gawk
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.1.1/g' feeds/packages/utils/gawk/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2/g' feeds/packages/utils/gawk/Makefile

# ocserv
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=1.1.6/g' feeds/packages/net/ocserv/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=6a6cbe92212e32280426a51c634adc3d4803579dd049cfdb7e014714cc82c693/g' feeds/packages/net/ocserv/Makefile

# unrar
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=6.1.5/g' feeds/packages/utils/unrar/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=4e56717d867cdff7a0008b7f1da6aa79ac7a8f974cf134d49a8c16b577bced4a/g' feeds/packages/utils/unrar/Makefile

echo '替换smartdns'
rm -rf ./feeds/packages/net/smartdns&& svn co https://github.com/sirpdboy/sirpdboy-package/trunk/smartdns ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/applications/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./feeds/luci/applications/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
cat  ./package/build/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3 && rm -rf ./package/build/mwan3
# rm -rf ./package/build/mwan3 && curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3   > ./feeds/packages/net/mwan3/files/etc/config/mwan3
# rm -rf ./feeds/packages/net/mwan3 && svn co https://github.com/sirpdboy/build/trunk/mwan3 ./feeds/packages/net/mwan3
# rm -rf ./feeds/packages/net/https-dns-proxy  && svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy ./feeds/packages/net/https-dns-proxy
# rm -rf ./feeds/packages/devel/ninja   && svn co https://github.com/Lienol/openwrt-packages/trunk/devel/ninja feeds/packages/devel/ninja
rm -rf ./package/build/miniupnpd  
# rm -rf ./feeds/packages/net/miniupnpd  && svn co https://github.com/sirpdboy/build/trunk/miniupnpd ./feeds/packages/net/miniupnpd
rm -rf ./package/lean/automount
rm -rf ./package/lean/autosamba
rm -rf ./feeds/luci/applications/luci-app-accesscontrol
# rm -rf ./package/build/autocore
rm -rf ./package/lean/autocore
rm -rf ./package/lean/default-settings
# rm -rf ./feeds/luci/applications/luci-app-ramfree
rm -rf ./feeds/luci/applications/luci-app-arpbind
rm -rf ./feeds/luci/applications/luci-app-docker
rm -rf ./feeds/luci/applications/luci-app-dockerman

# rm -rf ./feeds/packages-master/utils/docker

rm -rf ./package/lean/trojan

rm -rf ./feeds/luci/applications/luci-app-vlmcsd
rm -rf ./feeds/luci/applications/vlmcsd 

rm -rf ./package/lean/ddns-scripts_aliyun
rm -rf ./package/lean/ddns-scripts_dnspod
svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_aliyun package/lean/ddns-scripts_aliyun
svn co https://github.com/sirpdboy/build/trunk/ddns-scripts_dnspod package/lean/ddns-scripts_dnspod

# rm -rf ./feeds/luci/applications/luci-app-zerotier
# rm -rf ./feeds/packages/net/zerotier
sed -i '/45)./d' ./feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua  #zerotier
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua   #zerotier
sed -i 's/vpn/services/g' ./feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm   #zerotier
rm -rf ./package/build/luci-app-zerotier
rm -rf ./package/build/zerotier

rm -rf ./feeds/luci/applications/luci-app-baidupcs-web && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-baidupcs-web ./feeds/luci/applications/luci-app-baidupcs-web
# ksmbd
rm -rf ./feeds/packages/net/ksmbd-tools && svn co https://github.com/sirpdboy/build/trunk/ksmbd-tools ./feeds/packages/net/ksmbd-tools
rm -rf ./feeds/luci/applications/luci-app-samba 
svn co https://github.com/sirpdboy/build/trunk/luci-app-samba ./feeds/luci/applications/luci-app-samba
rm -rf ./package/network/services/samba36 
svn co https://github.com/sirpdboy/build/trunk/samba36 ./package/network/services/samba36
rm -rf ./package/build/samba4
# rm -rf ./package/lean/samba4
# rm -rf ./feeds/package/net/samba4 && svn co https://github.com/sirpdboy/build/trunk/samba4 ./feeds/package/net/samba4
rm -rf ./feeds/luci/applications/luci-app-samba4

# Boost 通用即插即用
# curl -fsSL https://raw.githubusercontent.com/loso3000/other/master/patch/autocore/files/x86/index.htm > package/lean/autocore/files/x86/index.htm
# curl -fsSL https://raw.githubusercontent.com/loso3000/other/master/patch/autocore/files/arm/index.htm > package/lean/autocore/files/arm/index.htm
# curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/build/default-settings/files/zzz-default-settings
# curl -fsSL  https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
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
sed -i 's/invalid/# invalid/g' ./feeds/packages/net/samba4/files/smb.conf.template   #共享问题
sed -i 's/only = yes/only = no/g' ./feeds/packages/net/samba4/files/smb.conf.template   #共享问题
sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误

sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
sed -i 's/请输入用户名和密码。/欢迎使用!请输入用户密码~/g' ./feeds/luci/modules/luci-base/po/zh-cn/base.po   #用户名密码
echo '灰色歌曲'
rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/diy/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua


#修正nat回流 
cat ./package/build/set/sysctl.conf >>  package/base-files/files/etc/sysctl.conf
#修正连接数 
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# 最大连接数
sed -i 's/65535/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf
# ipv6
# # sed -i "s/6.ifname='$ifname'/6.ifname='@wan'/g" package/base-files/files/bin/config_generate
# sed -i "s/6.ifname='@${1}'/6.ifname='@wan'/g" package/base-files/files/bin/config_generate

#docker err
#rm -rf ./feeds/packages/utils/runc/Makefile
#svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile

#echo "防掉线"
# INTERFACE='$INTERFACE'
# INTERFACE...='$INTERFACE...'
# LOG='$LOG'
# sed -i "88a\		ifdown $INTERFACE" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3
# sed -i "89a\		sleep 3" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3
# sed -i "90a\		ifup $INTERFACE" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3
# sed -i "91a\		$LOG notice \"Recycled $INTERFACE...\"" feeds/packages/net/mwan3/files/etc/hotplug.d/iface/15-mwan3

#echo "其他修改"
#sed -i 's/option commit_interval 24h/option commit_interval 10m/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为10分钟
#sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
#sed -i 's@interval: 5@interval: 1@g' package/lean/luci-app-wrtbwmon/htdocs/luci-static/wrtbwmon.js #wrtbwmon默认刷新时间更改为1秒


# echo '默认开启 Irqbalance'
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

cat ./package/build/profile > package/base-files/files/etc/profile

# Boost 通用即插即用
# rm -rf feeds/packages/libs/boost && svn co https://github.com/openwrt/packages/trunk/libs/boost feeds/packages/libs/boost
# 全能推送
rm -rf ./feeds/luci/applications/luci-app-pushbot && \
git clone https://github.com/zzsj0928/luci-app-pushbot ./feeds/luci/applications/luci-app-pushbot
rm -rf ./feeds/luci/applications/luci-app-jd-dailybonus && \
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus ./feeds/luci/applications/luci-app-jd-dailybonus
# 京东签到 By Jerrykuku
# sed -i 's/wget-ssl/wget/g' package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/newapp.sh package/lean/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua
# rm -rf ./package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/JD_DailyBonus.js
# wget -P ./package/lean/luci-app-jd-dailybonus/root/usr/share/jd-dailybonus/ https://github.com/NobyDa/Script/raw/master/JD-DailyBonus/JD_DailyBonus.js
rm -rf ./feeds/luci/applications/luci-app-serverchan && \
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan ./feeds/luci/applications/luci-app-serverchan

git clone https://github.com/kiddin9/luci-app-dnsfilter package/luci-app-dnsfilter
# git clone https://github.com/tuanqing/install-program package/install-program

echo '替换aria2'
rm -rf feeds/luci/applications/luci-app-aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-aria2 feeds/luci/applications/luci-app-aria2
rm -rf feeds/packages/net/aria2 && \
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/net/aria2 feeds/packages/net/aria2

# echo 'amule'
# git clone https://github.com/MatteoRagni/AmuleWebUI-Reloaded files/usr/share/amule/webserver/AmuleWebUI-Reloaded
# sed -i 's/runasuser "$config_dir"/runasuser "$config_dir"\nwget -P "$config_dir" -O "$config_dir\/nodes.dat" http:\/\/upd.emule-security.org\/nodes.dat/g' package/lean/luci-app-amule/root/etc/init.d/amule
# sed -i "s/tb.innerHTML = '<em>/tb.innerHTML = '<em><b><font color=red>/g" package/lean/luci-app-amule/luasrc/view/amule/overview_status.htm
# sed -i "s/var links = '<em>/var links = '<em><b><font color=green>/g" package/lean/luci-app-amule/luasrc/view/amule/overview_status.htm
# rm -rf package/lean/antileech/src/* && \
# git clone https://github.com/persmule/amule-dlp.antiLeech package/lean/antileech/src

# svn co https://github.com/small-5/luci-app-adblock-plus/trunk/ ./package/diy/luci-app-adblock-plus

#sed -i 's,kmod-r8169,kmod-r8168,g' target/linux/x86/image/64.mk

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
CONFIG_DRM=y
CONFIG_DRM_I915=y
' >> ./target/linux/x86/config-5.4

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
CONFIG_DRM=y
CONFIG_DRM_I915=y
' >> ./target/linux/x86/config-5.10

echo '
CONFIG_CRYPTO_CHACHA20_X86_64=y
CONFIG_CRYPTO_POLY1305_X86_64=y
CONFIG_DRM=y
CONFIG_DRM_I915=y
' >> ./target/linux/x86/config-5.15

svn co https://github.com/QiuSimons/openwrt-mos/trunk/mosdns package/new/mosdns
svn co https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns package/new/luci-app-mosdns

sed -i "/filter_aaaa='1'/d" package/new/luci-app-mosdns/root/etc/init.d/mosdns


git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's,1).dep,11).dep,g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua  #koolproxy

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash ./package/diy/luci-app-openclash

git clone -b master --single-branch https://github.com/destan19/OpenAppFilter ./package/diy/OpenAppFilter
# 花生壳内网穿透
# svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
# svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/phtunnel package/new/phtunnel
# svn co https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
# svn co https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/phtunnel package/new/phtunnel
# svn co https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-oray package/new/luci-app-oray

# Passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/passwall/luci-app-passwall
sed -i 's,default n,default y,g' package/passwall/luci-app-passwall/Makefile

echo ' ShadowsocksR Plus+'
# git clone https://github.com/fw876/helloworld package/ssr
# svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus ./package/ssr/luci-app-ssr-plus
# cp -f ./package/build/set/myip.htm ./package/ssr/luci-app-ssr-plus/luasrc/view/shadowsocksr/myip.htm
# sed -i '/status/am:section(SimpleSection).template = "shadowsocksr/myip"' ./package/lean/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client.lua

# sed -i 's,default n,default y,g' ./package/ssr/luci-app-ssr-plus/Makefile 

# rm -rf ./package/build/pass/luci-app-ssr-plus
cat  ./package/build/set/Makefile   >./package/build/pass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' ./package/build/pass/luci-app-bypass/Makefile

rm -rf package/build/pass/luci-app-bypass
git clone https://github.com/kiddin9/openwrt-bypass package/bypass
sed -i 's,default n,default y,g' ./package/bypass/luci-app-bypass/Makefile

# VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk/  ./package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
# git clone -b master --depth 1 https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
sed -i 's,default n,default y,g' ./package/lean/luci-app-vssr/Makefile
#sed -i '/result.encrypt_method/a\result.fast_open = "1"' package/lean/luci-app-vssr/root/usr/share/vssr/subscribe.lua
#sed -i 's,ispip.clang.cn/all_cn.txt,raw.sevencdn.com/QiuSimons/Chnroute/master/dist/chnroute/chnroute.txt,g' package/lean/luci-app-vssr/luasrc/controller/vssr.lua
#sed -i 's,ispip.clang.cn/all_cn.txt,raw.sevencdn.com/QiuSimons/Chnroute/master/dist/chnroute/chnroute.txt,g' package/lean/luci-app-vssr/root/usr/share/vssr/update.lua


# svn co https://github.com/jerrykuku/luci-app-ttnode/trunk/  package/diy/luci-app-ttnode
# sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile  #无效
# sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/rockchip/Makefile
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile

# sed -i "/mediaurlbase/d" package/*/luci-theme*/root/etc/uci-defaults/*
# sed -i "/mediaurlbase/d" feed/*/luci-theme*/root/etc/uci-defaults/*
# 使用默认取消自动
# sed -i "s/bootstrap/chuqitopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i 's/bootstrap/chuqitopd/g' feeds/luci/collections/luci/Makefile
echo "修改默认主题"
sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i "s/bootstrap/opentopd/g" feeds/luci/modules/luci-base/root/etc/config/luci
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

rm -rf ./package/diy/luci-theme-edge
rm -rf ./package/build/luci-theme-darkmatter

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial_new package/lean/luci-theme-atmaterial_new
git clone https://github.com/john-shine/luci-theme-darkmatter.git package/diy/darkmatter
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon
git clone -b 18.06  https://github.com/kiddin9/luci-theme-edge.git package/new/luci-theme-edge

# R8168驱动
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8188eu package/new/rtl8188eu
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8189es package/new/rtl8189es
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8192du package/new/rtl8192du
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8812au-ct package/new/rtl8812au-ct
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8812au-ac package/new/rtl8812au-ac
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl8821cu package/new/rtl8821cu
# svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/kernel/rtl88x2bu package/new/rtl88x2bu

# Add extra wireless drivers
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8821cu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8188eu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8192du
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl88x2bu

#luci-app-filebrowser
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-filebrowser ./feeds/luci/applications/
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/filebrowser ./feeds/packages/net/

# git clone https://github.com/openwrt-dev/po2lmo.git
# cd po2lmo
# make && sudo make install


# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust:/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/Rust:/d' package/ssr/luci-app-ssr-plus/Makefile
sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile
sed -i '/Rust:/d' ./package/build/pass/luci-app-bypass/Makefile
sed -i '/Rust:/d' ./package/build/pass/luci-ssr-plus/Makefile
### 最后的收尾工作 ###
# Lets  
# mkdir ./package/base-files/files/usr/bin 
# cp -f ./package/build/set/chinadnslist ./package/base-files/files/usr/bin/chinadnslist
# find ./ -name *.orig | xargs rm -f
# find ./ -name *.rej | xargs rm -f

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
# Mod zzz-default-settings

# sed -i '/http/d' package/build/default-settings/files/zzz-default-settings
# sed -i '/openwrt_luci/d' package/build/default-settings/files/zzz-default-settings

# Fix SDK
# sed -i '/$(SDK_BUILD_DIR)\/$(STAGING_SUBDIR_HOST)\/usr\/bin/d;/LICENSE/d' ./target/sdk/Makefile

# Disable opkg signature check
# sed -i 's/option check_signature/# option check_signature/g' /etc/opkg.conf
# Add execute permission for ipv6-helper
# chmod +x /bin/ipv6-helper

# echo '默认开启 Irqbalance'
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
# str1=`grep "KERNEL_PATCHVER:="  ./Makefile | cut -d = -f 2` 
ver1=`grep "KERNEL_PATCHVER:="  target/linux/x86/Makefile | cut -d = -f 2` #判断当前默认内核版本号如5.10
export VER2="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"

date1='Ipv6-S'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
# date1='Ipv6-S2022.02.01'

if [ "$VER2" = "5.4" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-5.4-/g' include/image.mk
elif [ "$VER2" = "5.10" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-5.10-/g' include/image.mk
elif [ "$VER2" = "5.15" ]; then
    sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-5.15-/g' include/image.mk
fi
# sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220201-Ipv6-${str1}-/g' include/image.mk
echo "DISTRIB_REVISION='${date1} by Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' by Sirpdboy ' >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner
# sed -i '/root:/d' ./package/base-files/files/etc/shadow
# sed -i 's/root::0:0:99999:7:::/root:$1$g9j2tj.v$w0Bg75cJu0mlJLcg2xoAk.:18870:0:99999:7:::/g' ./package/base-files/files/etc/shadow   #chuqi
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' ./package/base-files/files/etc/shadow    #password

# sed -i "s/hostname='OpenWrt'/hostname=${HOSTNAME}/g" package/base-files/files/bin/config_generate
# sed -i 's/192.168.1.1/${IPADDRESS}/g' package/base-files/files/bin/config_generate

# Modify default WiFi SSID
# sed -i "s/set wireless.default_radio\${devidx}.ssid=OpenWrt/set wireless.default_radio\${devidx}.ssid='$SSID'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default WiFi Encryption
# sed -i "s/set wireless.default_radio\${devidx}.encryption=none/set wireless.default_radio\${devidx}.encryption='$ENCRYPTION'/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Modify default WiFi Key
# sed -i "/set wireless.default_radio\${devidx}.mode=ap/a\                        set wireless.default_radio\${devidx}.key='$KEY'" package/kernel/mac80211/files/lib/wifi/mac80211.sh
# Forced WiFi to enable
# sed -i 's/set wireless.radio\${devidx}.disabled=1/set wireless.radio\${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#内核设置 甜糖
# cat ./package/build/set/Config-kernel.in   > ./config/Config-kernel.in
# echo  'CONFIG_BINFMT_MISC=y' >> ./package/target/linux/x86/config-5.10
# sed -i '/CONFIG_NVME_MULTIPATH /d' ./package/target/linux/x86/config-5.4
# sed -i '/CONFIG_NVME_TCP /d' ./package/target/linux/x86/config-5.4
# echo  'CONFIG_EXTRA_FIRMWARE="i915/kbl_dmc_ver1_04.bin"'   >> ./package/target/linux/x86/config-5.10
# echo  'CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"'  >> ./package/target/linux/x86/config-5.10
# echo  'CONFIG_NVME_FABRICS=y'  >> ./package/target/linux/x86/config-5.4
# echo  'CONFIG_NVME_FC=y' >> ./package/target/linux/x86/config-5.4
# echo  'CONFIG_NVME_MULTIPATH=y' >> ./package/target/linux/x86/config-5.4
# echo  'CONFIG_NVME_TCP=y' >> ./package/target/linux/x86/config-5.4

# find target/linux -path "target/linux/*/config-*" | xargs -i sed -i '$a CONFIG_ACPI=y\nCONFIG_X86_ACPI_CPUFREQ=y\n \
# CONFIG_NR_CPUS=128\nCONFIG_FAT_DEFAULT_IOCHARSET="utf8"\nCONFIG_CRYPTO_CHACHA20_NEON=y\nCONFIG_CRYPTO_CHACHA20POLY1305=y\nCONFIG_BINFMT_MISC=y' {}
# for X in $(ls -1 target/linux/x86 | grep "config-"); do echo -e "\n$(cat ./package/build/DRM-I915)" >> target/linux/x86/${X}; done
# sed -i "/dns_caching_dns/d" $(PKG_Finder d package luci-app-turboacc)/root/etc/config/turboacc
# echo "	option dns_caching_dns '223.5.5.5,114.114.114.114'" >> $(PKG_Finder d package luci-app-turboacc)/root/etc/config/turboacc

sed -i 's/+"), 10)/+"), 0)/g' ./package/ssr/luci-app-ssr-plus//luasrc/controller/shadowsocksr.lua  #shadowsocksr
sed -i 's/+"), 10)/+"), 0)/g' ./package/lean/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua  #shadowsocksr
# sed -i 's/h"), 50)/h"), 8)/g' ./package/diy/luci-app-openclash/luasrc/controller/openclash.lua   #openclash
sed -i 's/+"),1)/+"),11)/g' ./package/diy/luci-app-adblock-plus/luasrc/controller/adblock.lua   #adblock
sed -i 's/),9)/),12)/g' ./package/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua   #dnsfilter
./scripts/feeds update -i
