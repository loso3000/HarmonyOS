####
CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt76x8=y
CONFIG_TARGET_ramips_mt76x8_DEVICE_xiaomi_mi-router-4c=y

# 工具
CONFIG_PACKAGE_miniupnpd-igdv1=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=n
# CONFIG_PACKAGE_automount is not set
# CONFIG_PACKAGE_autocore-arm is not set
# CONFIG_PACKAGE_default-settings is not set

# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=n
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-advanced=n
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=n
CONFIG_PACKAGE_luci-app-passwall=n
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
CONFIG_PACKAGE_luci-app-smartdns=n
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
CONFIG_PACKAGE_luci-app-timecontrol=n
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=n
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_flow-offload=n
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-wrtbwmon=n
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_ShadowsocksR_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Shadowsocks_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray_Plugin is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_xray-core is not set
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_Obfs is not set
CONFIG_PACKAGE_luci-app-dnsfilter=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=n
CONFIG_PACKAGE_luci-app-wifidog=n
# CONFIG_PACKAGE_wifidog=n
# 主题
CONFIG_PACKAGE_luci-theme-atmaterial=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-opentopd=n
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-neobird=n

CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-aliddns=n
CONFIG_PACKAGE_luci-app-cowbping=n
CONFIG_PACKAGE_luci-app-beardropper=n
CONFIG_PACKAGE_luci-app-control-parentcontrol=n

#增加其它插件
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-mwan3=n
CONFIG_PACKAGE_luci-app-unblockneteasemusic=n
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
CONFIG_PACKAGE_luci-app-pptp-server=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
CONFIG_PACKAGE_luci-app-ipsec-server=n
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
CONFIG_PACKAGE_luci-app-softethervpn=n
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer is not set
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n

