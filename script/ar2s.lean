# Target Config
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r2s=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4s=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4se=y

# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r5c=y

# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_fastrhino_r66s=y
# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_fastrhino_r68s=y

# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_lunzn_fastrhino-r66s=y
# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_lunzn_fastrhino-r68s=y

CONFIG_TARGET_KERNEL_PARTSIZE=64
CONFIG_TARGET_ROOTFS_PARTSIZE=925
 
CONFIG_TARGET_PER_DEVICE_ROOTFS=y
CONFIG_TARGET_ROOTFS_TARGZ=y
CONFIG_TARGET_EXT4_JOURNAL=y
CONFIG_TARGET_ROOTFS_SQUASHFS=y

CONFIG_PACKAGE_kmod-libphy=y
CONFIG_PACKAGE_kmod-fuse=y
CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_CONFIG_FEATURE_SYSLOG_INFO=y
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ip6tables-extra=y
CONFIG_PACKAGE_ip6tables-mod-nat=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-ipkg=y
#删除参数
CONFIG_TARGET_ROOTFS_EXT4FS=y
# 不压缩efi
CONFIG_TARGET_IMAGES_GZIP=y
### Ethernet Support
CONFIG_PACKAGE_kmod-usb-net-rndis=y

#usbnetwork 
CONFIG_PACKAGE_kmod-inet-diag=y
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-audio=y
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-lib80211=y
CONFIG_PACKAGE_kmod-libertas-usb=y
CONFIG_PACKAGE_kmod-mac80211=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y

# share network
# CONFIG_PACKAGE_libmbedtls=y
# CONFIG_PACKAGE_usbmuxd=y
# CONFIG_PACKAGE_kmod-usb-net-ipheth=y
# CONFIG_PACKAGE_kmod-usb-net-rndis=y

#USB驱动 sd
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
#add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y

#nginx 
#CONFIG_PACKAGE_nginx=y
#CONFIG_PACKAGE_nginx-util=y
#CONFIG_PACKAGE_nginx-ssl=y
#CONFIG_PACKAGE_openssl-util=y

#uhttpd https
CONFIG_PACKAGE_libustream-openssl=y

#base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_luci-app-ddns=y

#diy
# CONFIG_PACKAGE_swconfig=y  #交换机功能
# CONFIG_PACKAGE_fstools=y   #挂载功能
# CONFIG_PACKAGE_block-mount=y  #挂载功能
# CONFIG_PACKAGE_ntfsprogs=y  #ntfs.mks分区格式化
# CONFIG_PACKAGE_automount-ntfs=y  #NTFS挂载
CONFIG_PACKAGE_automount=y  #NTFS挂载

CONFIG_PACKAGE_autocore=y
CONFIG_PACKAGE_autocore-arm=y
# CONFIG_PACKAGE_myautocore-x86=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_autosamba-ksmbd=n
# CONFIG_PACKAGE_autosamba-samba4=y
CONFIG_PACKAGE_autosamba=y

CONFIG_PACKAGE_kmod-inet-diag=y

# CONFIG_PACKAGE_kmod-br-netfilter=n  #透明网桥

# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advancedplus=y
CONFIG_PACKAGE_luci-app-advanced=n
CONFIG_PACKAGE_luci-app-autotimeset=y
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-timecontrol=n
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-hd-idle=n
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE_CM is not set
CONFIG_PACKAGE_luci-app-passwall2=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Trojan
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan
CONFIG_PACKAGE_luci-app-ssr-plusdns=n
CONFIG_PACKAGE_luci-app-ssr-plusdns_Shadowsocks_Libev_Client=y 
CONFIG_PACKAGE_luci-app-ssr-plusdns_INCLUDEINCLUDE_Hysteria=y 
CONFIG_PACKAGE_luci-app-ssr-plusdns_INCLUDEINCLUDE_NaiveProxy=y 
CONFIG_PACKAGE_luci-app-ssr-plusdns_INCLUDE_mosdns=y 
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NONE_V2RAY=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_V2ray=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Xray=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Kcptun=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Hysteria=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_IPT2Socks=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_NaiveProxy=y 
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDEINCLUDE_Redsocks2=y 
CONFIG_PACKAGE_luci-app-ssr-plus_Shadowsocks_Libev_Client=y 
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-ddnsto=n
CONFIG_PACKAGE_luci-app-pushbot=y
CONFIG_PACKAGE_luci-app-dnsfilter=n
CONFIG_PACKAGE_luci-app-kodexplorer=n
CONFIG_PACKAGE_luci-app-uhttpd=n
CONFIG_PACKAGE_luci-app-mentohust=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-wifimac=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-mac=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-wifidog=n
CONFIG_PACKAGE_wifidog=n
CONFIG_PACKAGE_luci-app-cupsd=n
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-ikoolproxy=y
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
# CONFIG_PACKAGE_luci-app-wireguard is not set
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=n
CONFIG_PACKAGE_luci-app-cpufreq=y
# CONFIG_PACKAGE_BitSrunLoginGo=n   #学校签到
CONFIG_PACKAGE_luci-app-v2raya=n
CONFIG_PACKAGE_luci-app-linkease=n
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
CONFIG_PACKAGE_luci-app-ramfree=n

CONFIG_PACKAGE_luci-app-bridge=n
CONFIG_PACKAGE_luci-app-cowbping=n
CONFIG_PACKAGE_luci-app-beardropper=n
CONFIG_PACKAGE_luci-app-control-parentcontrol=y
CONFIG_PACKAGE_luci-app-parentcontrol=y
CONFIG_PACKAGE_luci-app-https-dns-proxy=n
CONFIG_PACKAGE_luci-app-https-dns-proxy-whisky=n
CONFIG_PACKAGE_luci-app-pwdHackDeny=n
CONFIG_PACKAGE_luci-app-oaf=y
# CONFIG_PACKAGE_luci-lib-ipkg=y
CONFIG_PACKAGE_luci-app-store=y
CONFIG_PACKAGE_luci-app-istorex=n
CONFIG_PACKAGE_quickstart=n
CONFIG_PACKAGE_luci-app-homeassistant=n
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-aliddns=n
CONFIG_PACKAGE_luci-app-pptpserver=n
CONFIG_PACKAGE_luci-app-n2n=n
CONFIG_PACKAGE_luci-app-netwizard=y
CONFIG_PACKAGE_luci-app-fileassistant=y
# CONFIG_PACKAGE_luci-app-bandwidthd=y
# CONFIG_PACKAGE_bandwidthd=y
CONFIG_PACKAGE_luci-app-alist=n
#主题
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-kucat=y
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-darkmatter=y
CONFIG_PACKAGE_luci-theme-neobird=y
CONFIG_PACKAGE_luci-app-argon-config=y
#增加其它插件
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-minidlna=n
CONFIG_PACKAGE_luci-app-rclone=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-ipsec-server=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=n
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-homeredirect=n
CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer is not set
CONFIG_PACKAGE_luci-app-p910nd=y
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-frps=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ddns-go=y
CONFIG_PACKAGE_luci-app-lucky=n
CONFIG_PACKAGE_luci-app-partexp=y

CONFIG_PACKAGE_luci-app-nft-qos=n
CONFIG_PACKAGE_luci-app-sqm=y

CONFIG_PACKAGE_luci-app-poweroffdevice=y
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-netspeedlimit=n
CONFIG_PACKAGE_luci-app-eqosplus=y
CONFIG_PACKAGE_luci-app-chatgpt=y
CONFIG_PACKAGE_luci-app-chatgpt-web=y
#docker
CONFIG_PACKAGE_luci-app-docker=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_DOCKER_KERNEL_OPTIONS=y
CONFIG_DOCKER_NET_ENCRYPT=y
CONFIG_DOCKER_NET_MACVLAN=y
CONFIG_DOCKER_NET_OVERLAY=y
CONFIG_DOCKER_NET_TFTP=y

# Other Appliciations
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_xl2tpd=y 
CONFIG_PACKAGE_ppp-mod-pppol2tp=y
CONFIG_PACKAGE_kmod-pppol2tp=y
# 工具
# CONFIG_PACKAGE_acpid=y
# CONFIG_PACKAGE_blkid=y
# CONFIG_PACKAGE_qemu-ga=y
# CONFIG_PACKAGE_smartmontools=y
# CONFIG_PACKAGE_open-vm-tools=y #虚拟机支持管理性能更好
CONFIG_PACKAGE_ethtool=y #网卡工具
# CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具
# CONFIG_PACKAGE_hdparm=y  #移动硬盘设置
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_wget-ssl=y
CONFIG_PACKAGE_lsblk=y

CONFIG_PACKAGE_zsh=y

CONFIG_PACKAGE_acme-dnsapi=y
CONFIG_PACKAGE_coremark=y
CONFIG_PACKAGE_collectd-mod-thermal=y
CONFIG_PACKAGE_bind-host=y

CONFIG_PACKAGE_odhcp6c=y

CONFIG_PACKAGE_sed=y
CONFIG_PACKAGE_tar=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_gzip=y
CONFIG_PACKAGE_fstrim=y
CONFIG_PACKAGE_gpioctl-sysfs=y
CONFIG_PACKAGE_gpiod-tools=y
CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_lscpu=y
CONFIG_PACKAGE_lsof=y
CONFIG_PACKAGE_pciutils=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_tmate=y
CONFIG_PACKAGE_procd-ujail=y
CONFIG_PACKAGE_coreutils-dd=y
CONFIG_PACKAGE_wg-quick=y
# CONFIG_PACKAGE_tailscale=y
# CONFIG_PACKAGE_tailscaled=y

CONFIG_PACKAGE_iptables-mod-nat-extra=y
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
CONFIG_PACKAGE_luci-proto-3g=y
CONFIG_PACKAGE_shadow-utils=y
CONFIG_PACKAGE_shadow-chsh=y
