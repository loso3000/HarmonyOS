#!/bin/bash

# private gitea
gitea=git.cooluc.com
github="github.com"
mirror=https://init.cooluc.com

is_vip() {
case "${CONFIG_S}" in
     "Vip"*) return 0 ;;
     *) return 1 ;;
esac
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

rm -rf ./package/add/up/pass/shadow-tls
# rm -rf ./package/add/up/pass/xray-core
rm -rf ./package/add/up/pass/naiveproxy

#samrtdns
rm -rf ./feeds/luci/applications/luci-app-smartdns
rm -rf ./feeds/luci/applications/luci-app-lucky
rm -rf ./feeds/luci/applications/luci-app-ddns-go
rm -rf ./feeds/luci/applications/luci-app-filetransfer
rm -rf ./feeds/luci/applications/luci-app-fileassistant
rm -rf ./feeds/luci/applications/luci-app-msd_lite
rm -rf ./feeds/luci/applications/luci-app-smartdns
rm -rf ./feeds/luci/applications/luci-app-wolplus
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon

rm -rf ./feeds/luci/applications/luci-app-udpxy
rm -rf ./feeds/luci/applications/luci-app-adguardhome
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/luci/applications/luci-app-passwall2

rm -rf  ./feeds/packages/net/wrtbwmon
rm -rf  ./feeds/packages/net/smartdns
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
rm -rf  ./feeds/third_party/luci-app-autotimeset
rm -rf ./feeds/openwrt-third/luci-app-netdata
rm -rf ./feeds/openwrt-third/smartdns
rm -rf ./feeds/openwrt-third/luci-app-autotimeset
rm -rf ./feeds/luci/applications/luci-app-autotimeset
rm -rf ./feeds/third/luci-app-autotimeset
rm -rf  ./feeds/packages/ariang
rm -rf  ./feeds/packages/webui-aria2

mv -f ./package/add/up/tool/smartdns/luci-app-smartdns ./feeds/luci/applications/luci-app-smartdns

mv -f ./package/add/up/tool/netspeedtest/*  ./package/add/
mv -f ./package/add/up/tool/smartdns/*  ./package/add/

# rm -rf ./package/add/luci-app-mwan3 ./package/add/mwan3
# rm -rf ./feeds/luci/applications/luci-app-mwan3
rm -rf ./feeds/packages/net/mwan3
mv ./package/add/up/tool/mwan3 ./feeds/packages/net/mwan3

#rm -rf ./feeds/packages/net/aria2
#rm -rf ./feeds/luci/applications/luci-app-aria2  package/feeds/packages/luci-app-aria2

sed -i 's,default n,default y,g' package/add/up/pass/luci-app-bypass/Makefile
sed -i 's,default n,default y,g' package/add/up/pass/luci-app-ssr-plus/Makefile
# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust:/d' package/passwall/luci-app-passwall/Makefile
sed -i '/Rust:/d' ./package/add/up/pass/luci-app-bypass/Makefile

#修正nat回流 
cat ./package/add/patch/sysctl.conf > ./package/base-files/files/etc/sysctl.conf
cat ./package/add/patch/banner > ./package/base-files/files/etc/banner
cat ./package/add/patch/profile > ./package/base-files/files/etc/profile

rm -rf ./feeds/luci/applications/luci-app-udpxy
rm -rf ./feeds/luci/applications/luci-app-msd_lite
rm -rf ./feeds/luci/applications/luci-app-upnp
rm -rf  ./feeds/packages/net/msd_lite

mkdir -p ./package/lean
rm -rf ./package/lean/autocore ./package/emortal/autocore
mv ./package/add/up/tool/autocore ./package/lean/autocore 
#rm -rf ./package/lean/autocore/files/generic/inlink.htm
# rm -rf ./package/add/up/tool/autocore/files/generic/inlink.htm

# samba4
rm -rf ./package/lean/autosamba
rm -rf  package/emortal/autosamba

rm -rf  package/emortal/automount
rm -rf ./package/lean/automount

rm -rf ./package/lean/default-settings
rm -rf  package/emortal/default-settings

# transmission web error
sed -i "s/procd_add_jail transmission log/procd_add_jail_mount '$web_home'/g"  feeds/packages/net/transmission/files/transmission.init

rm -rf ./feeds/luci/applications/luci-app-beardropper

rm -rf ./feeds/luci/applications/luci-app-p910nd

#  coremark
sed -i '/echo/d' ./feeds/packages/utils/coremark/coremark
rm -rf ./feeds/packages/net/lucky
rm -rf  ./feeds/luci/applications/luci-app-lucky
git clone https://github.com/sirpdboy/luci-app-lucky ./package/lucky
rm -rf ./feeds/packages/net/ddns-go
rm -rf  ./feeds/luci/applications/luci-app-ddns-go
git clone https://github.com/sirpdboy/luci-app-ddns-go ./package/ddns-go

git clone https://github.com/sirpdboy/netspeedtest ./package/netspeedtest

rm -rf ./feeds/packages/net/oaf
rm -rf ./feeds/packages/net/open-app-filter
rm -rf ./feeds/packages/net/appfilter
rm -rf ./feeds/luci/applications/luci-app-oaf
rm -rf ./feeds/luci/applications/luci-app-appfilter
rm -rf ./package/add/up/tool/OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter.git ./package/OpenAppFilter

# nlbwmon
sed -i 's/524288/16777216/g' feeds/packages/net/nlbwmon/files/nlbwmon.config
# 可以设置汉字名字
# sed -i '/o.datatype = "hostname"/d' feeds/luci/modules/luci-mod-admin-full/luasrc/model/cbi/admin_system/system.lua
# sed -i '/= "hostname"/d' /usr/lib/lua/luci/model/cbi/admin_system/system.lua

# alist
rm -rf feeds/packages/net/alist feeds/luci/applications/luci-app-alist
git clone https://$github/sbwml/openwrt-alist package/new/alist

# 修复procps-ng-top导致首页cpu使用率无法获取
sed -i 's#top -n1#\/bin\/busybox top -n1#g' feeds/luci/modules/luci-base/root/usr/share/rpcd/ucode/luci

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
# golang 1.23
git clone --depth=1 https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

# luci-compat - fix translation
sed -i 's/<%:Up%>/<%:Move up%>/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/tblsection.htm
sed -i 's/<%:Down%>/<%:Move down%>/g' feeds/luci/modules/luci-compat/luasrc/view/cbi/tblsection.htm

# luci-app-filemanager
rm -rf feeds/luci/applications/luci-app-filemanager
git clone https://$github/sbwml/luci-app-filemanager package/new/luci-app-filemanager


# 修正部分从第三方仓库拉取的软件 Makefile 路径问题
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

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


# TTYD设置
sed -i 's/procd_set_param stdout 1/procd_set_param stdout 0/g' ./feeds/packages/utils/ttyd/files/ttyd.init
sed -i 's/procd_set_param stderr 1/procd_set_param stderr 0/g' ./feeds/packages/utils/ttyd/files/ttyd.init

sed -i 's|/bin/login|/bin/login -f root|' ./feeds/packages/utils/ttyd/files/ttyd.config

sed -i "/listen_https/ {s/^/#/g}" ./package/*/*/*/files/uhttpd.config

# netdata 
rm -rf  ./feeds/luci/applications/luci-app-netdata
rm -rf ./feeds/luci/applications/luci-app-netdata package/feeds/packages/luci-app-netdata

rm -rf ./feeds/luci/applications/luci-app-arpbind

# Add luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-docker
rm -rf ./feeds/luci/collections/luci-lib-docker
#rm -rf ./feeds/packages/utils/docker
git clone --depth=1 https://$github/lisaac/luci-lib-docker ./package/new/luci-lib-docker
git clone --depth=1 https://$github/lisaac/luci-app-dockerman ./package/new/luci-app-dockerman

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
# sed -i 's/msgstr "挂载 SMB 网络共享"/msgstr "CIFS挂载共享"/g' ./feeds/luci/applications/luci-app-cifs-mount/po/zh-cn/cifs.po
# sed -i 's/aMule设置/电驴下载/g' ./feeds/luci/applications/luci-app-amule/po/zh-cn/amule.po
# sed -i 's/监听端口/监听端口 用户名admin密码adminadmin/g' ./feeds/luci/applications/luci-app-qbittorrent/po/zh-cn/qbittorrent.po
# sed -i 's/a.default = "0"/a.default = "1"/g' ./feeds/luci/applications/luci-app-cifsd/luasrc/controller/cifsd.lua   #挂问题
# echo  "        option tls_enable 'true'" >> ./feeds/luci/applications/luci-app-frpc/root/etc/config/frp   #FRP穿透问题
# sed -i 's/invalid/# invalid/g' ./package/network/services/samba36/files/smb.conf.template  #共享问题
# sed -i '/mcsub_renew.datatype/d'  ./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi/udpxy.lua  #修复UDPXY设置延时55的错误
sed -i '/filter_/d' ./package/network/services/dnsmasq/files/dhcp.conf   #DHCP禁用IPV6问题
# sed -i 's/请输入用户名和密码。/管理登陆/g' ./feeds/luci/modules/luci-base/po/*/base.po   #用户名密码

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

#echo "其他修改"
# sed -i 's/option commit_interval.*/option commit_interval 1h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为1h
# sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
# nlbwmon - disable syslog
sed -i 's/stderr 1/stderr 0/g' feeds/packages/net/nlbwmon/files/nlbwmon.init

# echo '默认开启 Irqbalance'
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://$github/BoringCat/luci-app-mentohust package/luci-app-mentohust
git clone --depth=1 https://$github/KyleRicardo/MentoHUST-OpenWrt-ipk package/MentoHUST-OpenWrt-ipk

# 全能推送
rm -rf ./feeds/luci/applications/luci-app-pushbot && \
git clone https://$github/zzsj0928/luci-app-pushbot ./feeds/luci/applications/luci-app-pushbot
# rm -rf ./feeds/luci/applications/luci-app-jd-dailybonus && \
# git clone https://$github/jerrykuku/luci-app-jd-dailybonus ./feeds/luci/applications/luci-app-jd-dailybonus
rm -rf ./feeds/luci/applications/luci-app-serverchan && \
git clone -b master --single-branch https://$github/tty228/luci-app-serverchan ./feeds/luci/applications/luci-app-serverchan

rm -rf ./feeds/packages/net/adguardhome

git clone https://$github/yaof2/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's/, 1).d/, 11).d/g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua

#qbittorrent
rm -rf ./feeds/packages/net/qbittorrent
rm -rf ./feeds/packages/net/qBittorrent-Enhanced-Edition
rm -rf ./feeds/packages/net/qBittorrent-static
rm -rf ./feeds/luci/applications/luci-app-qbittorrent  package/feeds/packages/luci-app-qbittorrent

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
   DATA=`TZ=UTC-8 date +%y%m%d%H%M`
   # DATA=`TZ=UTC-8 date +%y%m%d%H%M`
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
echo "${date1}" > ./package/base-files/files/etc/ezopenwrt_version
echo "${date2}" >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner
[ -f ./files/root/.zshrc ] || mv -f ./package/add/patch/z.zshrc ./files/root/.zshrc
[ -f ./files/root/.zshrc ] || curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/.zshrc > ./files/root/.zshrc
[ -f ./files/etc/profiles ] || mv -f ./package/add/patch/profiles ./files/etc/profiles
[ -f ./files/etc/profiles ] || curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/profiles > ./files/etc/profiles

if [ ${TARGET_DEVICE} = "x86_64" ] ; then

cat>buildmd5.sh<<-\EOF
#!/bin/bash

r_version=`cat ./package/base-files/files/etc/ezopenwrt_version`
# gzip bin/targets/*/*/*.img | true

pushd bin/targets/*/*/
rm -rf   config.buildinfo
rm -rf   feeds.buildinfo
rm -rf   *.manifest
rm -rf   *rootfs.tar.gz
rm -rf   *generic-squashfs-rootfs.img*
rm -rf   *generic-rootfs*
rm -rf  *generic.manifest
rm -rf  sha256sums
rm -rf version.buildinfo
rm -rf *generic-ext4-rootfs.img*
rm -rf  *generic-ext4-combined-efi.img*
rm -rf  *generic-ext4-combined.img*
rm -rf  profiles.json
rm -rf  *kernel.bin
# BINDIR=`pwd`
sleep 2
mv  *generic-squashfs-combined.img.gz       EzOpWrt-${r_version}_${TARGET_DEVICE}-dev.img.gz   
mv  *generic-squashfs-combined-efi.img.gz   EzOpWrt-${r_version}_${TARGET_DEVICE}-dev-efi.img.gz
md5_EzOpWrt=EzOpWrt-${r_version}_${TARGET_DEVICE}-dev.img.gz   
md5_EzOpWrt_uefi=EzOpWrt-${r_version}_${TARGET_DEVICE}-dev-efi.img.gz
#md5

ip=` cat package/base-files/luci2/bin/config_generate | grep "n) ipad" |awk -F '\"' '{print $2}'`
[ -f ${md5_EzOpWrt} ] && md5sum ${md5_EzOpWrt} > EzOpWrt_dev.md5 &&echo "ip=` cat  package/base-files/luci2/bin/config_generate | grep "n) ipad" |awk -F '\"' '{print $2}'`" >> EzOpWrt_dev.md5
[ -f ${md5_EzOpWrt_uefi} ] && md5sum ${md5_EzOpWrt_uefi} > EzOpWrt_dev-efi.md5 &&echo "ip=` cat  package/base-files/luci2/bin/config_generate | grep "n) ipad" |awk -F '\"' '{print $2}'`" >> EzOpWrt_dev-efi.md5

if [ ${CONFIG_S} = "Vip-Super" ] ; then
cp ../../../../ezotafooter  ./ota.footer
cp ../../../../ezverlatest   ./ver.latest 
fi
popd

EOF

else

cat>buildmd5.sh<<-\EOF
#!/bin/bash

r_version=`cat ./package/base-files/files/etc/ezopenwrt_version`
# gzip bin/targets/*/*/*.img | true

VER1="$(grep "KERNEL_PATCHVER:=" ./target/linux/rockchip/Makefile | cut -d = -f 2)"
pushd bin/targets/*/*/
rm -rf   config.buildinfo
rm -rf   feeds.buildinfo
rm -rf   *.manifest
rm -rf   *rootfs.tar.gz
rm -rf   *generic-squashfs-rootfs.img*
rm -rf   *generic-rootfs*
rm -rf  *generic.manifest
rm -rf  sha256sums
rm -rf version.buildinfo
rm -rf *generic-ext4-rootfs.img*
rm -rf  *generic-ext4-combined-efi.img*
rm -rf  *generic-ext4-combined.img*
rm -rf  profiles.json
rm -rf  *kernel.bin
# BINDIR=`pwd`
sleep 2

ip=` cat package/base-files/luci2/bin/config_generate | grep "n) ipad" |awk -F '\"' '{print $2}'`
mv   *squashfs-sysupgrade.img.gz EzOpWrt-${r_version}_${TARGET_DEVICE}-squashfs-sysupgrade.img.gz 
mv  *ext4-sysupgrade.img.gz EzOpWrt-${r_version}_${TARGET_DEVICE}-ext4-sysupgrade.img.gz
md5_EzOpWrt=EzOpWrt-${r_version}_${TARGET_DEVICE}-squashfs-sysupgrade.img.gz 
md5_EzOpWrt_uefi=EzOpWrt-${r_version}_${TARGET_DEVICE}-ext4-sysupgrade.img.gz
[ -f ${md5_EzOpWrt} ] && md5sum ${md5_EzOpWrt} > EzOpWrt_dev.md5 && echo "ip=$ip" >> EzOpWrt_dev.md5
[ -f ${md5_EzOpWrt_uefi} ] && md5sum ${md5_EzOpWrt_uefi} > EzOpWrt_dev-efi.md5 && echo "ip=$ip" >> EzOpWrt_dev-efi.md5

if [ ${CONFIG_S} = "Vip-Super" ] ; then
cp ../../../../ezotafooter  ./ota.footer
cp ../../../../ezverlatest   ./ver.latest 
fi
popd
exit 0
EOF
fi
cat>bakkmod.sh<<-\EOF
#!/bin/bash
kmoddirdrv=./files/etc/kmod.d/drv
kmoddirdocker=./files/etc/kmod.d/docker
bakkmodfile=./kmod.source
cp -rf ./patch/list.txt $bakkmodfile
nowkmodfile=./files/etc/kmod.now
mkdir -p $kmoddirdrv 2>/dev/null
mkdir -p $kmoddirdocker 2>/dev/null
while IFS= read -r line; do  
    cp -v $(find bin/ -type f -name "*${line}*") $kmoddirdrv
    echo "$line"  
        a=`find ./bin/ -name "$line" `
    echo $a
    if [ -z "$a" ]; then
        echo "no find: $line"
    else
        cp -f $a $kmoddirdrv
	echo $line >> $nowkmodfile
        if [ $? -eq 0 ]; then
            echo "cp ok: $line"
        else
            echo "no cp:$line"
        fi
    fi
done < "$bakkmodfile"
    # find ./bin/ -name  $file | xargs -i cp -f {}  $kmoddirdrv
    # cp -v $(find bin/targets/ -type f -name "*${FIRMWARE_TYPE}*") ../firmware
find ./bin/ -name "*dockerman*" | xargs -i cp -f {} $kmoddirdocker
find ./bin/ -name "*dockerd*" | xargs -i cp -f {} $kmoddirdocker
EOF


#sed -i 's/luci-theme-argon/luci-theme-kucat/g' package/istoreos-files/Makefile

# sed -i '/	refresh_config();/d' scripts/feeds  package/base-files/files/lib/upgrade/keep.d/base-files-essential
sed -i -e '/^\/etc\/profile/d' \
        -e '/^\/etc\/shinit/d' \
        package/base-files/Makefile
sed -i "s/^.*vermagic$/\techo '1' > \$(LINUX_DIR)\/.vermagic/" include/kernel-defaults.mk

sed -i 's/option timeout 30/option timeout 60/g' package/system/rpcd/files/rpcd.config
sed -i 's#20) \* 1000#60) \* 1000#g' feeds/luci/modules/luci-base/htdocs/luci-static/resources/rpc.js

sed -i "s/tty\(0\|1\)::askfirst/tty\1::respawn/g" target/linux/*/base-files/etc/inittab
sed -i 's/max_requests 3/max_requests 20/g' package/network/services/uhttpd/files/uhttpd.config

cat>./package/base-files/files/etc/kmodreg<<-\EOF
#!/bin/bash
# EzOpWrt By Sirpdboy
IPK=$1
nowkmoddir=/etc/kmod.d/$IPK
[ -d $nowkmoddir ]  || exit
is_docker() {
         if [ -f "/usr/bin/docker" ] || [ -f "/usr/sbin/dockerd" ] || [ -d "/etc/docker" ]; then
        return 0
    fi
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
	opkg install $nowkmoddir/dockerd*.ipk --force-depends >/dev/null 2>&1
	opkg install $nowkmoddir/luci-app-dockerman*.ipk --force-depends  >/dev/null 2>&1
	opkg install $nowkmoddir/luci-i18n-dockerman*.ipk --force-depends  >/dev/null 2>&1
    	opkg install avahi-daemon >/dev/null 2>&1
	if is_docker; then
		echo "本地成功安装Docker及相关服务！"
	else
   		echo "本地安装失败！"
   		echo "在线重新安装Docker及相关服务...请耐心等待...大约需要1-5分钟"
   		opkg install dockerd --force-depends >/dev/null 2>&1
    		opkg install luci-app-dockerman >/dev/null 2>&1
    		opkg install luci-i18n-dockerman* >/dev/null 2>&1
    		opkg install avahi-daemon >/dev/null 2>&1
    		if is_docker; then 
    		    echo "在线成功安装Docker及相关服务！" 
    		fi

	fi
fi
if is_docker; then
      		echo "设置Docker服务自动启动成功！"
      		echo "Docker菜单注销重新登陆才能看到！"
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

./scripts/feeds update -i
exit
