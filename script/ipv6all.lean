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
CONFIG_TARGET_ROOTFS_TARGZ=n
# CONFIG_TARGET_IMAGES_GZIP is not set
#ipv6
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
# CONFIG_PACKAGE_kmod-r8169 is not set
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
CONFIG_PACKAGE_ath10k-firmware-qca9888=y
CONFIG_PACKAGE_ath10k-firmware-qca988x=y
CONFIG_PACKAGE_ath10k-firmware-qca9984=y
CONFIG_PACKAGE_brcmfmac-firmware-43602a1-pcie=y
CONFIG_PACKAGE_kmod-ac97=y
CONFIG_PACKAGE_kmod-sound-via82xx=y
CONFIG_PACKAGE_alsa-utils=y
CONFIG_PACKAGE_kmod-iwlwifi=y
CONFIG_PACKAGE_usbutils=y
# 工具
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_acpid=y
CONFIG_PACKAGE_blkid=y
## CONFIG_PACKAGE_qemu-ga=y
CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_open-vm-tools=y #虚拟机支持管理性能更好
CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具

CONFIG_PACKAGE_i915-firmware=y

# 所集成的固件类型
# CONFIG_TARGET_ROOTFS_INITRAMFS is not set
# CONFIG_TARGET_ROOTFS_CPIOGZ is not set
CONFIG_TARGET_ROOTFS_TARGZ=y
# CONFIG_TARGET_ROOTFS_EXT4FS is not set
CONFIG_TARGET_ROOTFS_SQUASHFS=y
CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256
CONFIG_TARGET_UBIFS_FREE_SPACE_FIXUP=y
CONFIG_TARGET_UBIFS_JOURNAL_SIZE=""
CONFIG_GRUB_IMAGES=y
CONFIG_GRUB_EFI_IMAGES=y
# CONFIG_GRUB_CONSOLE is not set
CONFIG_GRUB_BOOTOPTS="nomodeset"
CONFIG_GRUB_TIMEOUT="0"
CONFIG_GRUB_TITLE="OpenWrt"
# CONFIG_ISO_IMAGES is not set
# CONFIG_VDI_IMAGES is not set
# CONFIG_VMDK_IMAGES is not set
# CONFIG_VMDK_IMAGES is not set

# CONFIG_SIGNATURE_CHECK is not set
# CONFIG_SIGNED_PACKAGES is not set

# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
#ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_6rd=y
CONFIG_PACKAGE_6to4=y

# CONFIG_PACKAGE_kmod-zram=y
# CONFIG_PACKAGE_zram-swap=y
##测试内核开关，默认5.10内核，关闭5.15内核 “# CONFIG_TESTING_KERNEL is not set”即可关闭5.15内核！
#5.15属于测试内核暂时添加到配置文件！测试几天！
# CONFIG_TESTING_KERNEL=y

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

# USB3.0支持:
#CONFIG_PACKAGE_kmod-usb2=y
#CONFIG_PACKAGE_kmod-usb2-pci=y
#CONFIG_PACKAGE_kmod-usb3=y


CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y

#3G/4G Support
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_kmod-usb-acm=y

#USB net driver

CONFIG_PACKAGE_usb-modeswitch=y

# CONFIG_PACKAGE_kmod-usb-net-asix is not set
# CONFIG_PACKAGE_kmod-usb-net-asix-ax88179 is not set
# CONFIG_PACKAGE_kmod-usb-net-rtl8152 is not set
CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor=y


CONFIG_PACKAGE_kmod-usb-net-rndis=y

#USB net driver
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-mt76=y
CONFIG_PACKAGE_kmod-mt76x2u=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y

#-----x86
CONFIG_PACKAGE_kmod-usb-hid=y
# CONFIG_PACKAGE_lm-sensors-detect=y
CONFIG_PACKAGE_kmod-bonding=y
CONFIG_PACKAGE_kmod-mmc-spi=y
CONFIG_PACKAGE_ppp-mod-pptp=y  #VPN客户端
CONFIG_PACKAGE_kmod-vmxnet3=y
CONFIG_PACKAGE_kmod-igbvf=y
CONFIG_PACKAGE_kmod-ixgbe=y
CONFIG_PACKAGE_kmod-pcnet32=y
CONFIG_PACKAGE_kmod-r8125=y
CONFIG_PACKAGE_kmod-r8168=y
# CONFIG_PACKAGE_kmod-r8169 is not set
CONFIG_PACKAGE_kmod-8139cp=y
CONFIG_PACKAGE_kmod-8139too=y
CONFIG_PACKAGE_kmod-igc=y
CONFIG_PACKAGE_kmod-e1000e=y
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
CONFIG_PACKAGE_ath10k-firmware-qca9888=y
CONFIG_PACKAGE_ath10k-firmware-qca988x=y
CONFIG_PACKAGE_ath10k-firmware-qca9984=y
CONFIG_PACKAGE_brcmfmac-firmware-43602a1-pcie=y
CONFIG_PACKAGE_alsa-utils=y
CONFIG_PACKAGE_kmod-iwlwifi=y
# 工具
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set

CONFIG_PACKAGE_p910nd=y
CONFIG_PACKAGE_luci-app-p910nd=y

CONFIG_PACKAGE_acpid=y
CONFIG_PACKAGE_blkid=y
# CONFIG_PACKAGE_qemu-ga=y
CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_open-vm-tools=y #虚拟机支持管理性能更好
CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_hdparm=y  #移动硬盘设置
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp

CONFIG_PACKAGE_wpad-openssl=y
CONFIG_PACKAGE_wget-ssl=y
CONFIG_PACKAGE_xray-geodata=y
CONFIG_PACKAGE_xl2tpd=y

CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_block-mount=y

#add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
#base
CONFIG_PACKAGE_ddns-scripts=y
#CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
#CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
#CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts-cloudflare=y
CONFIG_PACKAGE_ddns-scripts-dnspod=y
CONFIG_PACKAGE_ddns-scripts-aliyun=y

CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_nsupdate=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y

# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autocore=y
CONFIG_PACKAGE_autocore-x86=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol=y
CONFIG_PACKAGE_luci-app-control-weburl=y
# CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-timecontrol=y
# CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-jd-dailybonus=y
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y 
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server is not set
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_obfs_server=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=y
CONFIG_PACKAGE_luci-app-pushbot=y
CONFIG_PACKAGE_luci-app-dnsfilter=n
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-kodexplorer=y
CONFIG_PACKAGE_luci-app-uhttpd=y
CONFIG_PACKAGE_luci-app-mentohust=y
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-wifimac=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-mac=y
CONFIG_PACKAGE_luci-app-vsftpd=y
# CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=y
CONFIG_PACKAGE_luci-app-wifidog=n
CONFIG_PACKAGE_wifidog=n
CONFIG_PACKAGE_luci-app-ikoolproxy=y
#主题
CONFIG_PACKAGE_luci-theme-argon_new=y
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=n
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
#增加其它插件
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=y
CONFIG_PACKAGE_luci-app-xlnetacc=y
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-minidlna=y
CONFIG_PACKAGE_luci-app-rclone=y
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=y
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=y
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=y
CONFIG_PACKAGE_luci-app-pptp-server=y
CONFIG_PACKAGE_luci-app-pppoe-server=y
CONFIG_PACKAGE_luci-app-ipsec-vpnd=y
# CONFIG_PACKAGE_luci-app-ipsec-serve=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=y
CONFIG_PACKAGE_luci-app-docker=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_PACKAGE_luci-app-koolddns=y
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=y
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-mwan3helper=y
CONFIG_PACKAGE_luci-app-qbittorrent=y
CONFIG_PACKAGE_luci-app-familycloud=y
CONFIG_PACKAGE_luci-app-nps=y
CONFIG_PACKAGE_luci-app-frpc=y
#CONFIG_PACKAGE_luci-app-nfs=y
CONFIG_PACKAGE_luci-app-openvpn-server=y
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-openvpn=y
CONFIG_PACKAGE_luci-app-sqm=y
#network 
CONFIG_PACKAGE_bnx2x-firmware=y
CONFIG_PACKAGE_e100-firmware=y
CONFIG_PACKAGE_kmod-3c59x=y
CONFIG_PACKAGE_kmod-atl1=y
CONFIG_PACKAGE_kmod-atl1c=y
CONFIG_PACKAGE_kmod-atl1e=y
CONFIG_PACKAGE_kmod-atl2=y
CONFIG_PACKAGE_kmod-atm=y
CONFIG_PACKAGE_kmod-b44=y
CONFIG_PACKAGE_kmod-be2net=y
CONFIG_PACKAGE_kmod-bnx2x=y
CONFIG_PACKAGE_kmod-dm9000=y
CONFIG_PACKAGE_kmod-dummy=y
CONFIG_PACKAGE_kmod-e100=y
CONFIG_PACKAGE_kmod-et131x=y
CONFIG_PACKAGE_kmod-ethoc=y
CONFIG_PACKAGE_kmod-hfcmulti=y
CONFIG_PACKAGE_kmod-hfcpci=y
CONFIG_PACKAGE_kmod-iavf=y
CONFIG_PACKAGE_kmod-ixgbevf=y
CONFIG_PACKAGE_kmod-lib-crc32c=y
CONFIG_PACKAGE_kmod-mdio-gpio=y
CONFIG_PACKAGE_kmod-misdn=y
CONFIG_PACKAGE_kmod-natsemi=y
CONFIG_PACKAGE_kmod-ne2k-pci=y
CONFIG_PACKAGE_kmod-niu=y
CONFIG_PACKAGE_kmod-of-mdio=y
CONFIG_PACKAGE_kmod-phy-bcm84881=y
CONFIG_PACKAGE_kmod-phy-broadcom=y
CONFIG_PACKAGE_kmod-phy-realtek=y
CONFIG_PACKAGE_kmod-phylib-broadcom=y
CONFIG_PACKAGE_kmod-phylink=y
CONFIG_PACKAGE_kmod-random-core=y
CONFIG_PACKAGE_kmod-sfp=y
CONFIG_PACKAGE_kmod-siit=y
CONFIG_PACKAGE_kmod-sis190=y
CONFIG_PACKAGE_kmod-sis900=y
CONFIG_PACKAGE_kmod-skge=y
CONFIG_PACKAGE_kmod-sky2=y
CONFIG_PACKAGE_kmod-solos-pci=y
CONFIG_PACKAGE_kmod-spi-ks8995=y
CONFIG_PACKAGE_kmod-ssb=y
CONFIG_PACKAGE_kmod-swconfig=y
CONFIG_PACKAGE_kmod-switch-bcm53xx=y
CONFIG_PACKAGE_kmod-switch-bcm53xx-mdio=y
CONFIG_PACKAGE_kmod-switch-ip17xx=y
CONFIG_PACKAGE_kmod-switch-mvsw61xx=y
CONFIG_PACKAGE_kmod-switch-rtl8306=y
CONFIG_PACKAGE_kmod-switch-rtl8366-smi=y
CONFIG_PACKAGE_kmod-switch-rtl8366rb=y
CONFIG_PACKAGE_kmod-switch-rtl8366s=y
CONFIG_PACKAGE_kmod-switch-rtl8367b=y
CONFIG_PACKAGE_kmod-usb-atm=y
CONFIG_PACKAGE_kmod-usb-atm-cxacru=y
CONFIG_PACKAGE_kmod-usb-atm-speedtouch=y
CONFIG_PACKAGE_kmod-usb-atm-ueagle=y
CONFIG_PACKAGE_kmod-usb-cm109=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-yealink=y
CONFIG_PACKAGE_kmod-usbip=y
CONFIG_PACKAGE_kmod-usbip-client=y
CONFIG_PACKAGE_kmod-usbip-server=y
CONFIG_PACKAGE_kmod-usbmon=y
CONFIG_PACKAGE_kmod-via-rhine=y
CONFIG_PACKAGE_kmod-via-velocity=y
