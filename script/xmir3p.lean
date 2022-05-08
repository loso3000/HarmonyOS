CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7621=y
CONFIG_TARGET_ramips_mt7621_DEVICE_xiaomi_mi-router-3-pro=y

## ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
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

CONFIG_PACKAGE_kmod-inet-diag=y

# CONFIG_PACKAGE_luci-app-wol is not set
CONFIG_PACKAGE_luci-app-wolplus=y

CONFIG_PACKAGE_default-settings=y
# CONFIG_PACKAGE_autosamba is not set
CONFIG_PACKAGE_automount=y
# CONFIG_PACKAGE_autocore-arm is not set
#CONFIG_PACKAGE_myautocore-x86=y
CONFIG_PACKAGE_myautocore-arm=y
CONFIG_PACKAGE_default-settings=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba-samba4=n
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary=n
CONFIG_PACKAGE_luci-app-advanced=n
# CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=n
# CONFIG_PACKAGE_luci-app-autoreboot is not set
# CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
# CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-timecontrol=n
# CONFIG_PACKAGE_luci-app-webadmin=n
# CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=n
# CONFIG_PACKAGE_luci-app-eqos=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle=n
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
CONFIG_PACKAGE_luci-app-ttyd=n
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
CONFIG_PACKAGE_luci-app-wrtbwmon=n
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-dnsto=n
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
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-wifidog=n
CONFIG_PACKAGE_wifidog=n
CONFIG_PACKAGE_luci-app-cupsd=n
CONFIG_PACKAGE_cupsd=n
CONFIG_PACKAGE_luci-app-mosdns=n
CONFIG_PACKAGE_luci-app-ikoolproxy=n
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
# CONFIG_PACKAGE_luci-app-wireguard is not set
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
CONFIG_PACKAGE_luci-theme-edge=n
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y

CONFIG_PACKAGE_luci-app-bridge=n
CONFIG_PACKAGE_luci-app-cowbping=n
CONFIG_PACKAGE_luci-app-beardropper=n
CONFIG_PACKAGE_luci-app-control-parentcontrol=y
CONFIG_PACKAGE_luci-app-https-dns-proxy=n
CONFIG_PACKAGE_luci-app-pwdHackDeny=n
CONFIG_PACKAGE_luci-app-oaf=n

#增加其它插件
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=n
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
CONFIG_PACKAGE_luci-app-syncdial=n
CONFIG_PACKAGE_luci-app-softethervpn=n
CONFIG_PACKAGE_luci-app-aliddns=n
# CONFIG_PACKAGE_luci-app-uugamebooster is not set
CONFIG_DEFAULT_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-transmission=n
# CONFIG_PACKAGE_luci-app-usb-printer is not set
CONFIG_PACKAGE_luci-app-mwan3helper=n
# CONFIG_PACKAGE_luci-app-qbittorrent is not set
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
#CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n

