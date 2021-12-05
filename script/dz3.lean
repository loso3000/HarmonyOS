CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y
# 设置固件大小
CONFIG_TARGET_KERNEL_PARTSIZE=64
CONFIG_TARGET_ROOTFS_PARTSIZE=920
# EFI支持:
CONFIG_GRUB_IMAGES=y
CONFIG_EFI_IMAGES=y
# CONFIG_VMDK_IMAGES is not set
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# ipv6 
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y

#-----x86
CONFIG_PACKAGE_kmod-usb-hid=y
CONFIG_PACKAGE_lm-sensors-detect=y
CONFIG_PACKAGE_kmod-bonding=y
CONFIG_PACKAGE_kmod-mmc-spi=y
CONFIG_PACKAGE_ppp-mod-pptp=y  #VPN客户端
CONFIG_PACKAGE_kmod-vmxnet3=y
CONFIG_PACKAGE_kmod-igbvf=y
CONFIG_PACKAGE_kmod-ixgbe=y
CONFIG_PACKAGE_kmod-pcnet32=y
CONFIG_PACKAGE_kmod-r8125=y
CONFIG_PACKAGE_kmod-r8168=y
CONFIG_PACKAGE_kmod-8139cp=y
CONFIG_PACKAGE_kmod-8139too=y
CONFIG_PACKAGE_kmod-rtl8xxxu=y
CONFIG_PACKAGE_kmod-i40e=y
CONFIG_PACKAGE_kmod-i40evf=y
CONFIG_PACKAGE_kmod-ath5k=y
CONFIG_PACKAGE_kmod-ath9k=y
CONFIG_PACKAGE_kmod-ath9k-htc=y
CONFIG_PACKAGE_kmod-ath10k=y
CONFIG_PACKAGE_kmod-rt2800-usb=y
CONFIG_PACKAGE_kmod-mlx4-core=y
CONFIG_PACKAGE_kmod-mlx5-core=y
CONFIG_PACKAGE_kmod-alx=y
CONFIG_PACKAGE_kmod-tulip=y
CONFIG_PACKAGE_kmod-tg3=y
CONFIG_PACKAGE_kmod-ac97=y
CONFIG_PACKAGE_kmod-sound-via82xx=y
CONFIG_PACKAGE_alsa-utils=y
CONFIG_PACKAGE_kmod-iwlwifi=y

CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-net-aqc111=y
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
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor=m
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-roles=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
# USB3.0支持:
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y 

# 工具

CONFIG_PACKAGE_libnetfilter-queue1=y
CONFIG_PACKAGE_	libnfnetlink0=y
CONFIG_PACKAGE_libmnl0=y

CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
CONFIG_PACKAGE_acpid=y
# CONFIG_PACKAGE_smartmontools=y
# CONFIG_PACKAGE_qemu-ga=y
# CONFIG_PACKAGE_open-vm-tools=n #虚拟机支持管理性能更好
# CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_hdparm=y  #移动硬盘设置
CONFIG_PACKAGE_curl=y
# add upnp
# CONFIG_PACKAGE_irqbalance=n
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-aliyun=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
# CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
# CONFIG_PACKAGE_ddns-scripts_nsupdate=y
# CONFIG_PACKAGE_ddns-scripts_route53-v1=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset=y
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-weburl=y
# CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-timecontrol=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
# CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
# CONFIG_PACKAGE_luci-app-serverchan=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server=y
CONFIG_PACKAGE_luci-app-ttyd=n
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
CONFIG_PACKAGE_luci-app-mac=n
# CONFIG_PACKAGE_luci-app-vssr=y
# CONFIG_PACKAGE_luci-app-wrtbwmon=n
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=y
# CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=n

# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# 主题
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-opentopd=y
# 增加其它插件
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-syncdial=n
CONFIG_PACKAGE_luci-app-sqm=n
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
CONFIG_PACKAGE_luci-app-uugamebooster=y
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
