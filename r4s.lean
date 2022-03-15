
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4s=y

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
CONFIG_PACKAGE_luci-i18n-base-en=y
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y
# CONFIG_PACKAGE_luci-i18n-base-zh-tw is not set
 CONFIG_PACKAGE_rtl8192ce-firmware=y
CONFIG_PACKAGE_rtl8192de-firmware=y
CONFIG_PACKAGE_rtl8192se-firmware=y
CONFIG_PACKAGE_rtl8723au-firmware=y
CONFIG_PACKAGE_rtl8723bs-firmware=y
CONFIG_PACKAGE_rtl8723bu-firmware=y
CONFIG_PACKAGE_rtl8821ae-firmware=y
CONFIG_PACKAGE_rtl8822be-firmware=y
CONFIG_PACKAGE_rtl8822ce-firmware=y
CONFIG_PACKAGE_kmod-rtw88-usb=y
CONFIG_PACKAGE_kmod-rtw88=y
CONFIG_PACKAGE_kmod-rtl8180=y
CONFIG_PACKAGE_kmod-rtl8192ce=y
CONFIG_PACKAGE_kmod-rtl8192de=y
CONFIG_PACKAGE_kmod-rtl8192se=y
CONFIG_PACKAGE_kmod-rtl8723bs=y
CONFIG_PACKAGE_kmod-rtl8821ae=y
CONFIG_PACKAGE_kmod-rtl88x2bu=y
#
# USB Support  4G
#
# CONFIG_PACKAGE_kmod-chaoskey is not set
# CONFIG_PACKAGE_kmod-usb-acm is not set
# CONFIG_PACKAGE_kmod-usb-atm is not set
# CONFIG_PACKAGE_kmod-usb-cm109 is not set
CONFIG_PACKAGE_kmod-usb-core=y  #4G
CONFIG_PACKAGE_kmod-usb-dwc2=y 
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-hid=y
# CONFIG_PACKAGE_kmod-usb-hid-cp2112 is not set
# CONFIG_PACKAGE_kmod-usb-ledtrig-usbport is not set
CONFIG_PACKAGE_kmod-usb-net=y  #4G
# CONFIG_PACKAGE_kmod-usb-net-aqc111 is not set
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
# CONFIG_PACKAGE_kmod-usb-net-rtl8152 is not set
CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor=y

CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
# CONFIG_PACKAGE_kmod-usb-net-smsc75xx is not set
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-ohci=y
# CONFIG_PACKAGE_kmod-usb-ohci-pci is not set
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-roles=y
CONFIG_PACKAGE_kmod-usb-serial=y
# CONFIG_PACKAGE_kmod-usb-serial-ark3116 is not set
# CONFIG_PACKAGE_kmod-usb-serial-belkin is not set
CONFIG_PACKAGE_kmod-usb-serial-ch341=y
CONFIG_PACKAGE_kmod-usb-serial-cp210x=y
# CONFIG_PACKAGE_kmod-usb-serial-cypress-m8 is not set
# CONFIG_PACKAGE_kmod-usb-serial-dmx_usb_module is not set
# CONFIG_PACKAGE_kmod-usb-serial-edgeport is not set
# CONFIG_PACKAGE_kmod-usb-serial-ftdi is not set
# CONFIG_PACKAGE_kmod-usb-serial-garmin is not set
# CONFIG_PACKAGE_kmod-usb-serial-ipw is not set
# CONFIG_PACKAGE_kmod-usb-serial-keyspan is not set
# CONFIG_PACKAGE_kmod-usb-serial-mct is not set
# CONFIG_PACKAGE_kmod-usb-serial-mos7720 is not set
# CONFIG_PACKAGE_kmod-usb-serial-mos7840 is not set
CONFIG_PACKAGE_kmod-usb-serial-option=y
# CONFIG_PACKAGE_kmod-usb-serial-oti6858 is not set
CONFIG_PACKAGE_kmod-usb-serial-pl2303=y
# CONFIG_PACKAGE_kmod-usb-serial-qualcomm is not set
# CONFIG_PACKAGE_kmod-usb-serial-sierrawireless is not set
# CONFIG_PACKAGE_kmod-usb-serial-simple is not set
# CONFIG_PACKAGE_kmod-usb-serial-ti-usb is not set
# CONFIG_PACKAGE_kmod-usb-serial-visor is not set
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
# CONFIG_PACKAGE_kmod-usb-serial-xr_usb_serial_common is not set
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
# CONFIG_PACKAGE_kmod-usb-storage-uas is not set
# CONFIG_PACKAGE_kmod-usb-test is not set
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
# CONFIG_PACKAGE_kmod-usb-yealink is not set
CONFIG_PACKAGE_kmod-usb2=y
# CONFIG_PACKAGE_kmod-usb2-pci is not set
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usbip=y
CONFIG_PACKAGE_kmod-usbip-client=y
CONFIG_PACKAGE_kmod-usbip-server=y
CONFIG_PACKAGE_kmod-usbmon=y
# end of USB Support

# file system
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs  is not set

CONFIG_PACKAGE_kmod-fs-autofs4=y
CONFIG_PACKAGE_kmod-fs-btrfs=y
CONFIG_PACKAGE_kmod-fs-cifs=y
# CONFIG_PACKAGE_kmod-fs-configfs is not set
# CONFIG_PACKAGE_kmod-fs-cramfs is not set
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-exportfs=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-common-rpcsec=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-nfsd=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-hid=y
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-net2280=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usbip=y
CONFIG_PACKAGE_kmod-usbip-client=y
CONFIG_PACKAGE_kmod-usbip-server=y
CONFIG_PACKAGE_kmod-usbmon=y

CONFIG_PACKAGE_kmod-rtl8187=y
CONFIG_PACKAGE_kmod-rtl8188eu=y
CONFIG_PACKAGE_kmod-rtl8192c-common=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
CONFIG_PACKAGE_kmod-rtl8814au-ac=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-rtl8192eu=y
CONFIG_PACKAGE_kmod-rtl8xxxu=y
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
CONFIG_PACKAGE_kmod-zd1211rw=y
CONFIG_PACKAGE_ath9k-htc-firmware=y
CONFIG_PACKAGE_aliyundrive-webdav=y
CONFIG_PACKAGE_libertas-usb-firmware=y
CONFIG_PACKAGE_mt7601u-firmware=y
CONFIG_PACKAGE_p54-usb-firmware=y
CONFIG_PACKAGE_prism54-firmware=y
CONFIG_PACKAGE_rs9113-firmware=y
CONFIG_PACKAGE_rt2800-usb-firmware=y
CONFIG_PACKAGE_rt73-usb-firmware=y
CONFIG_PACKAGE_rtl8188eu-firmware=y
CONFIG_PACKAGE_rtl8192cu-firmware=y
CONFIG_PACKAGE_rtl8192eu-firmware=y
CONFIG_PACKAGE_rtl8192su-firmware=y
CONFIG_PACKAGE_rtl8723au-firmware=y
CONFIG_PACKAGE_rtl8723bu-firmware=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# CONFIG_VMDK_IMAGES is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
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
CONFIG_PACKAGE_rtl8188eu-firmware=y
CONFIG_PACKAGE_rtl8192cu-firmware=y
CONFIG_PACKAGE_rtl8192eu-firmware=y
CONFIG_PACKAGE_rtl8192su-firmware=y
CONFIG_PACKAGE_rtl8723au-firmware=y
CONFIG_PACKAGE_rtl8723bu-firmware=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=y
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=y
CONFIG_PACKAGE_luci-app-advanced=y
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=y
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_kmod_md_raid456=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_kmod_md_linear=y
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
# CONFIG_PACKAGE_luci-app-filetransfer is no set
CONFIG_PACKAGE_luci-app-smartdns=y
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_flow-offload=n
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=y
CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=y
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-mosdns=n
CONFIG_PACKAGE_luci-app-ikoolproxy=y
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
# CONFIG_PACKAGE_luci-app-wireguard is not set
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
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-guest-wifi=y
CONFIG_PACKAGE_luci-app-wifischedule=y
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-mwan3=y
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
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=n
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_DEFAULT_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=n
CONFIG_PACKAGE_luci-app-transmission=n
CONFIG_PACKAGE_luci-app-usb-printer=n
CONFIG_PACKAGE_luci-app-mwan3helper=n
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-nfs=n
# CONFIG_PACKAGE_luci-app-openvpn-server is not set
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n

CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts-cloudflare=y

CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_nsupdate=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y
CONFIG_PACKAGE_iperf3=y
CONFIG_PACKAGE_minieap=y
CONFIG_PACKAGE_rsync=y
CONFIG_PACKAGE_rsyncd=y
CONFIG_PACKAGE_bind-dig=y
CONFIG_PACKAGE_bind-host=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_pandownload-fake-server=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_xl2tpd=y


CONFIG_PACKAGE_apk=y
CONFIG_PACKAGE_alpine-keys=y
CONFIG_PACKAGE_alpine-repositories=y
CONFIG_PACKAGE_bsdtar=y
CONFIG_PACKAGE_bzip2=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_gzip=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_zip=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_fstrim=y
CONFIG_PACKAGE_gpioctl-sysfs=y
CONFIG_PACKAGE_gpiod-tools=y
CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_lscpu=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_shadow-chsh=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_snmpd=y
CONFIG_PACKAGE_tmux=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_whereis=y
CONFIG_PACKAGE_gotop=y
CONFIG_PACKAGE_tmate=y

CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_qmi-utils=y
CONFIG_PACKAGE_umbim=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_comgt-ncm=y
CONFIG_PACKAGE_luci-proto-ncm=y
CONFIG_PACKAGE_comgt=y
CONFIG_PACKAGE_kmod-usb-acm=y

CONFIG_PACKAGE_libimobiledevice-utils=y
CONFIG_PACKAGE_libplist-utils=y
CONFIG_PACKAGE_libusbmuxd-utils=y

CONFIG_PACKAGE_usbmuxd=y
CONFIG_PACKAGE_libwslay=y
CONFIG_PACKAGE_libudev-fbsd=y
CONFIG_PACKAGE_hostapd=y
CONFIG_PACKAGE_hostapd-basic=y
CONFIG_PACKAGE_hostapd-utils=y
CONFIG_PACKAGE_hostapd-common=y
CONFIG_DRIVER_11AC_SUPPORT=y
CONFIG_DRIVER_11N_SUPPORT=y
CONFIG_DRIVER_11W_SUPPORT=y
CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_wpad=y
CONFIG_PACKAGE_wpad-mini=y
CONFIG_PACKAGE_wpad-openssl=y
CONFIG_PACKAGE_wpa-supplicant=y
CONFIG_DEVEL=y
CONFIG_CCACHE=y
