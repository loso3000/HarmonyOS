CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y
# 设置固件大小
# CONFIG_TARGET_KERNEL_PARTSIZE=64
# CONFIG_TARGET_ROOTFS_PARTSIZE=1516
# EFI支持:
CONFIG_GRUB_IMAGES=y
CONFIG_EFI_IMAGES=y
# CONFIG_VMDK_IMAGES is not set
# 不压缩efi
# CONFIG_TARGET_ROOTFS_TARGZ is not set
# CONFIG_TARGET_IMAGES_GZIP is not set
# Wireless
# CONFIG_PACKAGE_wpad-basic-wolfssl is not set
# ipv6
# CONFIG_PACKAGE_ipv6helper=y
# CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# 添加SD卡支持
CONFIG_PACKAGE_kmod-mmc=y
CONFIG_PACKAGE_kmod-sdhci=y
# 添加USB扩展支持
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_librt=y
# x86
CONFIG_PACKAGE_kmod-usb-hid=y
CONFIG_PACKAGE_qemu-ga=y
CONFIG_PACKAGE_lm-sensors-detect=y
CONFIG_PACKAGE_kmod-bonding=y
CONFIG_PACKAGE_kmod-mmc-spi=y
CONFIG_PACKAGE_ppp-mod-pptp=y 
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
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_ath10k-firmware-qca9888=y
CONFIG_PACKAGE_ath10k-firmware-qca988x=y
CONFIG_PACKAGE_ath10k-firmware-qca9984=y
CONFIG_PACKAGE_brcmfmac-firmware-43602a1-pcie=y
CONFIG_PACKAGE_kmod-ac97=y
CONFIG_PACKAGE_kmod-sound-via82xx=y
# CONFIG_PACKAGE_alsa-utils=y
# CONFIG_PACKAGE_kmod-iwlwifi=y
# 工具
CONFIG_PACKAGE_acpid=y
CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_open-vm-tools=y
CONFIG_PACKAGE_ethtool=y
# CONFIG_PACKAGE_iperf3=y
# CONFIG_PACKAGE_python3=y
CONFIG_PACKAGE_snmpd=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_hdparm=y
CONFIG_PACKAGE_curl=y
# USB3.0支持:
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
# CONFIG_PACKAGE_kmod-usb-audio=y
# CONFIG_PACKAGE_kmod-usb-printer=y
# USB net driver
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
CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
# cifsmount
CONFIG_PACKAGE_kmod-nls-utf8=y
CONFIG_PACKAGE_kmod-crypto-misc=y
# add upnp
# CONFIG_PACKAGE_irqbalance is not set
# CONFIG_PACKAGE_luci-app-upnp is not set
# CONFIG_PACKAGE_luci-app-boostupnp is not set
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=n
# base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-aliyun=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_nsupdate=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_autosamba-ksmbd is not set
CONFIG_PACKAGE_autosamba-samba4=n
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-adguardhome is not set
CONFIG_PACKAGE_luci-app-advanced=n
# CONFIG_PACKAGE_luci-app-autotimeset is not set
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol is not set
CONFIG_PACKAGE_luci-app-control-weburl=n
# CONFIG_PACKAGE_luci-app-control-webrestriction is not set
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=n
# CONFIG_PACKAGE_luci-app-webadmin is not set
# CONFIG_PACKAGE_luci-app-cpulimit is not set
# CONFIG_PACKAGE_luci-app-diskman is not set
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos is not set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle is not set
# CONFIG_PACKAGE_luci-app-jd-dailybonus is not set
CONFIG_PACKAGE_luci-app-koolproxyR=n
# CONFIG_PACKAGE_luci-app-netdata is not set
# CONFIG_PACKAGE_luci-app-onliner is not set
CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-passwall=n
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server is not set
CONFIG_PACKAGE_luci-app-ssrpro=n
# CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Rust_Server is not set
CONFIG_PACKAGE_luci-app-ttyd=n
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
CONFIG_PACKAGE_luci-app-mac=n
# CONFIG_PACKAGE_luci-app-vssr is not set
# CONFIG_PACKAGE_luci-app-wrtbwmon is not set
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
# CONFIG_PACKAGE_luci-app-dnsto is not set
CONFIG_PACKAGE_luci-app-bypass=n
CONFIG_PACKAGE_luci-app-dnsfilter=n
# CONFIG_PACKAGE_luci-app-kodexplorer is not set
# CONFIG_PACKAGE_luci-app-uhttpd is not set
# CONFIG_PACKAGE_luci-app-mentohust is not set
# CONFIG_PACKAGE_luci-app-easymesh is not set
# CONFIG_PACKAGE_luci-app-wifimac is not set
# CONFIG_PACKAGE_luci-app-ttnode is not set
# CONFIG_PACKAGE_luci-app-adblock-plus is not set
# CONFIG_PACKAGE_luci-app-change-mac is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
CONFIG_PACKAGE_luci-app-ddns=y
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-upnp is not set

#主题
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
# 增加其它插件
# CONFIG_PACKAGE_luci-app-ksmbd is not set
# CONFIG_PACKAGE_luci-app-cifsd is not set
# CONFIG_PACKAGE_luci-app-cifs-mount is not set
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-unblockneteasemusic=n
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
CONFIG_PACKAGE_luci-app-mwan3=n
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
# CONFIG_PACKAGE_luci-app-pptp-server is not set
# CONFIG_PACKAGE_luci-app-pppoe-server is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-ipsec-serve is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers is not set
# CONFIG_PACKAGE_luci-app-docker is not set
# CONFIG_PACKAGE_luci-app-dockerman is not set
# CONFIG_PACKAGE_luci-app-koolddns is not set
# CONFIG_PACKAGE_luci-app-syncdial is not set
# CONFIG_PACKAGE_luci-app-softethervpn is not set
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
# CONFIG_DEFAULT_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-udpxy is not set
# CONFIG_PACKAGE_luci-app-socat is not set
# CONFIG_PACKAGE_luci-app-oaf is not set
# CONFIG_PACKAGE_luci-app-transmission is not set
# CONFIG_PACKAGE_luci-app-usb-printer is not set
# CONFIG_PACKAGE_luci-app-mwan3helper is not set
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
# CONFIG_PACKAGE_luci-app-familycloud is not set
# CONFIG_PACKAGE_luci-app-nps is not set
# CONFIG_PACKAGE_luci-app-frpc is not set
# CONFIG_PACKAGE_luci-app-nfs is not set
# CONFIG_PACKAGE_luci-app-openvpn-server is not set
# CONFIG_PACKAGE_luci-app-aria2 is not set
# CONFIG_PACKAGE_luci-app-openvpn is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set