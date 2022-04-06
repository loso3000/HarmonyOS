### INITIALIZATION ###
CONFIG_KERNEL_BUILD_DOMAIN="buildhost"
CONFIG_KERNEL_BUILD_USER="builder"
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4s=y
CONFIG_TARGET_ROOTFS_PARTSIZE=864
# CONFIG_COLLECT_KERNEL_DEBUG is not set

### AGGRESSIVE ###
CONFIG_PACKAGE_node=y
CONFIG_NODEJS_14=y
CONFIG_NODEJS_ICU_NONE=y
CONFIG_DEVEL=y
CONFIG_TOOLCHAINOPTS=y
CONFIG_GCC_USE_VERSION_8=y

### BASIC ###
CONFIG_PACKAGE_kmod-hwmon-pwmfan=y
CONFIG_PACKAGE_r8169-firmware=y
CONFIG_PACKAGE_addition-trans-zh=y
CONFIG_PACKAGE_arm-trusted-firmware-rockchip=y
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_cgi-io=y
CONFIG_PACKAGE_ethtool=y
CONFIG_PACKAGE_diffutils=y
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_dnsmasq_full_auth=y
CONFIG_PACKAGE_dnsmasq_full_conntrack=y
CONFIG_PACKAGE_dnsmasq_full_dhcp=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_dnsmasq_full_dnssec=y
CONFIG_PACKAGE_dnsmasq_full_ipset=y
CONFIG_PACKAGE_dnsmasq_full_noid=y
CONFIG_PACKAGE_dnsmasq_full_tftp=y
# CONFIG_PACKAGE_dnsmasq is not set
CONFIG_PACKAGE_iptables-mod-fullconenat=y
CONFIG_PACKAGE_ip6tables-mod-fullconenat=y
CONFIG_PACKAGE_iptables-mod-nat-extra=y
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-ipt-nat6=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_kmod-r8168=y
#CONFIG_PACKAGE_kmod-shortcut-fe=y
#CONFIG_PACKAGE_kmod-fast-classifier=y
# CONFIG_PACKAGE_kmod-shortcut-fe-cm is not set
CONFIG_PACKAGE_libiwinfo=y
CONFIG_PACKAGE_libiwinfo-lua=y
CONFIG_PACKAGE_liblua=y
CONFIG_PACKAGE_liblucihttp=y
CONFIG_PACKAGE_liblucihttp-lua=y
CONFIG_PACKAGE_libubus-lua=y
CONFIG_PACKAGE_libustream-openssl=y
# CONFIG_PACKAGE_libustream-wolfssl is not set
CONFIG_PACKAGE_rpcd=y
CONFIG_PACKAGE_rpcd-mod-file=y
CONFIG_PACKAGE_rpcd-mod-iwinfo=y
CONFIG_PACKAGE_rpcd-mod-luci=y
CONFIG_PACKAGE_rpcd-mod-rrdns=y
CONFIG_PACKAGE_uhttpd=y
CONFIG_PACKAGE_wget-ssl=y
CONFIG_PACKAGE_lua=y
# CONFIG_PACKAGE_miniupnpd is not set
CONFIG_PACKAGE_miniupnpd-igdv1=y

### BUSYBOX ###
CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_CONFIG_FEATURE_SYSLOG_INFO=y

### LUCI ###
CONFIG_LUCI_LANG_zh_Hans=y
CONFIG_LUCI_LANG_en=y
# CONFIG_LUCI_CSSTIDY is not set
# CONFIG_LUCI_JSMIN is not set
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-app-firewall=y
CONFIG_PACKAGE_luci-base=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-ip=y
CONFIG_PACKAGE_luci-lib-ipkg=y
CONFIG_PACKAGE_luci-lib-jsonc=y
CONFIG_PACKAGE_luci-lib-nixio=y
CONFIG_PACKAGE_luci-mod-admin-full=y
CONFIG_PACKAGE_luci-mod-network=y
CONFIG_PACKAGE_luci-mod-status=y
CONFIG_PACKAGE_luci-mod-system=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_luci-proto-ppp=y

CONFIG_DEFAULT_kmod-rtl88x2bu=y   #无线5G8812BU

## File System Drivers
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
CONFIG_DEFAULT_kmod-fs-vfat=y
CONFIG_PACKAGE_ntfs-3g=y
#CONFIG_PACKAGE_antfs-mount=y
#CONFIG_PACKAGE_kmod-fs-antfs=n
#CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_block-mount=y
#base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts-cloudflare=y
CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_nsupdate=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y
CONFIG_PACKAGE_default-settings=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_automount=y
CONFIG_PACKAGE_autocore-x86=y
# CONFIG_PACKAGE_myautocore-x86=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=n

CONFIG_PACKAGE_kmod-inet-diag=y

##base插件
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y

# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
# CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=n
CONFIG_PACKAGE_luci-app-advanced=n
# CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
CONFIG_PACKAGE_luci-app-control-timewol=n
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
CONFIG_PACKAGE_luci-app-netdata=n
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=y 
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
CONFIG_PACKAGE_luci-app-passwall=n
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Client=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Libev_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server is not set
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Libev_Server=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_obfs_server=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-dnsfilter=n
CONFIG_PACKAGE_luci-app-kodexplorer=y
CONFIG_PACKAGE_luci-app-uhttpd=y
CONFIG_PACKAGE_luci-app-mentohust=n
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
CONFIG_PACKAGE_cupsd=n
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

#主题
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
#增加其它插件
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-unblockneteasemusic=n
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=n
# CONFIG_PACKAGE_luci-app-minidlna is not set
CONFIG_PACKAGE_luci-app-rclone=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=n
CONFIG_PACKAGE_luci-app-pptp-server=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
CONFIG_PACKAGE_luci-app-ipsec-vpnd=n
CONFIG_PACKAGE_luci-app-ipsec-serve=n
CONFIG_PACKAGE_luci-app-docker=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
# CONFIG_PACKAGE_luci-app-softethervpn is not set
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=n
CONFIG_PACKAGE_luci-app-transmission=n
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n


### RESET ###
CONFIG_PACKAGE_kmod-gpio-button-hotplug=y

### SHARE NETWORK ###
CONFIG_PACKAGE_usbmuxd=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y

### BBRv2 ###
CONFIG_PACKAGE_kmod-tcp-bbr2=y

### OPENSSL ###
CONFIG_OPENSSL_ENGINE=y
CONFIG_OPENSSL_OPTIMIZE_SPEED=y
CONFIG_OPENSSL_WITH_ASM=y
# CONFIG_OPENSSL_WITH_ERROR_MESSAGES is not set
CONFIG_PACKAGE_libopenssl-devcrypto=y
CONFIG_PACKAGE_libopenssl-conf=y
CONFIG_PACKAGE_openssl-util=y
CONFIG_PACKAGE_libcurl=y
CONFIG_LIBCURL_OPENSSL=y
# CONFIG_LIBCURL_MBEDTLS is not set
# CONFIG_LIBCURL_WOLFSSL is not set
# CONFIG_LIBCURL_GNUTLS is not set
# CONFIG_LIBCURL_NOSSL is not set

### Video Support ###
CONFIG_PACKAGE_kmod-drm-rockchip=y
CONFIG_PACKAGE_kmod-drm-panfrost=y
CONFIG_PACKAGE_kmod-multimedia-input=y

### DOCKER ###
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_block-mount=y
CONFIG_DOCKER_CGROUP_OPTIONS=y
CONFIG_DOCKER_KERNEL_OPTIONS=y
CONFIG_DOCKER_NET_ENCRYPT=y
CONFIG_DOCKER_NET_MACVLAN=y
CONFIG_DOCKER_NET_OVERLAY=y
CONFIG_DOCKER_NET_TFTP=y
CONFIG_DOCKER_RES_SHAPE=y
CONFIG_DOCKER_SECCOMP=y
CONFIG_DOCKER_STO_BTRFS=y
CONFIG_DOCKER_STO_EXT4=y
# 工具
CONFIG_PACKAGE_kmod-ntfs-3g=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_bash=y
