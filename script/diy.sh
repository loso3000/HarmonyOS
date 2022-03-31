#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
color() {
    case $1 in
        cy)
        echo -e "\033[1;33m$2\033[0m"
        ;;
        cr)
        echo -e "\033[1;31m$2\033[0m"
        ;;
        cg)
        echo -e "\033[1;32m$2\033[0m"
        ;;
        cb)
        echo -e "\033[1;34m$2\033[0m"
        ;;
    esac
}

clashcore() {
mkdir -p files/etc/openclash/core

OPENCLASH_MAIN_URL=$( curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$1 | awk -F '"' '{print $4}')
# OFFICAL_OPENCLASH_MAIN_URL=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/v1.3.5 | grep /clash-linux-$1 | awk -F '"' '{print $4}')
CLASH_TUN_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$1 | awk -F '"' '{print $4}')
CLASH_GAME_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$1 | awk -F '"' '{print $4}')

wget -qO- $OPENCLASH_MAIN_URL | tar xOvz > files/etc/openclash/core/clash
# wget -qO- $OFFICAL_OPENCLASH_MAIN_URL | gunzip -c > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_GAME_URL | tar xOvz > files/etc/openclash/core/clash_game
echo -e "$(color cy 'clash-'$1' 内核下载成功！....')\c"
chmod +x files/etc/openclash/core/clash*
}

status() {
    CHECK=$?
    END_TIME=$(date '+%H:%M:%S')
    _date=" ==>用时 $(($(date +%s -d "$END_TIME") - $(date +%s -d "$BEGIN_TIME"))) 秒"
    [[ $_date =~ [0-9]+ ]] || _date=""
    if [ $CHECK = 0 ]; then
        printf "%35s %s %s %s %s %s %s\n" \
        `echo -e "[ $(color cg ✔)\033[0;39m ]${_date}"`
    else
        printf "%35s %s %s %s %s %s %s\n" \
        `echo -e "[ $(color cr ✕)\033[0;39m ]${_date}"`
        exit 1
    fi
}

_packages() {
    for z in $@; do
        [[ "$(grep -v '^#' <<<$z)" ]] && echo "CONFIG_PACKAGE_$z=y" >> .config
    done
}

_printf() {
    awk '{printf "%s %-40s %s %s %s\n" ,$1,$2,$3,$4,$5}'
}

clone_url() {
    for x in $@; do
        if [[ "$(grep "^https" <<<$x | grep -Ev "helloworld|pass|build")" ]]; then
            g=$(find package/ feeds/ -maxdepth 5 -type d -name ${x##*/} 2>/dev/null)
            if ([[ -d "$g" ]] && rm -rf $g); then
                p="1"; k="$g"
            else
                p="0"; k="package/A/${x##*/}"
            fi

            if [[ "$(grep -E "trunk|branches" <<<$x)" ]]; then
                if svn export -q --force $x $k; then
                    f="1"
                fi
            else
                if git clone -q $x $k; then
                    f="1"
                fi
            fi
            [[ $f = "" ]] && echo -e "$(color cr 拉取) ${x##*/} [ $(color cr ✕) ]" | _printf
            [[ $f -lt $p ]] && echo -e "$(color cr 替换) ${x##*/} [ $(color cr ✕) ]" | _printf
            [[ $f = $p ]] && \
                echo -e "$(color cg 替换) ${x##*/} [ $(color cg ✔) ]" | _printf || \
                echo -e "$(color cb 添加) ${x##*/} [ $(color cb ✔) ]" | _printf
            unset -v p f k
        else
            for w in $(grep "^https" <<<$x); do
                if git clone -q $w ../${w##*/}; then
                    for x in `ls -l ../${w##*/} | awk '/^d/{print $NF}' | grep -Ev '*pulimit|*dump|*dtest|*Deny|*dog|*ding'`; do
                        g=$(find package/ feeds/ -maxdepth 5 -type d -name $x 2>/dev/null)
                        if ([[ -d "$g" ]] && rm -rf $g); then
                            k="$g"
                        else
                            k="package/A"
                        fi

                        if mv -f ../${w##*/}/$x $k; then
                            [[ $k = $g ]] && \
                            echo -e "$(color cg 替换) ${x##*/} [ $(color cg ✔) ]" | _printf || \
                            echo -e "$(color cb 添加) ${x##*/} [ $(color cb ✔) ]" | _printf
                        fi
                        unset -v p k
                    done
                fi
                rm -rf ../${w##*/}
            done
        fi
    done
}
config_generate="package/base-files/files/bin/config_generate"

# 清理
rm -rf feeds/*/*/{netdata,smartdns,wrtbwmon,adguardhome,luci-app-smartdns,luci-app-timecontrol,luci-app-smartinfo,luci-app-socat,luci-app-netdata,luci-app-wolplus,luci-app-arpbind,luci-app-baidupcs-web}
rm -rf package/*/{autocore,autosamba,default-settings}
rm -rf feeds/*/*/{luci-app-dockerman,luci-app-aria2,luci-app-adguardhome,luci-app-appfilter,open-app-filter,luci-app-openclash,luci-app-vssr,luci-app-ssr-plus,luci-app-passwall,luci-app-syncdial,luci-app-zerotier,luci-app-wrtbwmon,luci-app-koolddns,luci-app-samba,luci-app-samba4,luci-app-wol,luci-app-unblockneteasemusic,luci-app-accesscontrol}

rm -rf  package/emortal/autocore
rm -rf  package/emortal/autosamba
rm -rf  package/emortal/default-settings

git clone https://github.com/sirpdboy/build.git ./package/build
git clone https://github.com/sirpdboy/sirpdboy-package ./package/diy
# rm -rf  ./package/build/luci-app-netspeedtest
# rm -rf  ./package/build/luci-app-netspeedtest
#更新系统文件
wget -qO package/base-files/files/etc/banner https://raw.githubusercontent.com/sirpdboy/build/master/banner
wget -qO package/base-files/files/etc/profile https://raw.githubusercontent.com/sirpdboy/build/master/profile
wget -qO package/base-files/files/etc/sysctl.conf https://raw.githubusercontent.com/sirpdboy/sirpdboy-package/master/set/sysctl.conf
echo "poweroff"
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
curl -fsSL  https://raw.githubusercontent.com/loso3000/other/master/patch/default-settings/zzz-default-settings1 > ./package/build/default-settings/files/zzz-default-settings
#设置
sed -i 's/option enabled.*/option enabled 0/' feeds/*/*/*/*/upnpd.config
sed -i 's/option dports.*/option enabled 2/' feeds/*/*/*/*/upnpd.config
sed -i "s/ImmortalWrt/OpenWrt/" {$config_generate,include/version.mk}
sed -i "/listen_https/ {s/^/#/g}" package/*/*/*/files/uhttpd.config
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/build/master/mwan3/files/etc/config/mwan3 > ./feeds/packages/net/mwan3/files/etc/config/mwan3
sed -i 's/option commit_interval 24h/option commit_interval 4h/g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为2
sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置

echo "修改默认主题"
#sed -i 's/+luci-theme-bootstrap/+luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/opentopd/g' feeds/luci/collections/luci/Makefile
#echo "other"
# sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# sed -i 's/16384/165535/g' ./package/kernel/linux/files/sysctl-nf-conntrack.conf   连接数
color cy "自定义设置.... "
sed -i "s/192.168.1.1/192.168.8.1/" $config_generate

#koolproxy 更新插件
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
sed -i 's,1).dep,11).dep,g' ./package/luci-app-ikoolproxy/luasrc/controller/koolproxy.lua 
git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git  ./package/diy/luci-app-unblockneteasemusic

[[ -d "package/A" ]] || mkdir -m 755 -p package/A
    # https://github.com/kiddin9/openwrt-bypass
    # https://github.com/fw876/helloworld
    # https://github.com/sirpdboy/sirpdboy-package/
    # https://github.com/coolsnowwolf/packages/trunk/libs/qttools
    # https://github.com/coolsnowwolf/packages/trunk/net/qBittorrent
    # https://github.com/coolsnowwolf/packages/trunk/net/qBittorrent-static
    # https://github.com/coolsnowwolf/packages/trunk/libs/qtbase
    # https://github.com/coolsnowwolf/packages/trunk/utils/btrfs-progs
    # https://github.com/sirpdboy/diy/trunk/luci-app-netspeedtest
    # https://github.com/rufengsuixing/luci-app-zerotier.git
clone_url "
    https://github.com/loso3000/openwrt-passwall
    https://github.com/jerrykuku/luci-app-vssr.git
    https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav
    https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav
    https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease
    https://github.com/linkease/nas-packages/trunk/network/services/linkease
    https://github.com/rufengsuixing/luci-app-syncdial.git 
    https://github.com/tindy2013/openwrt-subconverter
    https://github.com/zxlhhyccc/luci-app-v2raya.git
	https://github.com/v2rayA/v2raya-openwrt/trunk/v2raya
    https://github.com/sirpdboy/luci-theme-opentopd.git
    https://github.com/jerrykuku/luci-theme-argon.git
    https://github.com/kiddin9/luci-theme-edge.git
    https://github.com/destan19/OpenAppFilter
    https://github.com/ntlf9t/luci-app-easymesh
    https://github.com/zzsj0928/luci-app-pushbot
    https://github.com/jerrykuku/luci-app-jd-dailybonus
    https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic
    https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
    https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker
"
# https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ttyd ## 分支
echo -e 'pthome.net\nchdbits.co\nhdsky.me\nwww.nicept.net\nourbits.club' | \
tee -a $(find package/A/ feeds/luci/applications/ -type f -name "white.list" -or -name "direct_host" | grep "ss") >/dev/null
#mosdns
git clone https://github.com/QiuSimons/openwrt-mos.git package/A/mosdns
sed -i "/filter_aaaa='1'/d" package/A/mosdns/luci-app-mosdns/root/etc/init.d/mosdns
 #dnsfilter
git clone https://github.com/kiddin9/luci-app-dnsfilter package/A/luci-app-dnsfilter
sed -i 's/),9)/),12)/g' package/A/luci-app-dnsfilter/luasrc/controller/dnsfilter.lua  
# echo '<iframe src="https://ip.skk.moe/simple" style="width: 100%; border: 0"></iframe>' | \
# tee -a {$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-vssr")/*/*/*/status_top.htm,$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-ssr-plus")/*/*/*/status.htm,$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-bypass")/*/*/*/status.htm,$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-passwall")/*/*/*/global/status.htm} >/dev/null

    cat <<-\EOF >feeds/packages/lang/python/python3/files/python3-package-uuid.mk
    define Package/python3-uuid
    $(call Package/python3/Default)
      TITLE:=Python $(PYTHON3_VERSION) UUID module
      DEPENDS:=+python3-light +libuuid
    endef
    $(eval $(call Py3BasePackage,python3-uuid, \
        /usr/lib/python$(PYTHON3_VERSION)/uuid.py \
        /usr/lib/python$(PYTHON3_VERSION)/lib-dynload/_uuid.$(PYTHON3_SO_SUFFIX) \
    ))
EOF

sed -i 's/option dports.*/option dports 2/' feeds/luci/applications/luci-app-vssr/root/etc/config/vssr


[[ "$REPO_BRANCH" == "openwrt-21.02" ]] && {
    # sed -i 's/services/nas/' feeds/luci/*/*/*/*/*/*/menu.d/*transmission.json
    sed -i 's/^ping/-- ping/g' package/*/*/*/*/*/bridge.lua
} || {
    [[ $TARGET_DEVICE == phicomm_k2p ]] || _packages "luci-app-smartinfo"
    for d in $(find feeds/ package/ -type f -name "index.htm"); do
        if grep -q "Kernel Version" $d; then
            sed -i 's|os.date(.*|os.date("%F %X") .. " " .. translate(os.date("%A")),|' $d

        fi
    done
}

for p in $(find package/A/ feeds/luci/applications/ -maxdepth 2 -type d -name "po" 2>/dev/null); do
    if [[ "${REPO_BRANCH#*-}" == "21.02" ]]; then
        if [[ ! -d $p/zh_Hans && -d $p/zh-cn ]]; then
            ln -s zh-cn $p/zh_Hans 2>/dev/null
            printf "%-13s %-33s %s %s %s\n" \
            $(echo -e "添加zh_Hans $(awk -F/ '{print $(NF-1)}' <<< $p) [ $(color cg ✔) ]")
        fi
    else
        if [[ ! -d $p/zh-cn && -d $p/zh_Hans ]]; then
            ln -s zh_Hans $p/zh-cn 2>/dev/null
            printf "%-13s %-33s %s %s %s\n" \
            `echo -e "添加zh-cn $(awk -F/ '{print $(NF-1)}' <<< $p) [ $(color cg ✔) ]"`
        fi
    fi
done

x=$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-bypass" 2>/dev/null)
[[ -f $x/Makefile ]] {
 sed -i 's/default y/default n/g' "$x/Makefile"  
 sed -i '/Rust:/d' "$x/Makefile"  
}
x=$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-vssr" 2>/dev/null)
[[ -f $x/Makefile ]]  {
 sed -i 's/default y/default n/g' "$x/Makefile"  
 sed -i '/Rust:/d' "$x/Makefile"  
}
x=$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-passwall" 2>/dev/null)
[[ -f $x/Makefile ]] {
 sed -i 's/default y/default n/g' "$x/Makefile"  
 sed -i '/Rust:/d' "$x/Makefile"  
}
x=$(find package/A/ feeds/luci/applications/ -type d -name "luci-app-ssr-plus" 2>/dev/null)
[[ -f $x/Makefile ]] {
 sed -i 's/default y/default n/g' "$x/Makefile"  
 sed -i '/Rust:/d' "$x/Makefile"  
}

echo -e "$(color cy '个性配置....')\c"

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

#version
date1='Ipv6-Super S'`TZ=UTC-8 date +%Y.%m.%d -d +"12"hour`
case "$VERSION" in
"mini")
       sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220401-Ipv6-Mini-5.4-/g' include/image.mk
       date1='Ipv6-Mini-5.4 S20220401'
       #sed -i 's/IMG_PREFIX:=.*/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Mini-5.4-$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/g' include/image.mk
    ;;
"plus")
        sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220401-Ipv6-Plus-5.4-/g' include/image.mk
       date1='Ipv6-Plus-5.4 S20220401'
       #sed -i 's/IMG_PREFIX:=.*/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Plus-5.4-$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/g' include/image.mk
       ;;
"dz")
       sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220401-Ipv6-Dz-5.4-/g' include/image.mk
       #sed -i 's/IMG_PREFIX:=.*/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Dz-5.4-$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/g' include/image.mk
       date1='Ipv6-Dz-5.4 S20220401'
       ;;
"*")
        sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/20220401-Ipv6-Super-/g' include/image.mk
        date1='Ipv6-Super S20220401'
        #sed -i 's/IMG_PREFIX:=.*/$(shell TZ=UTC-8 date +%Y%m%d -d +12hour)-Ipv6-Super-$(BOARD)$(if $(SUBTARGET),-$(SUBTARGET))/g' include/image.mk
        ;;
 
esac
echo "=date1=${date1}==   -----  =VERSION=$VERSION=="  

echo "DISTRIB_REVISION='${date1} by Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' by Sirpdboy ' >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

chmod +x ./package/*/root/etc/init.d/*  
chmod +x ./package/*/root/usr/*/*  
chmod +x ./package/*/*/root/etc/init.d/*  
chmod +x ./package/*/*/root/usr/*/*  
chmod +x ./package/*/*/*/root/etc/init.d/*  
chmod +x ./package/*/*/*/root/usr/*/*
status


# echo "SSH_ACTIONS=true" >>$GITHUB_ENV #SSH后台
# echo "UPLOAD_PACKAGES=false" >>$GITHUB_ENV
# echo "UPLOAD_SYSUPGRADE=false" >>$GITHUB_ENV
echo "UPLOAD_BIN_DIR=true" >>$GITHUB_ENV
# echo "UPLOAD_FIRMWARE=false" >>$GITHUB_ENV
echo "UPLOAD_COWTRANSFER=false" >>$GITHUB_ENV
# echo "UPLOAD_WETRANSFER=false" >> $GITHUB_ENV
echo "CACHE_ACTIONS=true" >> $GITHUB_ENV
echo "DEVICE_NAME=$DEVICE_NAME" >>$GITHUB_ENV
echo "FIRMWARE_TYPE=$FIRMWARE_TYPE" >>$GITHUB_ENV
echo "ARCH=`awk -F'"' '/^CONFIG_TARGET_ARCH_PACKAGES/{print $2}' .config`" >>$GITHUB_ENV
echo -e "\e[1;35m脚本运行完成！\e[0m"
