CONFIG_TARGET_ath79=y
CONFIG_TARGET_ath79_generic=y
CONFIG_TARGET_ath79_generic_DEVICE_glinet_gl-ar300m16=y
CONFIG_TARGET_ath79_generic_DEVICE_glinet_gl-ar300m-lite=y

# CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
# 不压缩efi
CONFIG_TARGET_ROOTFS_TARGZ=n
# CONFIG_TARGET_IMAGES_GZIP is not set
#add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
# CONFIG_PACKAGE_luci-app-upnp is not set
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=n
#base插件
CONFIG_PACKAGE_autosamba=y
CONFIG_PACKAGE_luci-app-samba=y
# CONFIG_PACKAGE_autocore-arm is not set
# CONFIG_PACKAGE_my-autocore-arm=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_autosamba-samba4=n
CONFIG_PACKAGE_luci-app-samba4=n
#base插件
CONFIG_PACKAGE_ddns-scripts=n
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=n
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=n
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=n
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-ipsec-serve=n
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
CONFIG_PACKAGE_luci-app-softethervpn=n
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
