# Target Config
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_MULTI_PROFILE=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r2s=y
CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4s=y
# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r5s=y
# CONFIG_TARGET_DEVICE_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4se=y
# CONFIG_TARGET_ALL_PROFILES=y
# set
CONFIG_TARGET_KERNEL_PARTSIZE=60
CONFIG_TARGET_ROOTFS_PARTSIZE=920
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
### Ethernet Support
CONFIG_PACKAGE_kmod-usb-net-rndis=y

CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y
# CONFIG_PACKAGE_kmod-usb-net-rtl8152 is not set
CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor=y

CONFIG_PACKAGE_kmod-gpu-lima=y
CONFIG_PACKAGE_kmod-ath9k-htc=y
CONFIG_PACKAGE_kmod-mt76x0u=y
CONFIG_PACKAGE_kmod-mt76x2u=y
CONFIG_PACKAGE_kmod-r8125=y
CONFIG_PACKAGE_kmod-rtw88=y
# CONFIG_PACKAGE_kmod-rtl8812au-ct=y err
CONFIG_PACKAGE_rtl8821ce-firmware=y
CONFIG_PACKAGE_kmod-mt7921e=y
CONFIG_PACKAGE_kmod-mt7921-common=y
CONFIG_PACKAGE_kmod-mt7922=y
CONFIG_PACKAGE_kmod-mt7922-common=y

CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_wpad-wolfssl=y
CONFIG_DRIVER_11AC_SUPPORT=y
CONFIG_DRIVER_11N_SUPPORT=y
CONFIG_DRIVER_11W_SUPPORT=y

### Ethernet Support
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
# CONFIG_PACKAGE_kmod-usb-net-rtl8125=y
# CONFIG_PACKAGE_kmod-usb-net-rtl8168 is not set
CONFIG_PACKAGE_kmod-usb-net-rtl8152-vendor=y
# sd
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-core=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-vfat=y
# CONFIG_PACKAGE_kmod-scsi-core=y
# CONFIG_PACKAGE_kmod-usb-printer is not set
# CONFIG_PACKAGE_ntfs-3g=y
# CONFIG_PACKAGE_antfs-mount is not set
# CONFIG_PACKAGE_kmod-fs-antfs is not set
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
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
# CONFIG_PACKAGE_hostapd-common=y
# CONFIG_PACKAGE_e2fsprogs=y
# CONFIG_PACKAGE_smartmontools=y
# CONFIG_PACKAGE_luci-proto-ipip=y
# CONFIG_PACKAGE_fstools=y   #挂载功能
# CONFIG_PACKAGE_block-mount=y  #挂载功能
# CONFIG_PACKAGE_ntfsprogs=y  #ntfs.mks分区格式化
# CONFIG_PACKAGE_automount-ntfs=y  #NTFS挂载
CONFIG_PACKAGE_automount=y  #NTFS挂载

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
CONFIG_PACKAGE_luci-app-advanced=y
CONFIG_PACKAGE_luci-app-autotimeset=y
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
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
CONFIG_PACKAGE_luci-app-turboacc=n
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
CONFIG_PACKAGE_luci-app-mentohust=y
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-wifimac=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-mac=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-wifidog=n
CONFIG_PACKAGE_luci-app-sqm=n
CONFIG_PACKAGE_wifidog=n
CONFIG_PACKAGE_luci-app-cupsd=n
CONFIG_PACKAGE_luci-app-mosdns=n
CONFIG_PACKAGE_luci-app-ikoolproxy=n
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
# CONFIG_PACKAGE_luci-app-wireguard is not set
CONFIG_PACKAGE_luci-app-aliyundrive-webdav=n
CONFIG_PACKAGE_luci-app-cpufreq=n
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
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-neobird=y
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
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-homeredirect=n
CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer is not set
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-frps=y
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ddns-go=y
CONFIG_PACKAGE_luci-app-lucky=y
CONFIG_PACKAGE_luci-app-partexp=y
# store
CONFIG_PACKAGE_kmod-fuse=y

# store
CONFIG_PACKAGE_kmod-mt7921-common=y
CONFIG_PACKAGE_kmod-mt79222=y
CONFIG_PACKAGE_kmod-mt7922-common=y
CONFIG_PACKAGE_kmod-mt7921e=y
CONFIG_PACKAGE_kmod-mt7921-firmware=y
CONFIG_PACKAGE_kmod-mt7921s=y
CONFIG_PACKAGE_kmod-mt7921u=y
CONFIG_PACKAGE_kmod-mt7922-firmware=y
CONFIG_PACKAGE_kmod-mt7921bt-firmware=y
# CONFIG_PACKAGE_kmod-bluetooth=y
CONFIG_PACKAGE_kmod-mt7922bt-firmware=y

CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_kmod-ata-core=y
CONFIG_PACKAGE_luci-app-mtk=y
CONFIG_PACKAGE_wifi-profile=y
CONFIG_PACKAGE_wireless-regdb=y
CONFIG_PACKAGE_wireless-tools=y
CONFIG_PACKAGE_kmod-mt_wifi=y
CONFIG_PACKAGE_wpad-wolfssl=y
CONFIG_DRIVER_11AC_SUPPORT=y
CONFIG_DRIVER_11N_SUPPORT=y
CONFIG_DRIVER_11W_SUPPORT=y

CONFIG_PACKAGE_kmod-gpu-lima=y
CONFIG_PACKAGE_kmod-ath9k-htc=y
CONFIG_PACKAGE_kmod-mt76x0u=y
CONFIG_PACKAGE_kmod-mt76x2u=y
CONFIG_PACKAGE_kmod-r8125=y
CONFIG_PACKAGE_kmod-rtw88=y
# CONFIG_PACKAGE_kmod-rtl8812au-ct=y #error
# CONFIG_PACKAGE_rtl8821ce-firmware=y
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
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
CONFIG_PACKAGE_wget=y
