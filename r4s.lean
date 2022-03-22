# Target Config
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r2s=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4s=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_pine64_rockpro64=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_radxa_rock-pi-4=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_xunlong_orangepi-r1-plus=y
CONFIG_TARGET_ALL_PROFILES=y
# set
CONFIG_TARGET_KERNEL_PARTSIZE=60
CONFIG_TARGET_ROOTFS_PARTSIZE=920
CONFIG_DOCKER_OPTIONAL_FEATURES=y
# efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# file system
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-squashfs=y

# sd
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-roles=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
CONFIG_PACKAGE_kmod-sdhci=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-scsi-core=y
CONFIG_PACKAGE_e2fsprogs=y
# USB3.0支持:
#CONFIG_PACKAGE_kmod-usb2=y
#CONFIG_PACKAGE_kmod-usb2-pci=y
#CONFIG_PACKAGE_kmod-usb3=y
#ksmbd
CONFIG_PACKAGE_kmod-nls-utf8=y
# net
# Kmod
CONFIG_PACKAGE_kmod-drm-rockchip=y
CONFIG_PACKAGE_kmod-gpu-lima=y
CONFIG_PACKAGE_kmod-rtl8187=y
CONFIG_PACKAGE_kmod-rtl8188eu=y
CONFIG_PACKAGE_kmod-rtl8192c-common=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8192du=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-rtl88x2bu=y
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-r8168=n
CONFIG_PACKAGE_kmod-r8125=n
# USB net driver
# CONFIG_PACKAGE_kmod-drm-rockchip=y  #err
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
#USB net driver
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-net-aqc111=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
# CONFIG_PACKAGE_kmod-usb-printer is not set
CONFIG_PACKAGE_kmod-usb-roles=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
# CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor is not set
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-igc=y
CONFIG_DEFAULT_kmod-r8125=y

# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# base
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_autosamba-ksmbd=n
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=y
CONFIG_PACKAGE_luci-app-advanced=y
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=y
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-ipsec-vpnd=y
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-samba is no set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-smartdns=y
# CONFIG_PACKAGE_luci-app-ssr-plus is no set
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy=n
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray=n
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=y
CONFIG_PACKAGE_luci-app-adblock-plus=n
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# theme
CONFIG_PACKAGE_luci-theme-atmaterial_new=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-netgear=n
CONFIG_PACKAGE_luci-theme-opentomato=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-opentopd=y
#other
CONFIG_PACKAGE_luci-app-tencentddns=y
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-mwan3=n
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
# CONFIG_PACKAGE_luci-app-minidlna is not set
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
CONFIG_DEFAULT_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=y
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-nfs=y
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-oled=n

# tools
CONFIG_PACKAGE_kmod-ntfs-3g=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_blkid=y
# CONFIG_PACKAGE_qemu-ga=y
# CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_hdparm=y  #移动硬盘设置
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
CONFIG_PACKAGE_block-mount=y
# CONFIG_PACKAGE_wget-ssl=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_coremark=y

CONFIG_PACKAGE_perl=y
CONFIG_PACKAGE_perl-http-date=y
CONFIG_PACKAGE_perlbase-getopt=y
CONFIG_PACKAGE_perlbase-time=y
CONFIG_PACKAGE_perlbase-unicode=y
CONFIG_PACKAGE_perlbase-utf8=y

