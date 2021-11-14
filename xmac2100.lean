CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7621=y
CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_redmi-router-ac2100=y
CONFIG_KERNEL_MIPS_FPU_EMULATOR=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# 其他需要安装的软件包:
CONFIG_OPENSSL_PREFER_CHACHA_OVER_GCM=y
CONFIG_PACKAGE_autocore-switch=y

# add ipv6 support
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_iputils-traceroute6=y

#nfs
CONFIG_PACKAGE_kmod-fs-nfsd=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set
CONFIG_PACKAGE_kmod-fs-f2fs=y

# USB3.0支持:
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-audio=y
CONFIG_PACKAGE_kmod-usb-printer=y
# 工具
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_tcpdump=y
CONFIG_PACKAGE_zsh=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
# add upnp
# CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_miniupnpd-igdv1=y
# CONFIG_PACKAGE_luci-app-boostupnp is not set
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
CONFIG_PACKAGE_ddns-scripts_godaddy.com-v1=y
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_PACKAGE_ddns-scripts_nsupdate=y
CONFIG_PACKAGE_ddns-scripts_route53-v1=y
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_autosamba-ksmbd is not set
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-adguardhome is not set
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset is not set
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol is not set
CONFIG_PACKAGE_luci-app-control-weburl=n
# CONFIG_PACKAGE_luci-app-control-webrestriction is not set
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=y
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
CONFIG_PACKAGE_luci-app-samba4=y
# CONFIG_PACKAGE_luci-app-serverchan is not set
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client is not set
CONFIG_PACKAGE_luci-app-ssr-plus=y
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
CONFIG_PACKAGE_luci-app-vssr=y
# CONFIG_PACKAGE_luci-app-wrtbwmon is not set
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
# CONFIG_PACKAGE_luci-app-dnsto is not set
CONFIG_PACKAGE_luci-app-bypass=n
CONFIG_PACKAGE_luci-app-dnsfilter=y
# CONFIG_PACKAGE_luci-app-kodexplorer is not set
# CONFIG_PACKAGE_luci-app-uhttpd is not set
# CONFIG_PACKAGE_luci-app-mentohust is not set
# CONFIG_PACKAGE_luci-app-easymesh is not set
# CONFIG_PACKAGE_luci-app-wifimac is not set
# CONFIG_PACKAGE_luci-app-ttnode is not set
# CONFIG_PACKAGE_luci-app-adblock-plus is not set
# CONFIG_PACKAGE_luci-app-change-mac is not set
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
CONFIG_PACKAGE_luci-theme-opentopd=y
# 增加其它插件
# CONFIG_PACKAGE_luci-app-ksmbd is not set
# CONFIG_PACKAGE_luci-app-cifsd is not set
# CONFIG_PACKAGE_luci-app-cifs-mount is not set
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
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
CONFIG_PACKAGE_luci-app-syncdial=n
# CONFIG_PACKAGE_luci-app-softethervpn is not set
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
# CONFIG_DEFAULT_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-udpxy is not set
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
# CONFIG_PACKAGE_luci-app-transmission is not set
CONFIG_PACKAGE_luci-app-usb-printer=n
# CONFIG_PACKAGE_luci-app-mwan3helper is not set
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
# CONFIG_PACKAGE_luci-app-familycloud is not set
# CONFIG_PACKAGE_luci-app-nps is not set
# CONFIG_PACKAGE_luci-app-frpc is not set
# CONFIG_PACKAGE_luci-app-nfs is not set
# CONFIG_PACKAGE_luci-app-openvpn-server is not set
# CONFIG_PACKAGE_luci-app-aria2 is not set
# CONFIG_PACKAGE_luci-app-openvpn is not set
CONFIG_PACKAGE_luci-app-vlmcsd=y
