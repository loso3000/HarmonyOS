CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y
# 设置固件大小
CONFIG_TARGET_KERNEL_PARTSIZE=64
CONFIG_TARGET_ROOTFS_PARTSIZE=3925

# CONFIG_PACKAGE_diffutils=y
# CONFIG_ALL_NONSHARED=y
# CONFIG_IB=y
# CONFIG_IB_STANDALONE=y
# CONFIG_JSON_OVERVIEW_IMAGE_INFO=y
# CONFIG_BUSYBOX_CUSTOM=y
# CONFIG_BUSYBOX_CONFIG_FEATURE_SYSLOG_INFO=y

# CONFIG_COREMARK_NUMBER_OF_THREADS=128
# CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256 
# CONFIG_PACKAGE_kmod-kvm-amd=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_BLK=y
CONFIG_VIRTIO_NET=y

# CONFIG_GRUB_IMAGES is not set
CONFIG_GRUB_EFI_IMAGES=y
# CONFIG_GRUB_CONSOLE is not set
CONFIG_GRUB_TIMEOUT="0"
CONFIG_GRUB_TITLE="OpenWrt"

# CONFIG_ISO_IMAGES is not set
# CONFIG_VDI_IMAGES is not set
# CONFIG_VMDK_IMAGES is not set
# CONFIG_SIGNATURE_CHECK is not set
# CONFIG_SIGNED_PACKAGES is not set
# 压缩efi
CONFIG_TARGET_IMAGES_GZIP=y
#ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_6rd=y
CONFIG_PACKAGE_6to4=

CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_CONFIG_FEATURE_SYSLOG_INFO=y

CONFIG_PACKAGE_kmod-fuse=y
CONFIG_DEFAULT_kmod-8139cp=y
CONFIG_DEFAULT_kmod-8139too=y
CONFIG_DEFAULT_kmod-alx=y
CONFIG_DEFAULT_kmod-amazon-ena=y
CONFIG_DEFAULT_kmod-amd-xgbe=y
CONFIG_DEFAULT_kmod-bnx2=y
CONFIG_DEFAULT_kmod-bnx2x=y
CONFIG_DEFAULT_kmod-button-hotplug=y
CONFIG_DEFAULT_kmod-e1000=y
CONFIG_DEFAULT_kmod-e1000e=y
CONFIG_DEFAULT_kmod-forcedeth=y
CONFIG_DEFAULT_kmod-fs-f2fs=y
CONFIG_DEFAULT_kmod-fs-vfat=y
CONFIG_DEFAULT_kmod-i40e=y
CONFIG_DEFAULT_kmod-i40evf=y
CONFIG_DEFAULT_kmod-iavf=y
CONFIG_DEFAULT_kmod-igb=y
CONFIG_DEFAULT_kmod-igbvf=y
CONFIG_DEFAULT_kmod-igc=y
CONFIG_DEFAULT_kmod-ipt-raw=y
CONFIG_DEFAULT_kmod-ixgbe=y
CONFIG_DEFAULT_kmod-mlx4-core=y
CONFIG_DEFAULT_kmod-mlx5-core=y
CONFIG_DEFAULT_kmod-mmc=y
CONFIG_DEFAULT_kmod-nf-nathelper=y
CONFIG_DEFAULT_kmod-nf-nathelper-extra=y
CONFIG_DEFAULT_kmod-pcnet32=y
CONFIG_DEFAULT_kmod-r8125=y
CONFIG_DEFAULT_kmod-r8168=y
CONFIG_DEFAULT_kmod-sdhci=y
CONFIG_DEFAULT_kmod-sound-hda-codec-hdmi=y
CONFIG_DEFAULT_kmod-sound-hda-codec-realtek=y
CONFIG_DEFAULT_kmod-sound-hda-codec-via=y
CONFIG_DEFAULT_kmod-sound-hda-core=y
CONFIG_DEFAULT_kmod-sound-hda-intel=y
CONFIG_DEFAULT_kmod-sound-i8x0=y
CONFIG_DEFAULT_kmod-sound-via82xx=y
CONFIG_DEFAULT_kmod-tulip=y
CONFIG_DEFAULT_kmod-usb-audio=y
CONFIG_DEFAULT_kmod-usb-hid=y
CONFIG_DEFAULT_kmod-usb-net=y
CONFIG_DEFAULT_kmod-usb-net-asix-ax88179=y
CONFIG_DEFAULT_kmod-usb-net-rtl8150=y
CONFIG_DEFAULT_kmod-usb-net-rtl8152-vendor=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-tg3=y
CONFIG_DEFAULT_kmod-via-velocity=y
CONFIG_DEFAULT_kmod-vmxnet3=y


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
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
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
CONFIG_DEFAULT_kmod-igc=y

# mt7916 mt7921 mt7922
CONFIG_PACKAGE_hostapd-common=y
CONFIG_PACKAGE_wpad-openssl=y
CONFIG_PACKAGE_wireless-tools=y
CONFIG_PACKAGE_kmod-mac80211=y
CONFIG_PACKAGE_kmod-cfg80211=y
CONFIG_PACKAGE_kmod-mt7615e=y
CONFIG_PACKAGE_kmod-mt7916-firmware=y
CONFIG_PACKAGE_kmod-mt7921e=y
CONFIG_PACKAGE_kmod-mt7922-firmware=y

#nginx 
#CONFIG_PACKAGE_nginx=y
#CONFIG_PACKAGE_nginx-util=y
#CONFIG_PACKAGE_nginx-ssl=y
#CONFIG_PACKAGE_openssl-util=y

#uhttpd 
CONFIG_PACKAGE_libustream-openssl=y

#Tailscale
#CONFIG_PACKAGE_libustream-openssl=y
#CONFIG_PACKAGE_ca-bundle=y
#CONFIG_PACKAGE_kmod-tun=y

#add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
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
# CONFIG_PACKAGE_automount   #取消AUTO挂载
# CONFIG_PACKAGE_swconfig=y  #交换机功能
# CONFIG_PACKAGE_hostapd=y
CONFIG_PACKAGE_e2fsprogs=y
# CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_luci-proto-ipip=y
# CONFIG_PACKAGE_fstools=y   #挂载功能
# CONFIG_PACKAGE_block-mount=y  #挂载功能
# CONFIG_PACKAGE_ntfsprogs=y  #ntfs.mks分区格式化
# CONFIG_PACKAGE_automount-ntfs=y  #NTFS挂载
CONFIG_PACKAGE_automount=y  #NTFS挂载

CONFIG_PACKAGE_autocore=y
CONFIG_PACKAGE_autocore-x86=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_autosamba-ksmbd=n
# CONFIG_PACKAGE_autosamba-samba4=y
CONFIG_PACKAGE_autosamba=y

CONFIG_PACKAGE_ipt2socks=y

# x550 2.5G
CONFIG_PACKAGE_x550-nbase-t=y

CONFIG_PACKAGE_kmod-inet-diag=y

CONFIG_PACKAGE_kmod-inet-diag=y
# CONFIG_PACKAGE_kmod-br-netfilter=n  #透明网桥
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
CONFIG_PACKAGE_luci-app-adbyby-plus=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advancedplus=y
CONFIG_PACKAGE_luci-app-advanced=n
CONFIG_PACKAGE_luci-app-autotimeset=y
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=y
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=n
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
CONFIG_PACKAGE_luci-app-hd-idle=n
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n

CONFIG_PACKAGE_luci-app-netdata=y
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
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Brook is not set
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_Transparent_Proxy=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_IPv6_Nat=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Client=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Simple_Obfs=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray_Plugin=y
CONFIG_PACKAGE_luci-app-ssr-plusdns=n
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-ddnsto=n
CONFIG_PACKAGE_luci-app-pushbot=y
CONFIG_PACKAGE_luci-app-dnsfilter=n
CONFIG_PACKAGE_luci-app-kodexplorer=y
CONFIG_PACKAGE_luci-app-uhttpd=n
CONFIG_PACKAGE_luci-app-mentohust=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-wifimac=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-mac=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wifidog=n
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_wifidog=n
CONFIG_PACKAGE_luci-app-cupsd=n
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-ikoolproxy=n
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=n
CONFIG_PACKAGE_luci-app-cpufreq=n
# CONFIG_PACKAGE_BitSrunLoginGo=n   #学校签到
CONFIG_PACKAGE_luci-app-v2raya=n
CONFIG_PACKAGE_luci-app-linkease=n
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
CONFIG_PACKAGE_luci-app-ramfree=n

CONFIG_PACKAGE_luci-app-watchcat-plus=y
CONFIG_PACKAGE_luci-app-bridge=n
CONFIG_PACKAGE_luci-app-cowbping=n
CONFIG_PACKAGE_luci-app-beardropper=y
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
CONFIG_PACKAGE_luci-app-pptpserver=y
CONFIG_PACKAGE_luci-app-n2n=y
# CONFIG_PACKAGE_luci-app-n2n_v2=y
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
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-kucat=y
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-darkmatter=y
CONFIG_PACKAGE_luci-theme-neobird=y
CONFIG_PACKAGE_luci-app-argon-config=n
#增加其它插件
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-minidlna=y
CONFIG_PACKAGE_luci-app-rclone=y
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-ipsec-server=y
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=y
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-homeredirect=n
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=y
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=y
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-frps=y
CONFIG_PACKAGE_luci-app-nfs=y
CONFIG_PACKAGE_luci-app-openvpn-server=y
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-openvpn=y
CONFIG_PACKAGE_luci-app-ddns-go=y
CONFIG_PACKAGE_luci-app-lucky=y
CONFIG_PACKAGE_luci-app-partexp=y
CONFIG_PACKAGE_luci-app-msd_lite=y

CONFIG_PACKAGE_luci-app-eqosplus=y
CONFIG_PACKAGE_luci-app-chatgpt=y
CONFIG_PACKAGE_luci-app-chatgpt-web=y
CONFIG_PACKAGE_luci-app-arpbind=y

CONFIG_PACKAGE_i915-firmware=y
CONFIG_PACKAGE_kmod-drm-i915=y

# Other Appliciations
# CONFIG_PACKAGE_luci-ssl-openssl=y
# CONFIG_PACKAGE_wpad-openssl=y
CONFIG_PACKAGE_xz=y
CONFIG_PACKAGE_xz-utils=y
CONFIG_PACKAGE_ppp-mod-pppol2tp=y
CONFIG_PACKAGE_kmod-pppol2tp=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_xl2tpd=y
# 工具
CONFIG_PACKAGE_acpid=y
CONFIG_PACKAGE_blkid=y
# CONFIG_PACKAGE_qemu-ga=y
# CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_open-vm-tools=y #虚拟机支持管理性能更好
CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_hdparm=y  #移动硬盘设置
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_htop=yy
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_wget-ssl=y

CONFIG_PACKAGE_zsh=y

#istore
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_umdns=y  #error

CONFIG_PACKAGE_lm-sensors=y
CONFIG_PACKAGE_coremark=y
#docker
CONFIG_PACKAGE_luci-app-docker=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_DOCKER_KERNEL_OPTIONS=y
CONFIG_DOCKER_NET_ENCRYPT=y
CONFIG_DOCKER_NET_MACVLAN=y
CONFIG_DOCKER_NET_OVERLAY=y
CONFIG_DOCKER_NET_TFTP=y
# CONFIG_PACKAGE_kmod-fs-virtiofs is not set
# CONFIG_PACKAGE_kmod-qca-mcs is not set


CONFIG_PACKAGE_ariang=y
CONFIG_PACKAGE_coremark=y
CONFIG_PACKAGE_collectd-mod-thermal=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
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
CONFIG_PACKAGE_mentohust=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_pandownload-fake-server=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_xl2tpd=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_fullconenat=y

CONFIG_PACKAGE_apk=y
CONFIG_PACKAGE_bsdtar=y
CONFIG_PACKAGE_bzip2=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_gzip=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_zip=y
CONFIG_PACKAGE_fstrim=y
CONFIG_PACKAGE_gpioctl-sysfs=y
CONFIG_PACKAGE_gpiod-tools=y
CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_shadow-chsh=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_tmux=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_whereis=y
CONFIG_PACKAGE_gotop=y
CONFIG_PACKAGE_tmate=y
CONFIG_PACKAGE_udp2raw-tunnel=y
CONFIG_PACKAGE_procd-ujail=y

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

CONFIG_PACKAGE_libimobiledevice-utils=y
CONFIG_PACKAGE_libplist-utils=y
CONFIG_PACKAGE_libusbmuxd-utils=y

CONFIG_PACKAGE_usbmuxd=y
CONFIG_PACKAGE_libwslay=y
CONFIG_PACKAGE_libudev-fbsd=y

CONFIG_HYSTERIA_COMPRESS_UPX=y
CONFIG_PACKAGE_hysteria=y
# 存放禁用的东西

# CONFIG_PACKAGE_kmod-fs-virtiofs is not set
# CONFIG_PACKAGE_kmod-qca-mcs is not set
