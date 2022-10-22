CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_p2w_r619ac-128m=y
CONFIG_TARGET_BOARD="ipq40xx"
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set

### USB Net Drivers
#CONFIG_PACKAGE_kmod-usb-net=y
#CONFIG_PACKAGE_kmod-usb-net-asix=y
#CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
#CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
#CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
#CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
#CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
#CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
#CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
#CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
#CONFIG_PACKAGE_kmod-usb-net-hso=y
#CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
#CONFIG_PACKAGE_kmod-usb-net-ipheth=y
#CONFIG_PACKAGE_kmod-usb-net-kalmia=y
#CONFIG_PACKAGE_kmod-usb-net-kaweth=y
#CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
#CONFIG_PACKAGE_kmod-usb-net-pegasus=y
#CONFIG_PACKAGE_kmod-usb-net-pl=y
#CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
#CONFIG_PACKAGE_kmod-usb-net-rndis=y
#CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
#CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
#CONFIG_PACKAGE_kmod-usb-net-sr9700=y
#CONFIG_PACKAGE_kmod-usb-net2280=y
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# file system
CONFIG_PACKAGE_kmod-fs-antfs=n
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_luci-app-ddns=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_autocore-x86=n
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-advanced=n
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=n
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
CONFIG_PACKAGE_luci-app-turboacc=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE_CM=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_BBR_CCA=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=y
CONFIG_PACKAGE_luci-app-ttyd=n
CONFIG_PACKAGE_luci-app-smartdns=y
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-passwall=n
CONFIG_PACKAGE_luci-app-passwall2=n
CONFIG_PACKAGE_luci-app-passwall2_Transparent_Proxy=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Brook is not set
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Hysteria is not set
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_IPv6_Nat is not set
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Shadowsocks_Libev_Client=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Shadowsocks_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Shadowsocks_Rust_Client is not set
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_ShadowsocksR_Libev_Client=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_ShadowsocksR_Libev_Server is not set
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_Simple_Obfs=y
# CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_V2ray is not set
CONFIG_PACKAGE_luci-app-passwall2_INCLUDE_V2ray_Plugin=y
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Redsocks2=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_ShadowsocksR_Libev_Client=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_obfs_server=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan_Plus=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray_Plugin=y
CONFIG_PACKAGE_luci-app-dnsfilter=n
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-mac=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-kodexplorer=n
CONFIG_PACKAGE_luci-app-uhttpd=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-linkease=y
# 主题

CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_ko=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-theme-argon=n
CONFIG_PACKAGE_luci-theme-atmaterial=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-neobird=n
# 增加其它插件

CONFIG_PACKAGE_luci-app-cowbping=y
CONFIG_PACKAGE_luci-app-beardropper=y
CONFIG_PACKAGE_luci-app-control-parentcontrol=y
CONFIG_PACKAGE_luci-app-https-dns-proxy=n
CONFIG_PACKAGE_luci-app-https-dns-proxy-whisky=n
CONFIG_PACKAGE_luci-app-pwdHackDeny=n
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-homebox=n
CONFIG_PACKAGE_luci-app-store=n
CONFIG_PACKAGE_luci-app-homeassistant=n
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-aliddns=n
CONFIG_PACKAGE_luci-app-pptpserver=n
CONFIG_PACKAGE_luci-app-encryption=n
CONFIG_PACKAGE_luci-app-wizard=n
CONFIG_PACKAGE_luci-app-filebrowser=n
# CONFIG_PACKAGE_luci-app-nodogsplash=y  #WIFI认证

CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
# CONFIG_PACKAGE_luci-app-minidlna is not set
CONFIG_PACKAGE_luci-app-rclone=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=y
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=y
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=y
CONFIG_PACKAGE_luci-app-pptpserver=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
CONFIG_PACKAGE_luci-app-ipsec-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers is not set
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=n
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer is not set
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=y
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
# CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-amule=n
# CONFIG_PACKAGE_subconverter=y

# Wireless Support
CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_wpad-wolfssl=y
CONFIG_DRIVER_11AC_SUPPORT=y
CONFIG_DRIVER_11N_SUPPORT=y
CONFIG_DRIVER_11W_SUPPORT=y

# 3G/4G Drivers & Utilities
# CONFIG_PACKAGE_comgt-ncm=y
# CONFIG_PACKAGE_comgt=y
# CONFIG_PACKAGE_kmod-mii=y
# CONFIG_PACKAGE_kmod-usb-acm=y
# CONFIG_PACKAGE_kmod-usb-serial=y
# CONFIG_PACKAGE_kmod-usb-serial-option=y
# CONFIG_PACKAGE_kmod-usb-serial-wwan=y
# CONFIG_PACKAGE_luci-proto-3g=y
# CONFIG_PACKAGE_luci-proto-ncm=y
# CONFIG_PACKAGE_luci-proto-qmi=y
# CONFIG_PACKAGE_qmi-utils=y
# CONFIG_PACKAGE_umbim=y
# CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_usb-modeswitch=y

# Mobile Network Sharing
# CONFIG_PACKAGE_libimobiledevice-utils=y
# CONFIG_PACKAGE_libplist-utils=y
# CONFIG_PACKAGE_libudev-fbsd=y
# CONFIG_PACKAGE_libusbmuxd-utils=y
# CONFIG_PACKAGE_usbmuxd=y


# CONFIG_PACKAGE_luci-proto-openconnect=y

# Other Appliciations
# CONFIG_PACKAGE_luci-ssl-openssl=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_htop=y
# CONFIG_PACKAGE_ipt2socks=y
# CONFIG_PACKAGE_wpad-openssl=y
# CONFIG_PACKAGE_xz=y
# CONFIG_PACKAGE_xz-utils=y
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
# CONFIG_PACKAGE_wget-ssl=y
# CONFIG_PACKAGE_wget=y
# CONFIG_PACKAGE_ocserv=y

CONFIG_PACKAGE_curl=y
# CONFIG_PACKAGE_ppp-mod-pptp=y
# CONFIG_PACKAGE_ppp-mod-pppol2tp=y
# CONFIG_PACKAGE_xl2tpd=y

# CONFIG_PACKAGE_kmod-ntfs-3g=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
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
