CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7620=y
CONFIG_TARGET_ramips_mt7620_DEVICE_xiaomi_miwifi-r3=y
# CONFIG_PACKAGE_iptables-mod-extra is not set
# CONFIG_PACKAGE_iptables-mod-tproxy is not set
CONFIG_PACKAGE_kmod-crypto-des=y
CONFIG_PACKAGE_kmod-crypto-md5=y
# CONFIG_PACKAGE_kmod-inet-diag is not set
# CONFIG_PACKAGE_kmod-ip6tables is not set
# CONFIG_PACKAGE_kmod-ipt-extra is not set
# CONFIG_PACKAGE_kmod-ipt-tproxy is not set
CONFIG_PACKAGE_kmod-mt7603=y
# CONFIG_PACKAGE_kmod-nf-ipt6 is not set
# CONFIG_PACKAGE_kmod-nf-reject6 is not set
# CONFIG_PACKAGE_kmod-tun is not set
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
# CONFIG_PACKAGE_kmod-usb-ohci is not set
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
# CONFIG_PACKAGE_kmod-usb2 is not set
CONFIG_PACKAGE_kmod-usb3=y
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
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-antfs=y
CONFIG_PACKAGE_kmod-fs-ext4=y
# add upnp
CONFIG_PACKAGE_irqbalance=n
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=n
# 工具
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_default-settings=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-advanced=n
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
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
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-timecontrol=n
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_flow-offload=n
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-wrtbwmon=n
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy=n
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=n
#主题
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
#增加其它插件
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-mwan3=n
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_UnblockNeteaseMusic_Go=y
# CONFIG_UnblockNeteaseMusic_NodeJS=y
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
CONFIG_PACKAGE_luci-app-socat=y
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


CONFIG_PACKAGE_luci-app-beardropper=n
CONFIG_PACKAGE_luci-app-control-parentcontrol=y

## File System Drivers
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
CONFIG_DEFAULT_kmod-fs-vfat=y
CONFIG_PACKAGE_ntfs-3g=n
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
#CONFIG_PACKAGE_antfs-mount=y
#CONFIG_PACKAGE_kmod-fs-antfs=n
#CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_block-mount=y