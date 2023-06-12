CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7621=y
CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_redmi-router-ac2100=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
CONFIG_COREMARK_NUMBER_OF_THREADS=32
CONFIG_NPC_COMPRESS_UPX=y
CONFIG_NPS_COMPRESS_UPX=y
CONFIG_PACKAGE_boost=y
CONFIG_PACKAGE_boost-date_time=y
CONFIG_PACKAGE_boost-program_options=y
CONFIG_PACKAGE_boost-system=y
CONFIG_PACKAGE_libatomic=y
CONFIG_PACKAGE_libmbedtls=y
CONFIG_PACKAGE_libstdcpp=y

CONFIG_boost-compile-visibility-hidden=y
CONFIG_boost-runtime-shared=y
CONFIG_boost-static-and-shared-libs=y
CONFIG_boost-variant-release=y

# 其他需要安装的软件包:
# add ipv6 support
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# add upnp

# CONFIG_PACKAGE_autocore-x86 is not set
CONFIG_PACKAGE_autocore-arm=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_miniupnpd-igdv1=y
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
# CONFIG_PACKAGE_autosamba-ksmbd=y
CONFIG_PACKAGE_autosamba-samba4=n
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-advanced=y
# CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=y
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
# CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=n
# CONFIG_PACKAGE_luci-app-webadmin=n
# CONFIG_PACKAGE_luci-app-cpulimit=n
# CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle=n
# CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
# CONFIG_PACKAGE_luci-app-netdata=n
# CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=n
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=n
# CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-passwall=n
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust_Client=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Client=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust_Server=y
CONFIG_PACKAGE_luci-app-ttyd=n
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-mac=n
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-wrtbwmon=y
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
# CONFIG_PACKAGE_luci-app-dnsto=n
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
# CONFIG_PACKAGE_luci-app-kodexplorer=n
# CONFIG_PACKAGE_luci-app-uhttpd=n
# CONFIG_PACKAGE_luci-app-mentohust=n
# CONFIG_PACKAGE_luci-app-wifimac=n
# CONFIG_PACKAGE_luci-app-ttnode=n
# CONFIG_PACKAGE_luci-app-adblock-plus=n
# CONFIG_PACKAGE_luci-app-change-mac=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-guest-wifi=n
CONFIG_PACKAGE_luci-app-wifischedule=n
# 主题
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=n
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
# 增加其它插件
# CONFIG_PACKAGE_luci-app-ksmbd=n
# CONFIG_PACKAGE_luci-app-cifsd=n
# CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=n
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone=n
# CONFIG_PACKAGE_luci-app-pptp-server=n
# CONFIG_PACKAGE_luci-app-pppoe-server=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-ipsec-serve=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers=n
# CONFIG_PACKAGE_luci-app-docker=n
# CONFIG_PACKAGE_luci-app-dockerman=n
# CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
# CONFIG_PACKAGE_luci-app-softethervpn=n
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
# CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=n
# CONFIG_PACKAGE_luci-app-transmission=n
CONFIG_PACKAGE_luci-app-usb-printer=n
# CONFIG_PACKAGE_luci-app-mwan3helper=n
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
# CONFIG_PACKAGE_luci-app-familycloud=n
# CONFIG_PACKAGE_luci-app-nps=n
# CONFIG_PACKAGE_luci-app-frpc=n
# CONFIG_PACKAGE_luci-app-nfs=n
# CONFIG_PACKAGE_luci-app-openvpn-server=n
# CONFIG_PACKAGE_luci-app-aria2=n
# CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-pushbot=y
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
CONFIG_PACKAGE_luci-app-wizard=n
CONFIG_PACKAGE_luci-app-cowbping=y
CONFIG_PACKAGE_luci-app-beardropper=y
CONFIG_PACKAGE_luci-app-control-parentcontrol=y
