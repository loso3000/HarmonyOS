#!/bin/bash

# private gitea
gitea=git.cooluc.com
github="github.com"
auth="sirpdboy/openwrt"
mirror=https://init.cooluc.com

is_vip() {
case "${CONFIG_S}" in
     "Vip"*) return 0 ;;
     *) return 1 ;;
esac
}
# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

#安装和更新软件包
UPDATE_PACKAGE() {
	local PKG_NAME=$1
	local PKG_REPO=$2
	local PKG_BRANCH=$3
	local PKG_SPECIAL=$4
	local CUSTOM_NAMES=($5)  # 第5个参数为自定义名称列表
	local REPO_NAME=$(echo $PKG_REPO | cut -d '/' -f 2)

	echo " "

	# 将 PKG_NAME 加入到需要查找的名称列表中
	if [ ${#CUSTOM_NAMES[@]} -gt 0 ]; then
		CUSTOM_NAMES=("$PKG_NAME" "${CUSTOM_NAMES[@]}")  # 将 PKG_NAME 添加到自定义名称列表的开头
	else
		CUSTOM_NAMES=("$PKG_NAME")  # 如果没有自定义名称，则只使用 PKG_NAME
	fi

	# 删除本地可能存在的不同名称的软件包
	for NAME in "${CUSTOM_NAMES[@]}"; do
		# 查找匹配的目录
		echo "Searching directory: $NAME"
		local FOUND_DIRS=$(find ../feeds/luci/ ../feeds/packages/ -maxdepth 3 -type d -iname "*$NAME*" 2>/dev/null)

		# 删除找到的目录
		if [ -n "$FOUND_DIRS" ]; then
			echo "$FOUND_DIRS" | while read -r DIR; do
				rm -rf "$DIR"
				echo "Deleted directory: $DIR"
			done
		else
			echo "No directories found matching name: $NAME"
		fi
	done

	# 克隆 GitHub 仓库
	git clone --depth=1 --single-branch --branch $PKG_BRANCH "https://github.com/$PKG_REPO.git"

	# 处理克隆的仓库
	if [[ $PKG_SPECIAL == "pkg" ]]; then
		find ./$REPO_NAME/*/ -maxdepth 3 -type d -iname "*$PKG_NAME*" -prune -exec cp -rf {} ./ \;
		rm -rf ./$REPO_NAME/
	elif [[ $PKG_SPECIAL == "name" ]]; then
		mv -f $REPO_NAME $PKG_NAME
	fi
}

#更新软件包版本
UPDATE_VERSION() {
	local PKG_NAME=$1
	local PKG_MARK=${2:-not}
	local PKG_FILES=$(find ./ ../feeds/packages/ -maxdepth 3 -type f -wholename "*/$PKG_NAME/Makefile")

	echo " "

	if [ -z "$PKG_FILES" ]; then
		echo "$PKG_NAME not found!"
		return
	fi

	echo "$PKG_NAME version update has started!"

	for PKG_FILE in $PKG_FILES; do
		local PKG_REPO=$(grep -Pho 'PKG_SOURCE_URL:=https://.*github.com/\K[^/]+/[^/]+(?=.*)' $PKG_FILE | head -n 1)
		local PKG_VER=$(curl -sL "https://api.github.com/repos/$PKG_REPO/releases" | jq -r "map(select(.prerelease|$PKG_MARK)) | first | .tag_name")
		local NEW_VER=$(echo $PKG_VER | sed "s/.*v//g; s/_/./g")
		local NEW_HASH=$(curl -sL "https://codeload.github.com/$PKG_REPO/tar.gz/$PKG_VER" | sha256sum | cut -b -64)
		local OLD_VER=$(grep -Po "PKG_VERSION:=\K.*" "$PKG_FILE")

		echo "$OLD_VER $PKG_VER $NEW_VER $NEW_HASH"

		if [[ $NEW_VER =~ ^[0-9].* ]] && dpkg --compare-versions "$OLD_VER" lt "$NEW_VER"; then
			sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=$NEW_VER/g" "$PKG_FILE"
			sed -i "s/PKG_HASH:=.*/PKG_HASH:=$NEW_HASH/g" "$PKG_FILE"
			echo "$PKG_FILE version has been updated!"
		else
			echo "$PKG_FILE version is already the latest!"
		fi
	done
}

[ ! -d files/root ] || mkdir -p files/root
[ ! -d files/etc/opkg ] || mkdir -p files/etc/opkg
mkdir -p files/usr/share
mkdir -p ./package/emortal

[[ -n $TARGET_DEVICE ]] || TARGET_DEVICE="x86_64"
[[ -n $CONFIG_S ]] || CONFIG_S=Vip-Super
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/packages/net/mentohust
rm -rf  ./feeds/luci/applications/luci-app-arpbind
#rm -rf  ./feeds/packages/net/wget

rm -rf  ./feeds/packages/net/zsh
rm -rf  ./feeds/packages/net/homebox
rm -rf  ./feeds/packages/net/naiveproxy
# 修复 hostapd 报错
# cp -f diyx/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 清理
# Add luci-app-passwall
# git clone --depth=1 https://$github/xiaorouji/openwrt-passwall-packages  ./package/openwrt-passwall
git clone --depth=1 https://$github/xiaorouji/openwrt-passwall2 ./package/passwall2
git clone --depth=1 https://$github/xiaorouji/openwrt-passwall ./package/passwall

# rm -rf ./package/passwall2/luci-app-passwall2/htdocs/luci-static/resources/

# 移除 openwrt feeds 自带的核心库
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box,pdnsd-alt,chinadns-ng,dns2socks,dns2tcp,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview}

git clone https://$github/sbwml/openwrt_helloworld  ./package/ssr
rm -rf ./package/ssr/luci-app-ssr-plus
rm -rf ./package/ssr/luci-app-passwall
rm -rf ./package/ssr/luci-app-passwall2

rm -rf ./package/ssr/mosdns
rm -rf ./package/ssr/trojan-plus
# rm -rf ./package/ssr/xray-core
# rm -rf ./package/ssr/xray-plugin
# rm -rf ./package/ssr/naiveproxy
# rm -rf ./package/ssr/v2ray-plugin
# rm -rf ./package/ssr/v2ray-core
# rm -rf ./package/ssr/pdnsd
# rm -rf ./package/ssr/lua-neturl
# rm -rf ./package/ssr/redsocks2
# rm -rf ./package/ssr/shadow-tls

rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/trojan-plus

rm -rf ./package/openwrt-passwall/xray-core
rm -rf ./package/openwrt-passwall/xray-plugin
rm -rf ./package/openwrt-passwall/mosdns
rm -rf ./package/openwrt-passwall/naiveproxy

git clone https://$github/loso3000/other ./package/add

#rm -rf  ./feeds/packages/net/adguardhome
rm -rf ./feeds/luci/applications/luci-app-adguardhome

rm -rf ./feeds/luci/applications/luci-app-filetransfer
rm -rf ./feeds/luci/applications/luci-app-fileassistant
rm -rf ./feeds/luci/applications/luci-app-msd_lite
rm -rf ./feeds/luci/applications/luci-app-wolplus
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon

rm -rf ./feeds/luci/applications/luci-app-udpxy
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/luci/applications/luci-app-passwall2

rm -rf  ./feeds/packages/net/wrtbwmon
rm -rf  ./feeds/packages/net/lucky
rm -rf  ./feeds/packages/net/ddns-go

#istore
rm -rf  ./feeds/jjm2473_apps/homebox
rm -rf  ./feeds/jjm2473_apps/luci-app-homebox
rm -rf  ./feeds/third_party/luci-app-LingTiGameAcc
rm -rf  ./feeds/third_party/luci-app-arpbind
rm -rf  ./feeds/third_party/luci-app-fileassistant
rm -rf  ./feeds/third_party/luci-app-smartdns
rm -rf  ./feeds/third_party/luci-app-socat
rm -rf  ./feeds/third_party/smartdns
rm -rf  ./feeds/third_party/luci-app-netdata
rm -rf ./feeds/openwrt-third/luci-app-netdata
rm -rf ./feeds/openwrt-third/smartdns
rm -rf  ./feeds/packages/ariang
rm -rf  ./feeds/packages/webui-aria2

# rm -rf ./feeds/luci/applications/luci-app-smartdns
# rm -rf  ./feeds/packages/net/smartdns

# rm -rf ./package/add/luci-app-mwan3 ./package/add/mwan3
# rm -rf ./feeds/luci/applications/luci-app-mwan3
rm -rf ./feeds/packages/net/mwan3
mv ./package/add/up/tool/mwan3 ./feeds/packages/net/mwan3

# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
sed -i '/Rust:/d' ./package/add/up/pass/luci-app-bypass/Makefile

#修正nat回流 
cat ./package/add/patch/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
cat ./package/add/patch/banner > ./package/base-files/files/etc/banner
cat ./package/add/patch/profile > ./package/base-files/files/etc/profile

rm -rf ./feeds/luci/applications/luci-app-udpxy
rm -rf ./feeds/luci/applications/luci-app-msd_lite
rm -rf  ./feeds/packages/net/msd_lite

rm -rf ./feeds/luci/applications/luci-app-beardropper

rm -rf ./feeds/luci/applications/luci-app-p910nd
#easytier 
git clone  https://github.com/EasyTier/luci-app-easytier ./package/luci-app-easytier
#net eth0
rm -rf ./target/linux/x86/base-files/etc/board.d/99-default_network
rm -rf ./target/linux/x86/base-files/etc/board.d/99-virtualbox_network
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/board.d/99-default_network > ./target/linux/x86/base-files/etc/board.d/99-default_network
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/board.d/02_network > ./target/linux/x86/base-files/etc/board.d/02_network

rm -rf ./package/emortal/autocore ./package/emortal/automount  ./package/emortal/autosamba  ./package/emortal/default-settings 
rm -rf ./package/lean/autocore ./package/lean/automount  ./package/lean/autosamba  ./package/lean/default-settings 
rm -rf ./package/lean/autosamba
rm -rf  package/emortal/autosamba

rm -rf  package/emortal/automount
rm -rf ./package/lean/automount

rm -rf ./package/lean/default-settings
rm -rf  package/emortal/default-settings

#  coremark
sed -i '/echo/d' ./feeds/packages/utils/coremark/coremark
rm -rf ./feeds/packages/net/lucky
rm -rf  ./feeds/luci/applications/luci-app-lucky
git clone https://github.com/sirpdboy/luci-app-lucky ./package/lucky
# git clone https://github.com/gdy666/luci-app-lucky ./package/lucky
rm -rf ./feeds/packages/net/ddns-go
rm -rf  ./feeds/luci/applications/luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go ./package/ddns-go

git clone https://github.com/sirpdboy/netspeedtest ./package/netspeedtest

rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/packages/net/mentohust
rm -rf  ./feeds/luci/applications/luci-app-arpbind
rm -rf  ./feeds/packages/net/oaf
#rm -rf  ./feeds/packages/net/wget
#oaf 
rm -rf ./feeds/luci/applications/luci-app-appfilter
rm -rf ./feeds/luci/applications/luci-app-filter
rm -rf ./feeds/luci/applications/luci-app-oaf
rm -rf ./feeds/packages/net/open-app-filter
rm -rf  ./feeds/packages/net/oaf
# rm -rf ./package/add/up/tool/OpenAppFilter
# git clone https://github.com/destan19/OpenAppFilter.git ./package/OpenAppFilter
# qbittorrent
#qbittorrent
rm -rf ./feeds/packages/net/qbittorrent
rm -rf ./feeds/packages/net/qBittorrent-Enhanced-Edition
rm -rf ./feeds/packages/net/qBittorrent-static
rm -rf ./feeds/luci/applications/luci-app-qbittorrent  package/feeds/packages/luci-app-qbittorrent
rm -rf ./feeds/luci/applications/luci-app-qbittorrent
rm -rf ./feeds/packages/net/qBittorrent
rm -rf ./feeds/packages/libs/rblibtorrent

# git clone --depth=1 https://github.com/sbwml/luci-app-qbittorrent  package/luci-app-qbittorrent

# nlbwmon
sed -i 's/524288/16777216/g' feeds/packages/net/nlbwmon/files/nlbwmon.config
# 可以设置汉字名字
# sed -i '/o.datatype = "hostname"/d' feeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/system.lua
# sed -i '/= "hostname"/d' /usr/lib/lua/luci/model/cbi/admin_system/system.lua

# alist
# rm -rf feeds/packages/net/alist feeds/luci/applications/luci-app-alist
# git clone https://$github/sbwml/openwrt-alist package/new/alist


# Add ddnsto & linkease
 git clone  https://$github/linkease/nas-packages-luci ./package/nas-packages-luci
 git clone  https://$github/linkease/nas-packages ./package/nas-packages
 git clone  https://$github/linkease/istore ./package/istore
sed -i 's/1/0/g' ./package/nas-packages/network/services/linkease/files/linkease.config
sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci/luci-app-store/Makefile

rm -rf ./feeds/packages/utils/v2dat
rm -rf ./feeds/packages/net/mosdns
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/v2ray-geodata
git clone https://$github/sbwml/luci-app-mosdns -b v5 package/mosdns
#git clone https://github.com/sbwml/luci-app-mosdns -b v5-lua package/mosdns
git clone https://$github/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://$github/sbwml/v2ray-geodata feeds/packages/net/v2ray-geodata

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# luci-compat - fix translation
sed -i 's/<%:Up%>/<%:Move up%>/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/tblsection.htm
sed -i 's/<%:Down%>/<%:Move down%>/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/tblsection.htm

# frpc translation
sed -i 's,发送,Transmission,g' feeds/luci/applications/luci-app-transmission/po/zh_Hans/transmission.po
sed -i 's,frp 服务器,FRP 服务器,g' feeds/luci/applications/luci-app-frps/po/zh_Hans/frps.po
sed -i 's,frp 客户端,FRP 客户端,g' feeds/luci/applications/luci-app-frpc/po/zh_Hans/frpc.po
# luci-app-filemanager
rm -rf feeds/luci/applications/luci-app-filemanager
git clone https://$github/sbwml/luci-app-filemanager package/new/luci-app-filemanager


# TTYD
sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
sed -i '3 a\\t\t"order": 50,' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
sed -i 's/procd_set_param stdout 1/procd_set_param stdout 0/g' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's/procd_set_param stderr 1/procd_set_param stderr 0/g' feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's|/bin/login|/bin/login -f root|' ./feeds/packages/utils/ttyd/files/ttyd.config
# sed -i "/listen_https/ {s/^/#/g}" ./package/*/*/*/files/uhttpd.config

pushd feeds/luci
    # curl -s https://git.kejizero.online/zhao/files/raw/branch/main/patch/luci/0001-luci-mod-status-firewall-disable-legacy-firewall-rul.patch | patch -p1
    # curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/0001-luci-mod-status-firewall-disable-legacy-firewall-rul.patch | patch -p1
popd

# uwsgi
sed -i 's,procd_set_param stderr 1,procd_set_param stderr 0,g' feeds/packages/net/uwsgi/files/uwsgi.init
sed -i 's,buffer-size = 10000,buffer-size = 131072,g' feeds/packages/net/uwsgi/files-luci-support/luci-webui.ini
sed -i 's,logger = luci,#logger = luci,g' feeds/packages/net/uwsgi/files-luci-support/luci-webui.ini
sed -i '$a cgi-timeout = 600' feeds/packages/net/uwsgi/files-luci-support/luci-*.ini
sed -i 's/threads = 1/threads = 2/g' feeds/packages/net/uwsgi/files-luci-support/luci-webui.ini
sed -i 's/processes = 3/processes = 4/g' feeds/packages/net/uwsgi/files-luci-support/luci-webui.ini
sed -i 's/cheaper = 1/cheaper = 2/g' feeds/packages/net/uwsgi/files-luci-support/luci-webui.ini

# UPnP
rm -rf ./package/add/up/upnpfw4
# rm -rf feeds/{packages/net/miniupnpd,luci/applications/luci-app-upnp}
# git clone https://$gitea/sbwml/miniupnpd feeds/packages/net/miniupnpd -b v2.3.7
# git clone https://$gitea/sbwml/luci-app-upnp feeds/luci/applications/luci-app-upnp -b main

# 精简 UPnP 菜单名称
# sed -i 's#\"title\": \"UPnP IGD \& PCP\"#\"title\": \"UPnP\"#g' feeds/luci/applications/luci-app-upnp/root/usr/share/luci/menu.d/luci-app-upnp.json

# luci
pushd feeds/luci
    # curl -s https://git.kejizero.online/zhao/files/raw/branch/main/patch/luci/0001-luci-mod-status-firewall-disable-legacy-firewall-rul.patch | patch -p1
    curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/luci/0001-luci-mod-system-add-modal-overlay-dialog-to-reboot.patch | patch -p1  #reboot
    # curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/luci/0002-luci-mod-status-firewall-disable-legacy-firewall-rul2410.patch | patch -p1   #nftable2410
    # curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/luci/0003-luci-mod-status-storage-index-applicable-only-to-val.patch | patch -p1  #storeage
    curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/luci/0003-luci-mod-status-storage-index-applicable-only-to-val-storage2305.patch | patch -p1  #storeage2305lean
    curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/luci/0004-luci-luci-app-upnp-ipurl-upnp2305.patch | patch -p1  #upnp2305lean
popd

# Luci diagnostics.js
# sed -i "s/openwrt.org/www.qq.com/g" feeds/luci/modules/luci-mod-network/htdocs/luci-static/resources/view/network/diagnostics.js
# 修正部分从第三方仓库拉取的软件 Makefile 路径问题
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

# ppp - 2.5.0
# rm -rf package/network/services/ppp
# git clone https://github.com/sbwml/package_network_services_ppp package/network/services/ppp

# samba4
rm -rf feeds/packages/net/samba4
git clone https://github.com/sbwml/feeds_packages_net_samba4 feeds/packages/net/samba4
# enable multi-channel
sed -i '/workgroup/a \\n\t## enable multi-channel' feeds/packages/net/samba4/files/smb.conf.template
sed -i '/enable multi-channel/a \\tserver multi channel support = yes' feeds/packages/net/samba4/files/smb.conf.template
sed -i 's/#aio read size = 0/aio read size = 1/g' feeds/packages/net/samba4/files/smb.conf.template
sed -i 's/#aio write size = 0/aio write size = 1/g' feeds/packages/net/samba4/files/smb.conf.template

# 取消一些预选的软件包
sed -i 's/luci-app-vsftpd //g' include/target.mk
sed -i 's/luci-app-ssr-plus //g' include/target.mk
sed -i 's/luci-app-vlmcsd //g' include/target.mk
sed -i 's/luci-app-accesscontrol //g' include/target.mk
sed -i 's/luci-app-nlbwmon //g' include/target.mk
sed -i 's/luci-app-turboacc //g' include/target.mk


# default LAN IP
#sed -i "s/192.168.1.1/192.168.10.1/g" package/base-files/files/bin/config_generate
#sed -i "s/192.168.1.1/192.168.10.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")  || true


#修改默认主机名
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.10.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
#Imm
sed -i "s/ImmortalWrt/EzOpWrt/" {./package/base-files/files/bin/config_generate,include/version.mk} || true
sed -i "s/OpenWrt/EzOpWrt/" {./package/base-files/files/bin/config_generate,include/version.mk} || true
sed -i "s/192.168.1.1/192.168.10.1/" {./package/base-files/files/bin/config_generate,include/version.mk} || true
#LEDE
sed -i "s/192.168.1.1/192.168.10.1/" {package/base-files/luci2/bin/config_generate,include/version.mk} || true
sed -i "s/LEDE/EzOpWrt/" {package/base-files/luci2/bin/config_generate,include/version.mk} || true

# netdata 
rm -rf  ./feeds/luci/applications/luci-app-netdata
rm -rf ./feeds/luci/applications/luci-app-netdata package/feeds/packages/luci-app-netdata

rm -rf ./feeds/luci/applications/luci-app-arpbind


# Add luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-dockerman
# rm -rf ./feeds/luci/applications/luci-app-docker
# rm -rf ./feeds/luci/collections/luci-lib-docker
# mv ./package/add/add/up/docker/docker ./feeds/packages/utils/docker
# mv ./package/add/add/up/docker/dockerd  ./feeds/packages/utils/dockerd 
# mv ./package/add/add/up/docker/docker-compose ./feeds/packages/utils/docker-compose
# sed -i '/sysctl.d/d' feeds/packages/utils/dockerd/Makefile
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.10
# sed -i 's,# CONFIG_BLK_CGROUP_IOCOST is not set,CONFIG_BLK_CGROUP_IOCOST=y,g' target/linux/generic/config-5.15
# sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' ./package/new/luci-app-dockerman/Makefile
# sed -i '$i /etc/init.d/dockerd restart &' ./package/new/luci-app-dockerman/root/etc/uci-defaults/*

# Docker
rm -rf feeds/luci/applications/luci-app-dockerman
git clone https://git.kejizero.online/zhao/luci-app-dockerman feeds/luci/applications/luci-app-dockerman
rm -rf feeds/packages/utils/{docker,dockerd,containerd,runc}
git clone https://git.kejizero.online/zhao/packages_utils_docker feeds/packages/utils/docker
git clone https://git.kejizero.online/zhao/packages_utils_dockerd feeds/packages/utils/dockerd
git clone https://git.kejizero.online/zhao/packages_utils_containerd feeds/packages/utils/containerd
git clone https://git.kejizero.online/zhao/packages_utils_runc feeds/packages/utils/runc
sed -i '/sysctl.d/d' feeds/packages/utils/dockerd/Makefile
pushd feeds/packages
    curl -s https://raw.githubusercontent.com/oppen321/OpenWrt-Patch/refs/heads/kernel-6.6/docker/0001-dockerd-fix-bridge-network.patch | patch -p1
    curl -s https://raw.githubusercontent.com/oppen321/OpenWrt-Patch/refs/heads/kernel-6.6/docker/0002-docker-add-buildkit-experimental-support.patch | patch -p1
    curl -s https://raw.githubusercontent.com/oppen321/OpenWrt-Patch/refs/heads/kernel-6.6/docker/0003-dockerd-disable-ip6tables-for-bridge-network-by-defa.patch | patch -p1
popd

rm -rf ./package/add/up/docke

rm -rf ./feeds/luci/collections/luci-app-pptp-server
rm -rf ./feeds/luci/collections/luci-app-ipsec-server
rm -rf ./feeds/luci/collections/luci-app-softethervpn
rm -rf ./feeds/packages/net/softethervpn5 package/feeds/packages/softethervpn5

rm -rf ./feeds/luci/applications/luci-app-socat  ./package/feeds/luci/luci-app-socat
#sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' ./feeds/luci/applications/luci-app-socat/po/zh-cn/socat.po


sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"P910nd - 打印服务器"/"打印服务"/g' `grep "P910nd - 打印服务器" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/实时流量监测/流量/g'  `grep "实时流量监测" -rl ./`
sed -i 's/解锁网易云灰色歌曲/解锁灰色歌曲/g'  `grep "解锁网易云灰色歌曲" -rl ./`
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g'  `grep "解除网易云音乐播放限制" -rl ./`
sed -i 's/家庭云//g'  `grep "家庭云" -rl ./`
# echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题

#cifs挂pan
sed -i 's/mount -t cifs/busybox mount -t cifs/g' ./feeds/luci/applications/luci-app-cifs-mount/root/etc/init.d/cifs

#cifs
sed -i 's/nas/services/g' ./feeds/luci/applications/luci-app-cifs-mount/luasrc/controller/cifs.lua   #dnsfilter
sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题

echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题

rm -rf ./feeds/luci/applications/luci-app-unblockmusic
git clone https://$github/immortalwrt/luci-app-unblockneteasemusic.git  ./package/luci-app-unblockneteasemusic
sed -i 's/解除网易云音乐播放限制/解锁灰色歌曲/g' ./package/luci-app-unblockneteasemusic/luasrc/controller/unblockneteasemusic.lua

#断线重拨
sed -i 's/q reload/q restart/g' ./package/network/config/firewall/files/firewall.hotplug


# echo '默认开启 Irqbalance'
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://$github/BoringCat/luci-app-mentohust package/luci-app-mentohust
git clone --depth=1 https://$github/KyleRicardo/MentoHUST-OpenWrt-ipk package/MentoHUST-OpenWrt-ipk

# 全能推送
rm -rf ./feeds/luci/applications/luci-app-pushbot
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
rm -rf ./feeds/luci/applications/luci-app-wechatpush 
git clone https://$github/tty228/luci-app-wechatpush ./feeds/luci/applications/luci-app-wechatpush

git clone https://$github/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/, 1).d/, 11).d/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua

# Add OpenClash
rm -rf  ./feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://$github/vernesong/OpenClash package/openclash
# sed -i 's/+libcap /+libcap +libcap-bin /' package/openclash/luci-app-openclash/Makefile

# 使用默认取消自动
sed -i 's/+luci-theme-bootstrap/+luci-theme-kucat/g' feeds/luci/collections/luci/Makefile
# sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
# set default theme to argon
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase="/luci-static/kucat"' `find package -type f -path '*/default-settings/files/*-default-settings'`

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

sed -i '/check_signature/d' ./package/system/opkg/Makefile   # 删除IPK安装签名

rm -rf ./feeds/luci/applications/luci-theme-argon package/feeds/packages/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-argon package/feeds/packages/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-app-argon-config ./feeds/luci/applications/luci-theme-opentomcat ./feeds/luci/applications/luci-theme-ifit
rm -rf ./feeds/luci/applications/luci-theme-opentopd package/feeds/packages/luci-theme-opentopd
rm -rf ./feeds/luci/themes/luci-theme-design
 git clone -b js https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design
rm -rf ./feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon
# sed -i 's,media .. \"\/b,resource .. \"\/b,g' ./package/luci-theme-argon/luasrc/view/themes/argon/sysauth.htm
# sed -i 's,media .. \"\/b,resource .. \"\/b,g' ./feeds/luci/themes/luci-theme-argon/luasrc/view/themes/argon/sysauth.htm

# Remove some default packages
# sed -i 's/luci-app-ddns//g;s/luci-app-upnp//g;s/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
# sed -i 's/luci-app-adbyby-plus//g;s/luci-app-vsftpd//g;s/luci-app-ssr-plus//g;s/luci-app-unblockmusic//g;s/luci-app-vlmcsd//g;s/luci-app-wol//g;s/luci-app-nlbwmon//g;s/luci-app-accesscontrol//g' include/target.mk
#Add x550
git clone https://$github/shenlijun/openwrt-x550-nbase-t package/openwrt-x550-nbase-t
git clone https://$github/NateLol/luci-app-oled  package/luci-app-oled
sed -i "s/enable '0'/enable '1'/" `find package/ -follow -type f -path '*/luci-app-oled/root/etc/config/oled'`
 
# kernel:fix bios boot partition is under 1 MiB
# https://$github/WYC-2020/lede/commit/fe628c4680115b27f1b39ccb27d73ff0dfeecdc2
sed -i 's/256/1024/' target/linux/x86/image/Makefile

 config_file_turboacc=`find package/ -follow -type f -path '*/luci-app-turboacc/root/etc/config/turboacc'`
 sed -i "s/option hw_flow '1'/option hw_flow '0'/" $config_file_turboacc
 sed -i "s/option sfe_flow '1'/option sfe_flow '0'/" $config_file_turboacc
 sed -i "s/option sfe_bridge '1'/option sfe_bridge '0'/" $config_file_turboacc
 sed -i "/dep.*INCLUDE_.*=n/d" `find package/ -follow -type f -path '*/luci-app-turboacc/Makefile'`

sed -i "s/option limit_enable '1'/option limit_enable '0'/" `find package/ -follow -type f -path '*/nft-qos/files/nft-qos.config'`
sed -i "s/option enabled '1'/option enabled '0'/" `find package/ -follow -type f -path '*/vsftpd-alt/files/vsftpd.uci'`

sed -i 's/START=95/START=99/' `find package/ -follow -type f -path */ddns-scripts/files/ddns.init`

# 修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}

# sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/*/Makefile
# 风扇脚本
# sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
#wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://$github/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/etc/init.d/fa-rk3328-pwmfan
#wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://$github/friendlyarm/friendlywrt/raw/master-v19.07.1/target/linux/rockchip-rk3328/base-files/usr/bin/start-rk3328-pwm-fan.sh

# wget  -P feeds/packages/utils/tini/patches/ https://raw.githubusercontent.com/zxlhhyccc/packages/refs/heads/patch-5/utils/tini/patches/002-Support-POSIX-basename-from-musl-libc.patch
#curl -fsSL  https://raw.githubusercontent.com/zxlhhyccc/packages/refs/heads/patch-5/utils/tini/patches/002-Support-POSIX-basename-from-musl-libc.patch > ./feeds/packages/utils/tini/patches/002-Support-POSIX-basename-from-musl-libc.patch

# sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile

# echo '默认开启 Irqbalance'
if  [[ $TARGET_DEVICE == 'x86_64' ]] ;then
VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/x86/Makefile | cut -d = -f 2)"
CLASH="amd64"
else
VER1="$(grep "KERNEL_PATCHVER:="  ./target/linux/rockchip/Makefile | cut -d = -f 2)"
CLASH="arm64"
fi

if [[ $DATE_S == 'default' ]]; then
   # DATA=`TZ=UTC-8 date +%y%m%d%H%M -d +"12"hour`
   DATA=`TZ=UTC-8 date +%y%m%d%H%M`
else 
   DATA=$DATE_S
fi
# 预处理下载相关文件，保证打包固件不用单独下载
for sh_file in `ls ${GITHUB_WORKSPACE}/openwrt/package/add/common/*.sh`;do
    source $sh_file $CLASH
done
ver54=`grep "LINUX_VERSION-5.4 ="  include/kernel-5.4 | cut -d . -f 3`
ver515=`grep "LINUX_VERSION-5.15 ="  include/kernel-5.15 | cut -d . -f 3`
ver61=`grep "LINUX_VERSION-6.1 ="  include/kernel-6.1 | cut -d . -f 3`
ver66=`grep "LINUX_VERSION-6.6 ="  include/kernel-6.6 | cut -d . -f 3`
ver612=`grep "LINUX_VERSION-6.12 ="  include/kernel-6.12 | cut -d . -f 3`
date1="${CONFIG_S}-${DATA}_by Sirpdboy"
if [ "$VER1" = "5.4" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver54}_by Sirpdboy"
date1="${CONFIG_S}-${DATA}-${VER1}.${ver54}"
elif [ "$VER1" = "5.15" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver515}_by Sirpdboy"
date1="${CONFIG_S}-${DATA}-${VER1}.${ver515}"
elif [ "$VER1" = "6.1" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver61}_by Sirpdboy"
date1="${CONFIG_S}-${DATA}-${VER1}.${ver61}"
elif [ "$VER1" = "6.6" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver66}_by Sirpdboy"
date1="${CONFIG_S}-${DATA}-${VER1}.${ver66}"
elif [ "$VER1" = "6.12" ]; then
date2="EzOpWrt ${CONFIG_S}-${DATA}-${VER1}.${ver612}_by Sirpdboy"
date1="${CONFIG_S}-${DATA}-${VER1}.${ver612}"
fi
echo "EZVER=${date1}" > ./files/etc/ezopenwrt_version
echo "EZDATE=$DATA" >> ./files/etc/ezopenwrt_version
cp -r ./files/etc/ezopenwrt_version ../ezopenwrt_version
echo "${date2}" >> ./files/etc/banner
#tokenfile
cp -r  ./package/add/patch/GithubvToken ./files/etc/ezgithub
chmod 600 ./files/etc/ezgithub
echo '---------------------------------' >> ./files/etc/banner
[ -f ./files/root/.zshrc ] || mv -f ./package/add/patch/z.zshrc ./files/root/.zshrc
[ -f ./files/root/.zshrc ] || curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/z.zshrc > ./files/root/.zshrc
[ -f ./files/etc/profiles ] || mv -f ./package/add/patch/profiles ./files/etc/profiles
[ -f ./files/etc/profiles ] || curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/profiles > ./files/etc/profiles

cat>buildmd5.sh<<-\EOF
#!/bin/bash
# gzip bin/targets/*/*/*.img | true

VER1="$(grep "KERNEL_PATCHVER:=" ./target/linux/rockchip/Makefile | cut -d = -f 2)"
pushd bin/targets/*/*/
rm -rf   config.buildinfo
rm -rf   feeds.buildinfo
rm -rf   *.manifest
rm -rf  *generic.manifest
rm -rf  sha256sums
rm -rf version.buildinfo
rm -rf  profiles.json
# BINDIR=`pwd`
sleep 2

popd
exit 0
EOF

cat>bakkmod.sh<<-\EOF
#!/bin/bash
kmoddirdrv=./files/etc/kmod.d/drv
kmoddirdocker=./files/etc/kmod.d/docker
bakkmodfile=./kmod.source
cat ./package/add/patch/list.r2s >$bakkmodfile  || true
nowkmodfile=./files/etc/kmod.now
mkdir -p $kmoddirdrv 2>/dev/null
mkdir -p $kmoddirdocker 2>/dev/null
while IFS= read -r line || [[ -n "$line" ]]; do
    found=$(find bin/ -type f -name  "${line}" | head -n 1)
    if [ -z "$found" ]; then
        echo "警告: 找不到模块 $line"
        continue
    fi
    cp -fv "$found" "$kmoddirdrv"
done < "$bakkmodfile"


find bin/ -type f \( -name "*dockerman*" -o -name "*dockerd*" \) -exec cp -fv {} "$kmoddirdocker" \;

EOF


cat>./package/base-files/files/etc/kmodreg<<\EOF
#!/bin/bash
# EzOpWrt By Sirpdboy
IPK=$1
nowkmoddir=/etc/kmod.d/$IPK
[ -d $nowkmoddir ]  || exit
is_docker() {
         [ -s "/usr/lib/lua/luci/controller/dockerman.lua" ] && return 0  || return 1
}

run_drv() {
opkg update
echo "正在安装全部驱动（包括有线和无线）,请耐心等待...大约需要1-5分钟 "
for file in `ls $nowkmoddir/*.ipk`;do
    opkg install "$file"  --force-depends
done
echo "所有驱动已经安装完成！请重启系统生效！ "
}
run_docker() {
if is_docker; then
	echo " Docker服务已经存在！无须安装！"
else

    local opkg_conf="/etc/opkg.conf"
    sed -i '/option check_signature/d' "$opkg_conf"
	opkg update
	echo "正在安装Docker及相关服务...请耐心等待...大约需要1-5分钟 "

	# opkg install $nowkmoddir/dockerd*.ipk --force-depends >/dev/null 2>&1
	# opkg install $nowkmoddir/luci-app-dockerman*.ipk --force-depends  >/dev/null 2>&1
	# opkg install $nowkmoddir/luci-i18n-dockerman*.ipk --force-depends  >/dev/null 2>&1
	opkg install --force-depends luci-app-dockerman >/dev/null 2>&1
    	opkg install --force-depends luci-i18n-dockerman-zh-cn	 >/dev/null 2>&1
    	opkg install --force-depends avahi-daemon >/dev/null 2>&1
	if is_docker; then
		echo "本地成功安装Docker及相关服务！"
	else
   		echo "本地安装失败！"
   		echo "在线重新安装Docker及相关服务...请耐心等待...大约需要1-5分钟"
   		opkg install --force-depends dockerd >/dev/null 2>&1
    		opkg install --force-depends luci-i18n-dockerman* >/dev/null 2>&1
    		opkg install --force-depends luci-app-dockerman >/dev/null 2>&1
    		opkg install --force-depends avahi-daemon >/dev/null 2>&1
    		if is_docker; then 
    		    echo "在线成功安装Docker及相关服务！" 
    		fi

	fi
fi
if is_docker; then
      		echo "设置Docker服务自动启动成功！"
      		echo "Docker菜单注销重新登陆才能看到！"
      		echo "[注意]请用分区扩容工具扩容挂载/opt/docker盘，否则无法正常使用！"
		uci -q get dockerd.globals 2>/dev/null && {
		uci -q set dockerd.globals.data_root='/opt/docker/'
		uci -q set dockerd.globals.auto_start='1'
		uci commit dockerd
  		/etc/init.d/dockerd enabled
		rm -rf /tmp/luci*
		 /etc/init.d/avahi-daemon enabled
		 /etc/init.d/avahi-daemon start
		/etc/init.d/dockerd restart
		}
    else
      echo "安装Docker失败！请保证出国插件线路和网络正常！BUG请联系TG群：sirpdboy！"
    fi
}
case "$IPK" in
	"drv")
		run_drv
	;;
	"docker")
		run_docker
	;;
esac

EOF

# 广告链接 23.05专用
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/10_system2305.js  >   ./package/add/up/tool/autocore/files/generic/10_system.js
# sed -i "/return table/i $INSERT_CODE" /www/luci-static/resources/view/status/include/10_system.js
UPDATE_PACKAGE "luci-app-tailscale" "asvow/luci-app-tailscale" "main"

#修复TailScale配置文件冲突
TS_FILE=$(find ../feeds/packages/ -maxdepth 3 -type f -wholename "*/tailscale/Makefile")
if [ -f "$TS_FILE" ]; then
	sed -i '/\/files/d' $TS_FILE
	echo "tailscale has been fixed!"
fi

#修复Coremark编译失败
CM_FILE=$(find ../feeds/packages/ -maxdepth 3 -type f -wholename "*/coremark/Makefile")
if [ -f "$CM_FILE" ]; then
	sed -i 's/mkdir/mkdir -p/g' $CM_FILE
	echo "coremark has been fixed!"
fi

./scripts/feeds update -i
./scripts/feeds install -i
exit
