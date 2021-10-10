# 设置固件大小
CONFIG_TARGET_KERNEL_PARTSIZE=60
CONFIG_TARGET_ROOTFS_PARTSIZE=1516
CONFIG_TARGET_rockchip=y
CONFIG_TARGET_rockchip_armv8=y
CONFIG_TARGET_rockchip_armv8_DEVICE_friendlyarm_nanopi-r4s=y
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set
# ipv6
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# file system
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-antfs=y
# CONFIG_PACKAGE_kmod-fs-ntfs  is not set
CONFIG_PACKAGE_kmod-fuse=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
#ksmbd
CONFIG_PACKAGE_kmod-nls-utf8=y
# 添加网络配置
CONFIG_PACKAGE_ppp-mod-pptp=y  #VPN客户端
CONFIG_PACKAGE_kmod-vmxnet3=n
CONFIG_PACKAGE_kmod-pcnet32=y
# add upnp
CONFIG_PACKAGE_miniupnpd-igdv1=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-boostupnp=n
CONFIG_PACKAGE_luci-app-wol=y
# CONFIG_PACKAGE_luci-app-wolplus=n
# 工具
CONFIG_PACKAGE_snmpd=y #旁路由穿透显示真机器MAC
CONFIG_PACKAGE_fdisk=y #分区工具
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_curl=y
# base
CONFIG_PACKAGE_ddns-scripts=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_aliyun=y
CONFIG_PACKAGE_ddns-scripts_ddns-scripts_dnspod=y
CONFIG_PACKAGE_ddns-scripts_cloudflare.com-v4=y
CONFIG_PACKAGE_autosamba-ksmbd=n
CONFIG_PACKAGE_autosamba=y
# CONFIG_PACKAGE_autosamba-samba4=y
CONFIG_PACKAGE_luci-app-accesscontrol=y
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-advanced=n
CONFIG_PACKAGE_luci-app-autotimeset=n
CONFIG_PACKAGE_luci-app-rebootschedule=n
CONFIG_PACKAGE_luci-app-autoreboot=y
CONFIG_PACKAGE_luci-app-control-timewol=n
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=n
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-cpulimit=n
CONFIG_PACKAGE_luci-app-diskman=n
CONFIG_PACKAGE_luci-app-eqos=n
CONFIG_PACKAGE_luci-app-hd-idle=n
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-openclash=n
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-samba=y
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_PACKAGE_luci-app-serverchan=n
# CONFIG_PACKAGE_luci-app-sfe is no set
# CONFIG_PACKAGE_luci-app-flowoffload is no set
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-smartdns=n
# CONFIG_PACKAGE_luci-app-ssr-plus is no set
CONFIG_PACKAGE_luci-app-timecontrol=n
CONFIG_PACKAGE_luci-app-access-control=n
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_shortcut-fe=y
CONFIG_PACKAGE_luci-app-vssr=n
CONFIG_PACKAGE_luci-app-wrtbwmon=n
# CONFIG_PACKAGE_luci-app-nlbwmon is not set
CONFIG_PACKAGE_luci-app-netspeedtest=n
CONFIG_PACKAGE_luci-app-dnsto=n
CONFIG_PACKAGE_luci-app-bypass=n
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy=n
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray=n
CONFIG_PACKAGE_luci-app-dnsfilter=n
# CONFIG_PACKAGE_luci-app-vsftpd is not set
CONFIG_PACKAGE_luci-app-switch-lan-play=n
CONFIG_PACKAGE_luci-app-mentohust=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# 主题
CONFIG_PACKAGE_luci-theme-atmaterial_new=y
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-argon_new=y
CONFIG_PACKAGE_luci-theme-netgear=y
CONFIG_PACKAGE_luci-theme-opentomato=y
CONFIG_PACKAGE_luci-theme-opentomcat=y
CONFIG_PACKAGE_luci-theme-opentopd=y
#增加其它插件
CONFIG_PACKAGE_luci-app-tencentddns=n
CONFIG_PACKAGE_luci-app-pushbot=n
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=n
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
CONFIG_PACKAGE_luci-app-mwan3=n
CONFIG_PACKAGE_luci-app-unblockneteasemusic=n
CONFIG_PACKAGE_luci-app-unblockmusic=n
CONFIG_UnblockNeteaseMusic_Go=y
CONFIG_UnblockNeteaseMusic_NodeJS=y
# CONFIG_PACKAGE_luci-app-minidlna is not set
# CONFIG_PACKAGE_luci-app-rclone is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
CONFIG_PACKAGE_luci-app-pptp-server=n
CONFIG_PACKAGE_luci-app-pppoe-server=n
CONFIG_PACKAGE_luci-app-ipsec-server=n
CONFIG_PACKAGE_luci-app-docker=n
CONFIG_PACKAGE_luci-app-dockerman=n
CONFIG_PACKAGE_luci-app-koolddns=n
CONFIG_PACKAGE_luci-app-syncdial=n
CONFIG_PACKAGE_luci-app-softethervpn=y
CONFIG_PACKAGE_luci-app-uugamebooster=n
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=n
CONFIG_PACKAGE_luci-app-socat=n
CONFIG_PACKAGE_luci-app-oaf=n
CONFIG_PACKAGE_luci-app-transmission=n
CONFIG_PACKAGE_luci-app-usb-printer=n
CONFIG_PACKAGE_luci-app-mwan3helper=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-familycloud=n
CONFIG_PACKAGE_luci-app-nps=n
CONFIG_PACKAGE_luci-app-frpc=n
CONFIG_PACKAGE_luci-app-nfs=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_luci-app-openvpn=n
CONFIG_PACKAGE_luci-app-ttnode=n
# USB Suppport
CONFIG_PACKAGE_kmod-usb-audio=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
# USB3.0
# USB net driver
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-mt76=y
CONFIG_PACKAGE_kmod-mt76x2u=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
# Wireless Drivers
CONFIG_B43LEGACY_FW_SQUASH=y
CONFIG_B43LEGACY_FW_SQUASH_COREREVS="1234"
CONFIG_B43_FW_5_100_138=y
CONFIG_B43_FW_SQUASH=y
CONFIG_B43_FW_SQUASH_COREREVS="567891011131516282930"
CONFIG_B43_FW_SQUASH_PHYTYPES="GNLPHT"
CONFIG_BRCMFMAC_PCIE=y
CONFIG_BRCMFMAC_USB=y
CONFIG_BRCMSMAC_USE_FW_FROM_WL=y
CONFIG_DRIVER_11AX_SUPPORT=y
CONFIG_DRIVER_WEXT_SUPPORT=y
CONFIG_PACKAGE_B43_BUSES_BCMA_AND_SSB=y
CONFIG_PACKAGE_B43_PHY_G=y
CONFIG_PACKAGE_B43_PHY_HT=y
CONFIG_PACKAGE_B43_PHY_LP=y
CONFIG_PACKAGE_B43_PHY_N=y
CONFIG_PACKAGE_B43_USE_BCMA=y
CONFIG_PACKAGE_B43_USE_SSB=y
CONFIG_PACKAGE_b43legacy-firmware=y
CONFIG_PACKAGE_brcmfmac-firmware-4366b1-pcie=y
CONFIG_PACKAGE_brcmfmac-firmware-4366c0-pcie=y
CONFIG_PACKAGE_brcmfmac-firmware-usb=y
CONFIG_PACKAGE_carl9170-firmware=y
CONFIG_PACKAGE_cypress-firmware-4356-pcie=y
CONFIG_PACKAGE_cypress-firmware-43570-pcie=y
CONFIG_PACKAGE_cypress-firmware-4373-usb=y
CONFIG_PACKAGE_cypress-firmware-54591-pcie=y
CONFIG_PACKAGE_iwl3945-firmware=y
CONFIG_PACKAGE_iwl4965-firmware=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl100=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl1000=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl105=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl135=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl2000=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl2030=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl3160=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl3168=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl5000=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl5150=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl6000g2=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl6000g2a=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl6000g2b=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl6050=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl7260=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl7265=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl7265d=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl8260c=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl8265=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl9000=y
CONFIG_PACKAGE_iwlwifi-firmware-iwl9260=y
CONFIG_PACKAGE_kmod-adm8211=y
CONFIG_PACKAGE_kmod-ath6kl=y
CONFIG_PACKAGE_kmod-ath6kl-usb=y
CONFIG_PACKAGE_kmod-ath11k=n
CONFIG_PACKAGE_kmod-b43=y
CONFIG_PACKAGE_kmod-b43legacy=y
CONFIG_PACKAGE_kmod-bcma=y
CONFIG_PACKAGE_kmod-brcmfmac=y
CONFIG_PACKAGE_kmod-brcmsmac=y
CONFIG_PACKAGE_kmod-brcmutil=y
CONFIG_PACKAGE_kmod-carl9170=y
CONFIG_PACKAGE_kmod-hermes=y
CONFIG_PACKAGE_kmod-hermes-pci=y
CONFIG_PACKAGE_kmod-ipw2100=y
CONFIG_PACKAGE_kmod-ipw2200=y
CONFIG_PACKAGE_kmod-iwl-legacy=y
CONFIG_PACKAGE_kmod-iwl3945=y
CONFIG_PACKAGE_kmod-iwl4965=y
CONFIG_PACKAGE_kmod-lib-cordic=y
CONFIG_PACKAGE_kmod-lib-crc8=y
CONFIG_PACKAGE_kmod-lib80211=y
CONFIG_PACKAGE_kmod-libertas-usb=y
CONFIG_PACKAGE_kmod-libipw=y
CONFIG_PACKAGE_kmod-mt76-core=y
CONFIG_PACKAGE_kmod-mt76-usb=y
CONFIG_PACKAGE_kmod-mt7601u=y
CONFIG_PACKAGE_kmod-mt7603=y
CONFIG_PACKAGE_kmod-mt7615-common=y
CONFIG_PACKAGE_kmod-mt7615-firmware=y
CONFIG_PACKAGE_kmod-mt7615e=y
CONFIG_PACKAGE_kmod-mt7663-firmware-ap=y
CONFIG_PACKAGE_kmod-mt7663-usb-sdio=y
CONFIG_PACKAGE_kmod-mt7663u=y
CONFIG_PACKAGE_kmod-mt76x0-common=y
CONFIG_PACKAGE_kmod-mt76x02-common=y
CONFIG_PACKAGE_kmod-mt76x02-usb=y
CONFIG_PACKAGE_kmod-mt76x0e=y
CONFIG_PACKAGE_kmod-mt76x0u=y
CONFIG_PACKAGE_kmod-mt76x2=y
CONFIG_PACKAGE_kmod-mt76x2-common=y
CONFIG_PACKAGE_kmod-mt7915e=y
CONFIG_PACKAGE_kmod-mwifiex-pcie=y
CONFIG_PACKAGE_kmod-mwl8k=y
CONFIG_PACKAGE_kmod-net-prism54=y
CONFIG_PACKAGE_kmod-net-rtl8192su=y
CONFIG_PACKAGE_kmod-owl-loader=y
CONFIG_PACKAGE_kmod-p54-common=y
CONFIG_PACKAGE_kmod-p54-pci=y
CONFIG_PACKAGE_kmod-p54-usb=y
CONFIG_PACKAGE_kmod-rsi91x=y
CONFIG_PACKAGE_kmod-rsi91x-usb=y
CONFIG_PACKAGE_kmod-rt2400-pci=y
CONFIG_PACKAGE_kmod-rt2500-pci=y
CONFIG_PACKAGE_kmod-rt2500-usb=y
CONFIG_PACKAGE_kmod-rt2800-mmio=y
CONFIG_PACKAGE_kmod-rt2800-pci=y
CONFIG_PACKAGE_kmod-rt2x00-mmio=y
CONFIG_PACKAGE_kmod-rt2x00-pci=y
CONFIG_PACKAGE_kmod-rt61-pci=y
CONFIG_PACKAGE_kmod-rt73-usb=y
CONFIG_PACKAGE_kmod-rtl8180=y
CONFIG_PACKAGE_kmod-rtl8187=y
CONFIG_PACKAGE_kmod-rtl8188eu=y
CONFIG_PACKAGE_kmod-rtl8192c-common=y
CONFIG_PACKAGE_kmod-rtl8192ce=y
CONFIG_PACKAGE_kmod-rtl8192du=y
CONFIG_PACKAGE_kmod-rtl8192de=y
CONFIG_PACKAGE_kmod-rtl8192se=y
CONFIG_PACKAGE_kmod-rtl8821ae=y
CONFIG_PACKAGE_kmod-rtl88x2bu=y
CONFIG_PACKAGE_kmod-rtlwifi-pci=y
CONFIG_PACKAGE_kmod-rtw88=y
CONFIG_PACKAGE_kmod-ssb=y
CONFIG_PACKAGE_kmod-wl12xx=y
CONFIG_PACKAGE_kmod-wl18xx=y
CONFIG_PACKAGE_kmod-wlcore=y
CONFIG_PACKAGE_kmod-zd1211rw=y
CONFIG_PACKAGE_libertas-usb-firmware=y
CONFIG_PACKAGE_mt7601u-firmware=y
CONFIG_PACKAGE_mwifiex-pcie-firmware=y
CONFIG_PACKAGE_mwl8k-firmware=y
CONFIG_PACKAGE_p54-pci-firmware=y
CONFIG_PACKAGE_p54-usb-firmware=y
CONFIG_PACKAGE_prism54-firmware=y
CONFIG_PACKAGE_rs9113-firmware=y
CONFIG_PACKAGE_rt2800-pci-firmware=y
CONFIG_PACKAGE_rt61-pci-firmware=y
CONFIG_PACKAGE_rt73-usb-firmware=y
CONFIG_PACKAGE_rtl8188eu-firmware=y
CONFIG_PACKAGE_rtl8192ce-firmware=y
CONFIG_PACKAGE_rtl8192cu-firmware=y
CONFIG_PACKAGE_rtl8192de-firmware=y
CONFIG_PACKAGE_rtl8192eu-firmware=y
CONFIG_PACKAGE_rtl8192se-firmware=y
CONFIG_PACKAGE_rtl8192su-firmware=y
CONFIG_PACKAGE_rtl8723au-firmware=y
CONFIG_PACKAGE_rtl8723bu-firmware=y
CONFIG_PACKAGE_rtl8821ae-firmware=y
CONFIG_PACKAGE_rtl8822be-firmware=y
CONFIG_PACKAGE_rtl8822ce-firmware=y
CONFIG_PACKAGE_wl12xx-firmware=y
CONFIG_PACKAGE_wl18xx-firmware=y

# network 
CONFIG_PACKAGE_bnx2x-firmware=y
CONFIG_PACKAGE_e100-firmware=y
CONFIG_PACKAGE_kmod-atm=y
CONFIG_PACKAGE_kmod-iavf=y
CONFIG_PACKAGE_kmod-lib-crc32c=y
CONFIG_PACKAGE_kmod-mdio-gpio=y
CONFIG_PACKAGE_kmod-misdn=y
CONFIG_PACKAGE_kmod-phy-bcm84881=y
CONFIG_PACKAGE_kmod-phylink=y
CONFIG_PACKAGE_kmod-random-core=y
CONFIG_PACKAGE_kmod-sfp=y
CONFIG_PACKAGE_kmod-switch-bcm53xx=y
CONFIG_PACKAGE_kmod-switch-bcm53xx-mdio=y
CONFIG_PACKAGE_kmod-switch-rtl8366-smi=y
CONFIG_PACKAGE_kmod-switch-rtl8366s=y
CONFIG_PACKAGE_kmod-switch-rtl8367b=y
CONFIG_PACKAGE_kmod-usb-atm=y
CONFIG_PACKAGE_kmod-usb-atm-cxacru=y
CONFIG_PACKAGE_kmod-usb-atm-speedtouch=y
CONFIG_PACKAGE_kmod-usb-atm-ueagle=y
CONFIG_PACKAGE_kmod-usb-cm109=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-yealink=y
CONFIG_PACKAGE_kmod-usbip=y
CONFIG_PACKAGE_kmod-usbip-client=y
CONFIG_PACKAGE_kmod-usbip-server=y
CONFIG_PACKAGE_kmod-usbmon=y
# add drive
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
