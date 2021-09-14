CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7621=y
CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-4a-gigabit=y
CONFIG_HYSTERIA_COMPRESS_UPX=y
# CONFIG_PACKAGE_kmod-mt76x2 is not set
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
CONFIG_EFI_IMAGES=y
CONFIG_TARGET_ROOTFS_TARGZ=n
# CONFIG_VMDK_IMAGES is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# file system
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
# 添加网络配置
CONFIG_PACKAGE_ppp-mod-pptp=y  #VPN客户端

# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-advanced=y
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=y
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=n
CONFIG_PACKAGE_luci-app-passwall=n
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=n
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE_DRV=y
CONFIG_PACKAGE_luci-app-mentohust=y
CONFIG_PACKAGE_luci-app-dnsfilter=y
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-pushbot=y

CONFIG_PACKAGE_luci-app-bypass=n
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_ShadowsocksR_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Shadowsocks_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Socks_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan-Go is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Xray is not set
CONFIG_PACKAGE_luci-app-passwall=n
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Simple_Obfs is not set
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Client=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_Plugin is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_Plugin=n
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=n
CONFIG_PACKAGE_luci-app-ssrpro=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_NaiveProxy=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Redsocks2=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_ShadowsocksR_Libev_Server=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Libev_Server=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Simple_Obfs=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_V2ray_Plugin=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Xray=n
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y

# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-opentopd=y
