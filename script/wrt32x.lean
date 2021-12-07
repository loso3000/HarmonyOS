
# Build Linksys_WRT32X Firmware:
CONFIG_TARGET_mvebu=y
CONFIG_TARGET_mvebu_cortexa9=y
CONFIG_TARGET_mvebu_cortexa9_DEVICE_linksys_wrt32x=y

# Firmware Type:
CONFIG_USES_DEVICETREE=y
CONFIG_USES_INITRAMFS=y
CONFIG_USES_SQUASHFS=y
CONFIG_USES_EXT4=y
CONFIG_USES_TARGZ=y
CONFIG_USES_CPIOGZ=y
# CONFIG_TARGET_ROOTFS_EXT4FS is not set
CONFIG_TARGET_ROOTFS_SQUASHFS=y
CONFIG_TARGET_UBIFS_FREE_SPACE_FIXUP=y
CONFIG_TARGET_UBIFS_JOURNAL_SIZE=""

# luci-i18n-base:
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y
CONFIG_PACKAGE_luci-i18n-base-en=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y

CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs  is not set
# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-aliyun=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
# CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
# CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
# CONFIG_PACKAGE_ddns-scripts_nsupdate=y
# CONFIG_PACKAGE_ddns-scripts_route53-v1=y
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=y
# CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-timecontrol=y
# CONFIG_PACKAGE_luci-app-webadmin=n
# CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle=n
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=n
# CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe=n
# CONFIG_PACKAGE_luci-app-flowoffload=n
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client is not set
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
CONFIG_PACKAGE_luci-app-mac=n
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-wrtbwmon=n
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=n
# CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=n
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-kodexplorer=n
# CONFIG_PACKAGE_luci-app-uhttpd=n
# CONFIG_PACKAGE_luci-app-mentohust=y
# CONFIG_PACKAGE_luci-app-easymesh=n
# CONFIG_PACKAGE_luci-app-wifimac=n
# CONFIG_PACKAGE_luci-app-ttnode=n
# CONFIG_PACKAGE_luci-app-adblock-plus=n
# CONFIG_PACKAGE_luci-app-change-mac=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-arpbind=n
CONFIG_PACKAGE_luci-app-ddns=y
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
#主题
CONFIG_LUCI_LANG_en=y
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=n
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=n
CONFIG_PACKAGE_luci-theme-bootstrap=y
# 增加其它插件
# CONFIG_PACKAGE_luci-app-ksmbd=n
# CONFIG_PACKAGE_luci-app-cifsd=n
# CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=n
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone=n
# CONFIG_PACKAGE_luci-app-pptp-server=n
# CONFIG_PACKAGE_luci-app-pppoe-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-ipsec-serve=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=n
# CONFIG_PACKAGE_luci-app-docker=n
# CONFIG_PACKAGE_luci-app-dockerman=n
# CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
# CONFIG_PACKAGE_luci-app-softethervpn=n
CONFIG_PACKAGE_luci-app-uugamebooster=y
# CONFIG_DEFAULT_luci-app-cpufreq=n
# CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=n
# CONFIG_PACKAGE_luci-app-oaf=n
# CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer=n
# CONFIG_PACKAGE_luci-app-mwan3helper=n
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
# CONFIG_PACKAGE_luci-app-familycloud=n
# CONFIG_PACKAGE_luci-app-nps=n
# CONFIG_PACKAGE_luci-app-frpc=n
# CONFIG_PACKAGE_luci-app-nfs=n
# CONFIG_PACKAGE_luci-app-openvpn-server=n
# CONFIG_PACKAGE_luci-app-aria2=n
# CONFIG_PACKAGE_luci-app-openvpn=n