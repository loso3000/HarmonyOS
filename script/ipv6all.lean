CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y


# 所集成的固件类型
CONFIG_TARGET_ROOTFS_TARGZ=y
CONFIG_TARGET_ROOTFS_SQUASHFS=y

# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set

# 设置固件大小
CONFIG_COREMARK_NUMBER_OF_THREADS=128
CONFIG_TARGET_KERNEL_PARTSIZE=64
CONFIG_TARGET_ROOTFS_PARTSIZE=920


CONFIG_ALL_KMODS=y
CONFIG_ALL_NONSHARED=y
CONFIG_GRUB_IMAGES=y
CONFIG_GRUB_EFI_IMAGES=y
CONFIG_BUSYBOX_CUSTOM=y
CONFIG_BUSYBOX_CONFIG_FEATURE_SYSLOG_INFO=y
# CONFIG_GRUB_CONSOLE is not set
CONFIG_GRUB_TIMEOUT="0"
CONFIG_GRUB_TITLE="OpenWrt"
# CONFIG_ISO_IMAGES is not set

# CONFIG_VMDK_IMAGES is not set

# CONFIG_SIGNATURE_CHECK is not set
# CONFIG_SIGNED_PACKAGES is not set

# CONFIG_PACKAGE_i915-firmware is not set
# CONFIG_PACKAGE_kmod-backlight-pwm is not set
# CONFIG_PACKAGE_kmod-drm-amdgpu is not set
# CONFIG_PACKAGE_kmod-drm-kms-helper is not set
# CONFIG_PACKAGE_kmod-drm-radeon is not set
# CONFIG_PACKAGE_kmod-drm-ttm is not set
# CONFIG_PACKAGE_kmod-fb is not set
# CONFIG_PACKAGE_kmod-fb-cfb-copyarea is not set
# CONFIG_PACKAGE_kmod-fb-cfb-fillrect is not set
# CONFIG_PACKAGE_kmod-fb-cfb-imgblt is not set
# CONFIG_PACKAGE_kmod-fb-sys-fops is not set
# CONFIG_PACKAGE_kmod-fb-sys-ram is not set
# CONFIG_PACKAGE_kmod-fb-tft is not set
# CONFIG_PACKAGE_kmod-fb-tft-ili9486 is not set
# CONFIG_PACKAGE_kmod-multimedia-input is not set
# CONFIG_PACKAGE_kmod-video-core is not set

#ipv6

CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_6rd=y
CONFIG_PACKAGE_6to4=y


#USB net driver
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-roles=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y

# USB3.0支持:
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y


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
# CONFIG_PACKAGE_kmod-r8169 is not set
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
CONFIG_DEFAULT_kmod-via-velocity=y
CONFIG_DEFAULT_kmod-vmxnet3=y


CONFIG_PACKAGE_automount=y

#add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y
#base插件
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_ddns-scripts-cloudflare=y
CONFIG_PACKAGE_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_aliyun=y
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
# CONFIG_PACKAGE_my-autocore-x86=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=y
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=y
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=y
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-timecontrol=y
# CONFIG_PACKAGE_luci-app-webadmin=y
# CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle=n
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
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
CONFIG_PACKAGE_luci-app-ttyd=n
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
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray_plugin=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_obfs_server=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-dnsfilter=y
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
CONFIG_PACKAGE_cupsd=n
CONFIG_PACKAGE_luci-app-mosdns=n
CONFIG_PACKAGE_luci-app-ikoolproxy=y
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
# CONFIG_PACKAGE_luci-app-wireguard is not set   #默认加了取消
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
#主题
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh-cn=y
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
CONFIG_PACKAGE_luci-theme-bootstrap=y
#增加其它插件
CONFIG_PACKAGE_luci-app-tencentddns=y
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=y
# CONFIG_PACKAGE_luci-app-minidlna is not set
CONFIG_PACKAGE_luci-app-rclone=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=n
CONFIG_PACKAGE_luci-app-pptp-server=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-ipsec-serve=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers is not set
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=n
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer is not set
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
#CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n



# 工具
CONFIG_PACKAGE_kmod-ntfs-3g=y
# CONFIG_PACKAGE_kmod-fs-ntfs is not set

CONFIG_PACKAGE_acpid=y
CONFIG_PACKAGE_blkid=y
# CONFIG_PACKAGE_qemu-ga=y
# CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_open-vm-tools=y #虚拟机支持管理性能更好
# CONFIG_PACKAGE_ethtool=y #网卡工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
# CONFIG_PACKAGE_parted=n #128个区分区工具z
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_hdparm=y  #移动硬盘设置
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_openssh-sftp-server=y  #sftp
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_ipt2socks=y
# CONFIG_PACKAGE_wget-ssl=y


CONFIG_PACKAGE_coremark=y

CONFIG_PACKAGE_perl=y
CONFIG_PACKAGE_perl-http-date=y
CONFIG_PACKAGE_perlbase-getopt=y
CONFIG_PACKAGE_perlbase-time=y
CONFIG_PACKAGE_perlbase-unicode=y
CONFIG_PACKAGE_perlbase-utf8=y

CONFIG_PACKAGE_aircrack-ng=m
# CONFIG_PACKAGE_apcupsd=y
# CONFIG_PACKAGE_apcupsd-cgi=y
CONFIG_PACKAGE_attr=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_base-files=y
CONFIG_PACKAGE_blockd=y
CONFIG_PACKAGE_bsdtar=y
CONFIG_PACKAGE_btrfs-progs=y
CONFIG_PACKAGE_bzip2=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_chattr=y
CONFIG_PACKAGE_cfdisk=y
CONFIG_PACKAGE_coremark=y
CONFIG_PACKAGE_coreutils=y
CONFIG_PACKAGE_coreutils-base64=y
CONFIG_PACKAGE_coreutils-nohup=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_dumpe2fs=y
CONFIG_PACKAGE_dosfstools=y
CONFIG_PACKAGE_e2freefrag=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_gzip=y
CONFIG_PACKAGE_gawk=y
CONFIG_PACKAGE_getopt=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_iconv=y
CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_jq=y
CONFIG_PACKAGE_jshn=y
CONFIG_PACKAGE_iftop=y
CONFIG_PACKAGE_lsattr=y
CONFIG_PACKAGE_libpci=y
CONFIG_PACKAGE_libpcre=y
CONFIG_PACKAGE_libpcre16=y
CONFIG_PACKAGE_libpcre2=y
CONFIG_PACKAGE_libpcre2-16=y
CONFIG_PACKAGE_libpcre2-32=y
CONFIG_PACKAGE_libpng=y
CONFIG_PACKAGE_libpopt=y
CONFIG_PACKAGE_libprotobuf-c=y
CONFIG_PACKAGE_libqmi=y
CONFIG_PACKAGE_libreadline=y
CONFIG_PACKAGE_libseccomp=y
CONFIG_PACKAGE_libsmartcols=y
CONFIG_PACKAGE_libsndfile=y
CONFIG_PACKAGE_libsoc=y
CONFIG_PACKAGE_libsocks=y
CONFIG_PACKAGE_libsodium=y
CONFIG_PACKAGE_less-wide=y
CONFIG_PACKAGE_libjson-script=y
CONFIG_PACKAGE_libnetwork=y
CONFIG_PACKAGE_lrzsz=y
CONFIG_PACKAGE_lsof=y
CONFIG_PACKAGE_lm-sensors=y
CONFIG_PACKAGE_losetup=y
CONFIG_PACKAGE_lsblk=y
CONFIG_PACKAGE_lscpu=y
CONFIG_PACKAGE_lz4=y
CONFIG_PACKAGE_mkf2fs=y
CONFIG_PACKAGE_mount-utils=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_openssl-util=y
CONFIG_PACKAGE_p7zip=y
CONFIG_PACKAGE_parted=y
CONFIG_PACKAGE_pv=y
CONFIG_PACKAGE_qmi-utils=y
CONFIG_PACKAGE_rclone=y
CONFIG_PACKAGE_runc=y
CONFIG_PACKAGE_resize2fs=y
CONFIG_PACKAGE_sysstat=y
CONFIG_PACKAGE_shellsync=y
CONFIG_PACKAGE_smartmontools=y
CONFIG_PACKAGE_smartmontools-drivedb=y
CONFIG_PACKAGE_samba4-admin=y
CONFIG_PACKAGE_samba4-client=y
CONFIG_PACKAGE_samba4-libs=y
CONFIG_PACKAGE_samba4-server=y
CONFIG_SAMBA4_SERVER_NETBIOS=y
CONFIG_SAMBA4_SERVER_AVAHI=y
CONFIG_SAMBA4_SERVER_VFS=y
# CONFIG_SAMBA4_SERVER_VFSX is not set
# CONFIG_SAMBA4_SERVER_AD_DC is not set
CONFIG_PACKAGE_samba4-utils=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_tune2fs=y
CONFIG_PACKAGE_tar=y
#CONFIG_PACKAGE_tini=y
#CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_usb-modeswitch=y
#CONFIG_PACKAGE_usbutils=y
#CONFIG_PACKAGE_usbreset=y
#CONFIG_PACKAGE_uuid=y
#CONFIG_PACKAGE_uuidgen=y
CONFIG_PACKAGE_vim=y
CONFIG_PACKAGE_wireless-tools=y
# CONFIG_PACKAGE_wireguard-tools is not set
#CONFIG_PACKAGE_whereis=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_wwan=y
#CONFIG_PACKAGE_xfs-fsck=y
#CONFIG_PACKAGE_xfs-mkfs=y
#CONFIG_PACKAGE_xz-utils=y
#CONFIG_PACKAGE_xz=y
# CONFIG_PACKAGE_zstd=y
#CONFIG_VSFTPD_USE_UCI_SCRIPTS=y
#CONFIG_RUNC_SECCOMP=y
CONFIG_STRACE_NONE=y
CONFIG_PCAP_HAS_USB=y
CONFIG_PCAP_HAS_NETFILTER=y
CONFIG_KERNEL_MAGIC_SYSRQ=y

CONFIG_PACKAGE_rsync=y
CONFIG_PACKAGE_rsyncd=y
CONFIG_PACKAGE_bind-dig=y
CONFIG_PACKAGE_bind-host=y
CONFIG_PACKAGE_mentohust=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_nginx=y
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_pandownload-fake-server=y
CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_xl2tpd=y
# CONFIG_PACKAGE_xray-core=y
# CONFIG_PACKAGE_xray-plugin=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_fullconenat=y

CONFIG_PACKAGE_apk=y
CONFIG_PACKAGE_alpine-keys=y
CONFIG_PACKAGE_alpine-repositories=y
CONFIG_PACKAGE_bsdtar=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_zip=y
CONFIG_PACKAGE_fstrim=y
CONFIG_PACKAGE_gpioctl-sysfs=y
CONFIG_PACKAGE_gpiod-tools=y
CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_shadow-chsh=y
CONFIG_PACKAGE_tmux=y
CONFIG_PACKAGE_gotop=y
CONFIG_PACKAGE_tmate=y
CONFIG_PACKAGE_udp2raw-tunnel=y

CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_luci-proto-qmi=y
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

CONFIG_DEVEL=y
CONFIG_CCACHE=y
