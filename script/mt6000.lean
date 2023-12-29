
CONFIG_TARGET_mediatek=y
CONFIG_TARGET_mediatek_filogic=y
CONFIG_TARGET_mediatek_filogic_DEVICE_glinet_gl-mt6000=y
# CONFIG_HAS_SUBTARGETS=y
# CONFIG_HAS_DEVICES=y
# CONFIG_TARGET_BOARD="mediatek"
# CONFIG_TARGET_SUBTARGET="filogic"
# CONFIG_TARGET_PROFILE="DEVICE_glinet_gl-mt6000"
# CONFIG_TARGET_ARCH_PACKAGES="aarch64_cortex-a53"
# CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe -mcpu=cortex-a53"
# CONFIG_CPU_TYPE="cortex-a53"
 
# CONFIG_TARGET_ROOTFS_PARTSIZE=1024
# CONFIG_PACKAGE_diffutils=y
CONFIG_PACKAGE_python3=y

CONFIG_PACKAGE_kmod-crypto-kpp=y
CONFIG_PACKAGE_kmod-crypto-lib-chacha20=y
CONFIG_PACKAGE_kmod-crypto-lib-chacha20poly1305=y
CONFIG_PACKAGE_kmod-crypto-lib-curve25519=y
CONFIG_PACKAGE_kmod-crypto-lib-poly1305=y

CONFIG_PACKAGE_kmod-libphy=y
CONFIG_PACKAGE_kmod-fuse=y
# CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_CONFIG_FEATURE_SYSLOG_INFO=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_autocore=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_ipt2socks=y

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
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-rt2800-usb=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y

# sd
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
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
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Hysteria is not set
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_Transparent_Proxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria is not set
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Hysteria is not set
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Kcptun is not set
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Hysteria is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan is not set
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Hysteria is not set

CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-ddnsto=n
CONFIG_PACKAGE_luci-app-pushbot=n
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
CONFIG_PACKAGE_luci-app-ikoolproxy=n
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
# CONFIG_PACKAGE_luci-app-wireguard is not set
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=n
CONFIG_PACKAGE_luci-app-cpufreq=y
# CONFIG_PACKAGE_BitSrunLoginGo=n   #学校签到
CONFIG_PACKAGE_luci-app-v2raya=n
CONFIG_PACKAGE_luci-app-linkease=n
CONFIG_PACKAGE_luci-app-vlmcsd=y
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
CONFIG_PACKAGE_luci-app-fileassistant=n
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
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-design=y
CONFIG_PACKAGE_luci-app-argon-config=n
#增加其它插件
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=n
CONFIG_PACKAGE_luci-app-minidlna=n
CONFIG_PACKAGE_luci-app-rclone=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-ipsec-server=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
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
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-frps=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ddns-go=y
CONFIG_PACKAGE_luci-app-lucky=n
CONFIG_PACKAGE_luci-app-partexp=n

CONFIG_PACKAGE_luci-app-nft-qos=n
CONFIG_PACKAGE_luci-app-sqm=y
#passwall base
CONFIG_PACKAGE_iptables-mod-socket=y

CONFIG_PACKAGE_luci-app-poweroffdevice=y
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-netspeedlimit=n
CONFIG_PACKAGE_luci-app-eqosplus=y
CONFIG_PACKAGE_luci-app-chatgpt=y
CONFIG_PACKAGE_luci-app-chatgpt-web=y
#docker
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_DOCKER_KERNEL_OPTIONS=y
CONFIG_DOCKER_NET_ENCRYPT=y
CONFIG_DOCKER_NET_MACVLAN=y
CONFIG_DOCKER_NET_OVERLAY=y
CONFIG_DOCKER_NET_TFTP=y


# 5G信号插件
# CONFIG_PACKAGE_ext-rooter-basic=y

# QMI拨号工具（移远，广和通）
CONFIG_PACKAGE_quectel-CM-5G=y
CONFIG_PACKAGE_fibocom-dial=y

# QMI拨号软件
CONFIG_PACKAGE_luci-app-usbmodem=y
CONFIG_PACKAGE_luci-app-hypermodem=y

# Gobinet拨号软件
# CONFIG_PACKAGE_kmod-gobinet=y
# CONFIG_PACKAGE_luci-app-gobinetmodem=y

# 串口调试工具
CONFIG_PACKAGE_minicom=y

# 脚本拨号工具依赖
CONFIG_PACKAGE_grep=y
CONFIG_PACKAGE_procps-ng=y
CONFIG_PACKAGE_procps-ng-ps=y


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
