# Build R2S Firmware:
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_rockchip_armv8_DEVICE_friendlyarm_nanopi-r2s=y
# Set firmware size:
CONFIG_TARGET_KERNEL_PARTSIZE=64
CONFIG_TARGET_ROOTFS_PARTSIZE=920

# Firmware Type:
CONFIG_USES_DEVICETREE=y
CONFIG_USES_INITRAMFS=y
CONFIG_USES_SQUASHFS=y
CONFIG_USES_EXT4=y
CONFIG_USES_TARGZ=y
CONFIG_USES_CPIOGZ=y
CONFIG_TARGET_ROOTFS_EXT4FS=y
CONFIG_TARGET_ROOTFS_SQUASHFS=y
CONFIG_TARGET_UBIFS_FREE_SPACE_FIXUP=y
CONFIG_TARGET_UBIFS_JOURNAL_SIZE=""

# luci-i18n-base:
# CONFIG_PACKAGE_luci-i18n-base-bg is not set
# CONFIG_PACKAGE_luci-i18n-base-ca is not set
# CONFIG_PACKAGE_luci-i18n-base-cs is not set
# CONFIG_PACKAGE_luci-i18n-base-de is not set
# CONFIG_PACKAGE_luci-i18n-base-el is not set
CONFIG_PACKAGE_luci-i18n-base-en=y
# CONFIG_PACKAGE_luci-i18n-base-es is not set
# CONFIG_PACKAGE_luci-i18n-base-fr is not set
# CONFIG_PACKAGE_luci-i18n-base-he is not set
# CONFIG_PACKAGE_luci-i18n-base-hi is not set
# CONFIG_PACKAGE_luci-i18n-base-hu is not set
# CONFIG_PACKAGE_luci-i18n-base-it is not set
# CONFIG_PACKAGE_luci-i18n-base-ja is not set
# CONFIG_PACKAGE_luci-i18n-base-ko is not set
# CONFIG_PACKAGE_luci-i18n-base-ms is not set
# CONFIG_PACKAGE_luci-i18n-base-no is not set
# CONFIG_PACKAGE_luci-i18n-base-pl is not set
# CONFIG_PACKAGE_luci-i18n-base-pt is not set
# CONFIG_PACKAGE_luci-i18n-base-pt-br is not set
# CONFIG_PACKAGE_luci-i18n-base-ro is not set
# CONFIG_PACKAGE_luci-i18n-base-ru is not set
# CONFIG_PACKAGE_luci-i18n-base-sk is not set
# CONFIG_PACKAGE_luci-i18n-base-sv is not set
# CONFIG_PACKAGE_luci-i18n-base-tr is not set
# CONFIG_PACKAGE_luci-i18n-base-uk is not set
# CONFIG_PACKAGE_luci-i18n-base-vi is not set
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y
# CONFIG_PACKAGE_luci-i18n-base-zh-tw is not set

# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# CONFIG_VMDK_IMAGES is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# file system
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs  is not set
# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# 工具
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_cfdisk=y #分区工具
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
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=y
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=n
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
# CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-smartdns=n
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=n
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_flow-offload=n
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray
CONFIG_PACKAGE_luci-app-dnsfilter=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
# 主题
CONFIG_PACKAGE_luci-theme-atmaterial=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
#增加其它插件
CONFIG_PACKAGE_luci-app-sqm=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-guest-wifi=n
CONFIG_PACKAGE_luci-app-wifischedule=n
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-mwan3=n
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
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
CONFIG_PACKAGE_luci-app-uugamebooster=n
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
CONFIG_PACKAGE_luci-app-transmission=n
CONFIG_PACKAGE_luci-app-usb-printer=n
CONFIG_PACKAGE_luci-app-mwan3helper=n
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n
