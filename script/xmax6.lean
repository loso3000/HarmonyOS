CONFIG_TARGET_ipq807x=y
CONFIG_TARGET_ipq807x_generic=y
CONFIG_TARGET_ipq807x_generic_DEVICE_redmi_ax6=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# 其他需要安装的软件包:
# add ipv6 support
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y

CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
# USB3.0支持:
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
# 工具
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_curl=y
# CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
# add upnp
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_miniupnpd-igdv1=y
# CONFIG_PACKAGE_luci-app-boostupnp=y
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
# base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-aliyun=y
# CONFIG_PACKAGE_ddns-scripts_ddns-scripts-dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
# CONFIG_PACKAGE_ddns-scripts_freedns_42_pl=y
# CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
# CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
# CONFIG_PACKAGE_ddns-scripts_nsupdate=y
# CONFIG_PACKAGE_ddns-scripts_route53-v1=y
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_autosamba-ksmbd=y
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset=y
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol=y
CONFIG_PACKAGE_luci-app-control-weburl=n
# CONFIG_PACKAGE_luci-app-control-webrestriction=y
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=y
# CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-cpulimit=y
# CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=y
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle=y
# CONFIG_PACKAGE_luci-app-jd-dailybonus=y
CONFIG_PACKAGE_luci-app-koolproxyR=n
# CONFIG_PACKAGE_luci-app-netdata=y
# CONFIG_PACKAGE_luci-app-onliner=y
CONFIG_PACKAGE_luci-app-openclash=n
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
# CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-passwall=n
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server=y
CONFIG_PACKAGE_luci-app-ssrpro=n
# CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Rust_Client=y
# CONFIG_PACKAGE_luci-app-ssrpro_INCLUDE_Shadowsocks_Rust_Server=y
CONFIG_PACKAGE_luci-app-ttyd=n
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
CONFIG_PACKAGE_luci-app-mac=n
CONFIG_PACKAGE_luci-app-vssr=n
# CONFIG_PACKAGE_luci-app-wrtbwmon is not set
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
# CONFIG_PACKAGE_luci-app-dnsto=y
CONFIG_PACKAGE_luci-app-bypass=n
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-kodexplorer=y
# CONFIG_PACKAGE_luci-app-uhttpd=y
# CONFIG_PACKAGE_luci-app-mentohust=y
# CONFIG_PACKAGE_luci-app-easymesh=y
# CONFIG_PACKAGE_luci-app-wifimac=y
# CONFIG_PACKAGE_luci-app-ttnode=y
# CONFIG_PACKAGE_luci-app-adblock-plus=y
# CONFIG_PACKAGE_luci-app-change-mac=y
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# 主题
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=n
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
# 增加其它插件
# CONFIG_PACKAGE_luci-app-ksmbd=y
# CONFIG_PACKAGE_luci-app-cifsd=y
# CONFIG_PACKAGE_luci-app-cifs-mount=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
CONFIG_PACKAGE_luci-app-mwan3=n
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone=y
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
# CONFIG_PACKAGE_luci-app-pptp-server=y
# CONFIG_PACKAGE_luci-app-pppoe-server=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-ipsec-serve=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=y
# CONFIG_PACKAGE_luci-app-docker=y
# CONFIG_PACKAGE_luci-app-dockerman=y
# CONFIG_PACKAGE_luci-app-koolddns=y
CONFIG_PACKAGE_luci-app-syncdial=n
# CONFIG_PACKAGE_luci-app-softethervpn=y
# CONFIG_PACKAGE_luci-app-uugamebooster=y
# CONFIG_DEFAULT_luci-app-cpufreq=y
# CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
# CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=n
# CONFIG_PACKAGE_luci-app-mwan3helper=y
# CONFIG_PACKAGE_luci-app-qbittorrent=y
# CONFIG_PACKAGE_luci-app-familycloud=y
# CONFIG_PACKAGE_luci-app-nps=y
# CONFIG_PACKAGE_luci-app-frpc=y
# CONFIG_PACKAGE_luci-app-nfs=y
# CONFIG_PACKAGE_luci-app-openvpn-server=y
# CONFIG_PACKAGE_luci-app-aria2=y
# CONFIG_PACKAGE_luci-app-openvpn=y
CONFIG_PACKAGE_luci-app-vlmcsd=y
