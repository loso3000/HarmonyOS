CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_p2w_r619ac-128m=y
CONFIG_TARGET_BOARD="ipq40xx"
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
CONFIG_EFI_IMAGES=y
CONFIG_TARGET_ROOTFS_TARGZ=n
# CONFIG_VMDK_IMAGES is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# file system
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# 工具
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_curl=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advanced=y
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=y
CONFIG_PACKAGE_luci-app-control-weburl=y
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-eqos=y
CONFIG_PACKAGE_luci-app-hd-idle=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-jd-dailybonus=y
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-passwall is not set
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=y
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_flow-offload=n
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-ssrpro=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_NaiveProxy=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Redsocks2=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Libev_Server=y
# CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Rust_Server is not set
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_ShadowsocksR_Libev_Client=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_V2ray_Plugin=n
CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=y
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-dnsfilter=y
CONFIG_PACKAGE_luci-app-vsftpd=y
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=n
# 主题
CONFIG_PACKAGE_luci-theme-atmaterial=y
CONFIG_PACKAGE_luci-theme-ifit=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-chuqitopd=y
CONFIG_PACKAGE_luci-theme-opentomcat=y
CONFIG_PACKAGE_luci-theme-opentopd=y
#增加其它插件
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-pushbot=y
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
CONFIG_PACKAGE_luci-app-unblockmusic=n
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
CONFIG_PACKAGE_luci-app-minidlna=y
# CONFIG_PACKAGE_luci-app-rclone is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
CONFIG_PACKAGE_luci-app-pptp-server=y
CONFIG_PACKAGE_luci-app-pppoe-server=y
CONFIG_PACKAGE_luci-app-ipsec-server=y
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
CONFIG_PACKAGE_luci-app-koolddns=y
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=y
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=y
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_frr=y
CONFIG_PACKAGE_frr-libfrr=y
CONFIG_FRR_INTERNAL=y

#
# Packages
#
CONFIG_PACKAGE_frr-babeld=y
CONFIG_PACKAGE_frr-bfdd=y
CONFIG_PACKAGE_frr-bgpd=y
CONFIG_PACKAGE_frr-eigrpd=y
CONFIG_PACKAGE_frr-fabricd=y
CONFIG_PACKAGE_frr-isisd=y
CONFIG_PACKAGE_frr-ldpd=y
CONFIG_PACKAGE_frr-nhrpd=y
CONFIG_PACKAGE_frr-ospf6d=y
CONFIG_PACKAGE_frr-ospfd=y
CONFIG_PACKAGE_frr-pbrd=y
CONFIG_PACKAGE_frr-pimd=y
CONFIG_PACKAGE_frr-ripd=y
CONFIG_PACKAGE_frr-ripngd=y
CONFIG_PACKAGE_frr-staticd=y
CONFIG_PACKAGE_frr-vrrpd=y
CONFIG_PACKAGE_frr-vtysh=y
CONFIG_PACKAGE_frr-watchfrr=y
CONFIG_PACKAGE_frr-zebra=y
