CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y
# 设置固件大小
CONFIG_TARGET_KERNEL_PARTSIZE=64
CONFIG_TARGET_ROOTFS_PARTSIZE=926

CONFIG_COREMARK_NUMBER_OF_THREADS=128
CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256
# CONFIG_PACKAGE_i915-firmware is not set

# 所集成的固件类型
# CONFIG_TARGET_ROOTFS_INITRAMFS is not set
# CONFIG_TARGET_ROOTFS_CPIOGZ is not set
CONFIG_TARGET_ROOTFS_TARGZ=y
# CONFIG_TARGET_ROOTFS_EXT4FS is not set
CONFIG_TARGET_ROOTFS_SQUASHFS=y
CONFIG_TARGET_UBIFS_FREE_SPACE_FIXUP=y
CONFIG_TARGET_UBIFS_JOURNAL_SIZE=""
CONFIG_GRUB_IMAGES=y
CONFIG_GRUB_EFI_IMAGES=y
# CONFIG_GRUB_CONSOLE is not set
CONFIG_GRUB_BOOTOPTS="nomodeset"
CONFIG_GRUB_TIMEOUT="0"
CONFIG_GRUB_TITLE="OpenWrt"
# CONFIG_ISO_IMAGES is not set
# CONFIG_VDI_IMAGES is not set
# CONFIG_VMDK_IMAGES is not set
# CONFIG_VMDK_IMAGES is not set

# CONFIG_SIGNATURE_CHECK is not set
# CONFIG_SIGNED_PACKAGES is not set
# 不压缩efi
# CONFIG_TARGET_IMAGES_GZIP is not set

#-----------------------------------
# Kmod
CONFIG_PACKAGE_kmod-drm-rockchip=y
CONFIG_PACKAGE_kmod-gpu-lima=y
CONFIG_PACKAGE_kmod-rtl8187=y
CONFIG_PACKAGE_kmod-rtl8188eu=y
CONFIG_PACKAGE_kmod-rtl8192c-common=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8192du=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-rtl88x2bu=y
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
CONFIG_PACKAGE_kmod-usb-net-rtl8150=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
CONFIG_PACKAGE_kmod-r8168=n
CONFIG_PACKAGE_kmod-r8125=n

# Wireless Support
CONFIG_PACKAGE_iw=y
CONFIG_PACKAGE_iwinfo=y
CONFIG_PACKAGE_wpad-wolfssl=y
CONFIG_DRIVER_11AC_SUPPORT=y
CONFIG_DRIVER_11N_SUPPORT=y
CONFIG_DRIVER_11W_SUPPORT=y
## Camera Drivers
CONFIG_PACKAGE_kmod-video-core=y
CONFIG_PACKAGE_kmod-video-uvc=y

## I2C Drivers
CONFIG_PACKAGE_kmod-i2c-core=y

## printer Drivers
CONFIG_PACKAGE_kmod-lp=y

### USB Audio 
CONFIG_PACKAGE_kmod-usb-audio=y

##Display & Extra Drivers
CONFIG_PACKAGE_kmod-backlight=y
CONFIG_PACKAGE_kmod-backlight-pwm=y
CONFIG_PACKAGE_kmod-drm=y
CONFIG_PACKAGE_kmod-drm-amdgpu=y
CONFIG_PACKAGE_kmod-drm-kms-helper=y
CONFIG_PACKAGE_kmod-drm-radeon=y
CONFIG_PACKAGE_kmod-drm-ttm=y
CONFIG_PACKAGE_kmod-fb=y
CONFIG_PACKAGE_kmod-fb-cfb-copyarea=y
CONFIG_PACKAGE_kmod-fb-cfb-fillrect=y
CONFIG_PACKAGE_kmod-fb-cfb-imgblt=y
CONFIG_PACKAGE_kmod-fb-sys-fops=y
CONFIG_PACKAGE_kmod-fb-sys-ram=y
CONFIG_PACKAGE_kmod-video-pwc=y
CONFIG_PACKAGE_kmod-video-uvc=y
CONFIG_PACKAGE_kmod-video-videobuf2=y

### USB Net Drivers
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-asix=y
CONFIG_PACKAGE_kmod-usb-net-asix-ax88179=y
CONFIG_PACKAGE_kmod-usb-net-rtl8152=y
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
CONFIG_PACKAGE_kmod-usb-net2280=y

### USB Wireless Card Drivers
CONFIG_PACKAGE_kmod-ath=y
CONFIG_PACKAGE_kmod-ath6kl=y
CONFIG_PACKAGE_kmod-ath6kl-usb=y
CONFIG_PACKAGE_kmod-ath9k-common=y
CONFIG_PACKAGE_kmod-ath9k-htc=y
CONFIG_PACKAGE_kmod-ath11k=n
CONFIG_PACKAGE_kmod-carl9170=y
CONFIG_PACKAGE_kmod-lib80211=y
CONFIG_PACKAGE_kmod-libertas-usb=y
CONFIG_PACKAGE_kmod-mac80211=y
CONFIG_PACKAGE_kmod-mt7601u=y
CONFIG_PACKAGE_kmod-mt7603=y
CONFIG_PACKAGE_kmod-mt7663u=y
CONFIG_PACKAGE_kmod-mt76x0u=y
CONFIG_PACKAGE_kmod-mt76x2u=y
CONFIG_PACKAGE_kmod-net-prism54=y
CONFIG_PACKAGE_kmod-net-rtl8192su=y
CONFIG_PACKAGE_kmod-p54-common=y
CONFIG_PACKAGE_kmod-p54-usb=y
CONFIG_PACKAGE_kmod-rsi91x=y
CONFIG_PACKAGE_kmod-rsi91x-usb=y
CONFIG_PACKAGE_kmod-rt2500-usb=y
CONFIG_PACKAGE_kmod-rt2800-lib=y
CONFIG_PACKAGE_kmod-rt2800-usb=y
CONFIG_PACKAGE_kmod-rt2x00-lib=y
CONFIG_PACKAGE_kmod-rt2x00-usb=y
CONFIG_PACKAGE_kmod-rt73-usb=y
CONFIG_PACKAGE_kmod-zd1211rw=y

### Wireless Card Firmware
CONFIG_PACKAGE_ath9k-htc-firmware=y
CONFIG_PACKAGE_libertas-usb-firmware=y
CONFIG_PACKAGE_mt7601u-firmware=y
CONFIG_PACKAGE_p54-usb-firmware=y
CONFIG_PACKAGE_prism54-firmware=y
CONFIG_PACKAGE_rs9113-firmware=y
CONFIG_PACKAGE_rt2800-usb-firmware=y
CONFIG_PACKAGE_rt73-usb-firmware=y
CONFIG_PACKAGE_rtl8188eu-firmware=y
CONFIG_PACKAGE_rtl8192cu-firmware=y
CONFIG_PACKAGE_rtl8192eu-firmware=y
CONFIG_PACKAGE_rtl8192su-firmware=y
CONFIG_PACKAGE_rtl8723au-firmware=y
CONFIG_PACKAGE_rtl8723bu-firmware=y

##Wireless Card Firmware
CONFIG_PACKAGE_kmod-ath=y
CONFIG_ATH_USER_REGD=y
CONFIG_PACKAGE_ATH_DFS=y
CONFIG_PACKAGE_kmod-ath10k=y
CONFIG_ATH10K_LEDS=y
CONFIG_ATH10K_THERMAL=y
CONFIG_PACKAGE_kmod-ath6kl=y
CONFIG_PACKAGE_kmod-ath6kl-usb=y
CONFIG_PACKAGE_kmod-ath9k=y
CONFIG_ATH9K_SUPPORT_PCOEM=y
CONFIG_PACKAGE_kmod-ath9k-common=y
CONFIG_PACKAGE_kmod-ath9k-htc=y
CONFIG_PACKAGE_kmod-b43=y
CONFIG_PACKAGE_B43_USE_SSB=y
CONFIG_PACKAGE_B43_USE_BCMA=y
CONFIG_B43_FW_5_100_138=y
CONFIG_B43_FW_SQUASH=y
CONFIG_B43_FW_SQUASH_COREREVS="5,6,7,8,9,10,11,13,15,16,28,29,30"
CONFIG_B43_FW_SQUASH_PHYTYPES="G,N,LP,HT"
CONFIG_PACKAGE_B43_BUSES_BCMA_AND_SSB=y
CONFIG_PACKAGE_B43_PHY_G=y
CONFIG_PACKAGE_B43_PHY_N=y
CONFIG_PACKAGE_B43_PHY_LP=y
CONFIG_PACKAGE_B43_PHY_HT=y
CONFIG_PACKAGE_kmod-b43legacy=y
CONFIG_PACKAGE_kmod-brcmfmac=y
CONFIG_BRCMFMAC_USB=y
CONFIG_BRCMFMAC_PCIE=y
CONFIG_PACKAGE_kmod-brcmutil=y
CONFIG_PACKAGE_kmod-cfg80211=y
CONFIG_PACKAGE_kmod-iwl-legacy=y
CONFIG_PACKAGE_kmod-iwl3945=y
CONFIG_PACKAGE_kmod-iwl4965=y
CONFIG_PACKAGE_kmod-iwlwifi=y
CONFIG_PACKAGE_kmod-lib80211=y
CONFIG_PACKAGE_kmod-libertas-usb=y
CONFIG_PACKAGE_kmod-libipw=y
CONFIG_PACKAGE_kmod-mac80211=y
CONFIG_PACKAGE_MAC80211_DEBUGFS=y
CONFIG_PACKAGE_MAC80211_MESH=y
CONFIG_PACKAGE_kmod-mt76-connac=y
CONFIG_PACKAGE_kmod-mt76-core=y
CONFIG_PACKAGE_kmod-mt76-usb=y
CONFIG_PACKAGE_kmod-mt7601u-ap=y
CONFIG_PACKAGE_kmod-mt7615-common=y
CONFIG_PACKAGE_kmod-mt7615-firmware=y
CONFIG_PACKAGE_kmod-mt7615e=y
CONFIG_PACKAGE_kmod-mt7663-usb-sdio=y
CONFIG_PACKAGE_kmod-mt7663u=y
CONFIG_PACKAGE_kmod-mt76x0-common=y
CONFIG_PACKAGE_kmod-mt76x02-common=y
CONFIG_PACKAGE_kmod-mt76x02-usb=y
CONFIG_PACKAGE_kmod-mt76x0e=y
CONFIG_PACKAGE_kmod-mt76x0u=y
CONFIG_PACKAGE_kmod-mt76x2=y
CONFIG_PACKAGE_kmod-mt76x2-common=y
CONFIG_PACKAGE_kmod-mt76x2u=y
CONFIG_PACKAGE_kmod-mt7915e=y
CONFIG_PACKAGE_kmod-mt7921e=y
CONFIG_PACKAGE_kmod-mt7921-common=y
CONFIG_PACKAGE_kmod-mwifiex-pcie=y
CONFIG_PACKAGE_kmod-mwl8k=y
CONFIG_PACKAGE_kmod-net-rtl8192su=y
CONFIG_PACKAGE_kmod-p54-common=y
CONFIG_PACKAGE_kmod-p54-pci=y
CONFIG_PACKAGE_kmod-p54-usb=y
CONFIG_PACKAGE_kmod-rsi91x=y
CONFIG_PACKAGE_kmod-rsi91x-usb=y
CONFIG_PACKAGE_kmod-rt2400-pci=y
CONFIG_PACKAGE_kmod-rt2500-pci=y
CONFIG_PACKAGE_kmod-rt2500-usb=y
CONFIG_PACKAGE_kmod-rt2800-lib=y
CONFIG_PACKAGE_kmod-rt2800-mmio=y
CONFIG_PACKAGE_kmod-rt2800-pci=y
CONFIG_PACKAGE_kmod-rt2800-usb=y
CONFIG_PACKAGE_kmod-rt2x00-lib=y
CONFIG_PACKAGE_kmod-rt2x00-mmio=y
CONFIG_PACKAGE_kmod-rt2x00-pci=y
CONFIG_PACKAGE_kmod-rt2x00-usb=y
CONFIG_PACKAGE_kmod-rt61-pci=y
CONFIG_PACKAGE_kmod-rt73-usb=y
CONFIG_PACKAGE_kmod-rtl8180=y
CONFIG_PACKAGE_kmod-rtl8187=y
CONFIG_PACKAGE_kmod-rtl8188eu=y
CONFIG_PACKAGE_kmod-rtl8192c-common=y
CONFIG_PACKAGE_kmod-rtl8192ce=y
CONFIG_PACKAGE_kmod-rtl8192cu=y
CONFIG_PACKAGE_kmod-rtl8192de=y
CONFIG_PACKAGE_kmod-rtl8192eu=y
CONFIG_PACKAGE_kmod-rtl8192se=y
CONFIG_PACKAGE_kmod-rtl8812au-ac=y
CONFIG_PACKAGE_kmod-rtl8821ae=y
CONFIG_PACKAGE_kmod-rtl8821cu=y
CONFIG_PACKAGE_kmod-rtl88x2bu=y
CONFIG_PACKAGE_kmod-rtlwifi=y
CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y
CONFIG_PACKAGE_kmod-rtlwifi-pci=y
CONFIG_PACKAGE_kmod-rtlwifi-usb=y
CONFIG_PACKAGE_kmod-rtw88=y
CONFIG_PACKAGE_kmod-wil6210=y

# 3G/4G Drivers & Utilities
CONFIG_PACKAGE_comgt-ncm=y
CONFIG_PACKAGE_comgt=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_kmod-usb-acm=y
CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_luci-proto-3g=y
CONFIG_PACKAGE_luci-proto-ncm=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_qmi-utils=y
CONFIG_PACKAGE_umbim=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_usb-modeswitch=y

# Mobile Network Sharing
CONFIG_PACKAGE_libimobiledevice-utils=y
CONFIG_PACKAGE_libplist-utils=y
CONFIG_PACKAGE_libudev-fbsd=y
CONFIG_PACKAGE_libusbmuxd-utils=y
CONFIG_PACKAGE_usbmuxd=y
#-----------------------------------
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_6in4=y
CONFIG_PACKAGE_6rd=y
CONFIG_PACKAGE_6to4=y
#network 
# CONFIG_PACKAGE_r8169-firmware=y
CONFIG_PACKAGE_bnx2x-firmware=y
CONFIG_PACKAGE_e100-firmware=y
CONFIG_PACKAGE_kmod-3c59x=y
CONFIG_PACKAGE_kmod-atl1=y
CONFIG_PACKAGE_kmod-atl1c=y
CONFIG_PACKAGE_kmod-atl1e=y
CONFIG_PACKAGE_kmod-atl2=y
CONFIG_PACKAGE_kmod-atm=y
CONFIG_PACKAGE_kmod-b44=y
CONFIG_PACKAGE_kmod-be2net=y
CONFIG_PACKAGE_kmod-bnx2x=y
CONFIG_PACKAGE_kmod-dm9000=y
CONFIG_PACKAGE_kmod-dummy=y
CONFIG_PACKAGE_kmod-e100=y
CONFIG_PACKAGE_kmod-et131x=y
CONFIG_PACKAGE_kmod-ethoc=y
CONFIG_PACKAGE_kmod-hfcmulti=y
CONFIG_PACKAGE_kmod-hfcpci=y
CONFIG_PACKAGE_kmod-iavf=y
CONFIG_PACKAGE_kmod-ixgbevf=y
CONFIG_PACKAGE_kmod-lib-crc32c=y
CONFIG_PACKAGE_kmod-mdio-gpio=y
CONFIG_PACKAGE_kmod-misdn=y
CONFIG_PACKAGE_kmod-natsemi=y
CONFIG_PACKAGE_kmod-ne2k-pci=y
CONFIG_PACKAGE_kmod-niu=y
CONFIG_PACKAGE_kmod-of-mdio=y
CONFIG_PACKAGE_kmod-phy-bcm84881=y
CONFIG_PACKAGE_kmod-phy-broadcom=y
CONFIG_PACKAGE_kmod-phy-realtek=y
CONFIG_PACKAGE_kmod-phylib-broadcom=y
CONFIG_PACKAGE_kmod-phylink=y
# CONFIG_PACKAGE_kmod-r8169=n
CONFIG_PACKAGE_kmod-random-core=y
CONFIG_PACKAGE_kmod-sfp=y
CONFIG_PACKAGE_kmod-siit=y
CONFIG_PACKAGE_kmod-sis190=y
CONFIG_PACKAGE_kmod-sis900=y
CONFIG_PACKAGE_kmod-skge=y
CONFIG_PACKAGE_kmod-sky2=y
CONFIG_PACKAGE_kmod-solos-pci=y
CONFIG_PACKAGE_kmod-spi-ks8995=y
CONFIG_PACKAGE_kmod-ssb=y
CONFIG_PACKAGE_kmod-swconfig=y
CONFIG_PACKAGE_kmod-switch-bcm53xx=y
CONFIG_PACKAGE_kmod-switch-bcm53xx-mdio=y
CONFIG_PACKAGE_kmod-switch-ip17xx=y
CONFIG_PACKAGE_kmod-switch-mvsw61xx=y
CONFIG_PACKAGE_kmod-switch-rtl8306=y
CONFIG_PACKAGE_kmod-switch-rtl8366-smi=y
CONFIG_PACKAGE_kmod-switch-rtl8366rb=y
CONFIG_PACKAGE_kmod-switch-rtl8366s=y
CONFIG_PACKAGE_kmod-switch-rtl8367b=y
CONFIG_PACKAGE_kmod-usb-atm=y
CONFIG_PACKAGE_kmod-usb-atm-cxacru=y
CONFIG_PACKAGE_kmod-usb-atm-speedtouch=y
CONFIG_PACKAGE_kmod-usb-atm-ueagle=y
CONFIG_PACKAGE_kmod-usb-cm109=y
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-dm9601-ether=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-mcs7830=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-net-smsc95xx=y
CONFIG_PACKAGE_kmod-usb-net-sr9700=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-yealink=y
CONFIG_PACKAGE_kmod-usbip=y
CONFIG_PACKAGE_kmod-usbip-client=y
CONFIG_PACKAGE_kmod-usbip-server=y
CONFIG_PACKAGE_kmod-usbmon=y
CONFIG_PACKAGE_kmod-via-rhine=y
CONFIG_PACKAGE_kmod-via-velocity=y
#USB net driver
CONFIG_PACKAGE_kmod-usb-dwc2=y
CONFIG_PACKAGE_kmod-usb-dwc3=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-ehci=y
CONFIG_PACKAGE_kmod-usb-ledtrig-usbport=y
CONFIG_PACKAGE_kmod-usb-net-aqc111=y
CONFIG_PACKAGE_kmod-usb-net-cdc-eem=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-cdc-mbim=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-cdc-subset=y
CONFIG_PACKAGE_kmod-usb-net-hso=y
CONFIG_PACKAGE_kmod-usb-net-huawei-cdc-ncm=y
CONFIG_PACKAGE_kmod-usb-net-ipheth=y
CONFIG_PACKAGE_kmod-usb-net-kalmia=y
CONFIG_PACKAGE_kmod-usb-net-kaweth=y
CONFIG_PACKAGE_kmod-usb-net-pegasus=y
CONFIG_PACKAGE_kmod-usb-net-pl=y
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-sierrawireless=y
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-roles=y
CONFIG_PACKAGE_kmod-usb-wdm=y
CONFIG_PACKAGE_kmod-usb-xhci-hcd=y

### Ethernet Support
# CONFIG_PACKAGE_kmod-usb-net-asix is not set
# CONFIG_PACKAGE_kmod-usb-net-asix-ax88179 is not set
CONFIG_DEFAULT_kmod-usb-net-rtl8150=y
CONFIG_DEFAULT_kmod-usb-net-rtl8152-vendor=y
CONFIG_DEFAULT_kmod-via-velocity=y
CONFIG_DEFAULT_kmod-vmxnet3=y

CONFIG_PACKAGE_kmod-usb-net-rndis=y
CONFIG_DEFAULT_kmod-iavf=y
CONFIG_DEFAULT_kmod-igb=y
CONFIG_DEFAULT_kmod-igbvf=y
CONFIG_DEFAULT_kmod-igc=y
CONFIG_DEFAULT_kmod-ipt-raw=y
CONFIG_DEFAULT_kmod-ixgbe=y
# CONFIG_DEFAULT_kmod-r8125=y
CONFIG_DEFAULT_kmod-r8168=y
# CONFIG_PACKAGE_kmod-r8169 is not set

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

#Tailscale
CONFIG_PACKAGE_libustream-openssl=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_kmod-tun=y

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
# CONFIG_PACKAGE_autocore-x86 is not set
CONFIG_PACKAGE_myautocore-x86=y
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
CONFIG_PACKAGE_luci-app-control-weburl=n
CONFIG_PACKAGE_luci-app-control-webrestriction=n
CONFIG_PACKAGE_luci-app-control-speedlimit=y
CONFIG_PACKAGE_luci-app-timecontrol=n
# CONFIG_PACKAGE_luci-app-webadmin=y
# CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm=y
# CONFIG_PACKAGE_luci-app-eqos=n
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-onliner=n
CONFIG_PACKAGE_luci-app-baidupcs-web=y
CONFIG_PACKAGE_luci-app-openclash=y 
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-samba4=y
CONFIG_PACKAGE_luci-app-serverchan=y
# CONFIG_PACKAGE_luci-app-sfe is not set
# CONFIG_PACKAGE_luci-app-flowoffload is not set
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-turboacc=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSFORWARDER=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_DNSPROXY=n
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_OFFLOADING=y
# CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_SHORTCUT_FE is not set
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-ssr-plus=y

CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-bypass=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-app-dnsto=y
CONFIG_PACKAGE_luci-app-pushbot=y
CONFIG_PACKAGE_luci-app-dnsfilter=y
CONFIG_PACKAGE_luci-app-kodexplorer=y
CONFIG_PACKAGE_luci-app-uhttpd=y
CONFIG_PACKAGE_luci-app-mentohust=y
CONFIG_PACKAGE_luci-app-easymesh=n
CONFIG_PACKAGE_luci-app-wifimac=n
CONFIG_PACKAGE_luci-app-ttnode=n
CONFIG_PACKAGE_luci-app-adblock-plus=n
CONFIG_PACKAGE_luci-app-mac=n
CONFIG_PACKAGE_luci-app-vsftpd=y
CONFIG_PACKAGE_luci-app-wifidog=n
CONFIG_PACKAGE_wifidog=n
CONFIG_PACKAGE_luci-app-cupsd=n
CONFIG_PACKAGE_cupsd=n
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-ikoolproxy=y
CONFIG_PACKAGE_luci-app-haproxy-tcp=n
CONFIG_PACKAGE_luci-app-wireguard=y  #默认加了取消
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
CONFIG_PACKAGE_luci-app-linkease=y
#主题
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh-cn=y
CONFIG_PACKAGE_luci-theme-argon_new=n
CONFIG_PACKAGE_luci-theme-btmod=n
CONFIG_PACKAGE_luci-theme-opentomcat=n
CONFIG_PACKAGE_luci-theme-chuqitopd=n
CONFIG_PACKAGE_luci-theme-ffpdboy=n
CONFIG_PACKAGE_luci-theme-darkmatter=y
CONFIG_PACKAGE_luci-theme-neobird=y
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-ifit=n
CONFIG_PACKAGE_luci-theme-opentopd=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
#增加其它插件
CONFIG_PACKAGE_luci-app-tencentddns=y
CONFIG_PACKAGE_luci-app-ksmbd=n
CONFIG_PACKAGE_luci-app-cifsd=n
CONFIG_PACKAGE_luci-app-cifs-mount=y
# CONFIG_PACKAGE_luci-app-xlnetacc is not set
CONFIG_PACKAGE_luci-app-zerotier=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-minidlna=y
CONFIG_PACKAGE_luci-app-rclone=y
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng=n
CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui=n
CONFIG_PACKAGE_luci-app-pptp-server=y
CONFIG_PACKAGE_luci-app-pppoe-server=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
CONFIG_PACKAGE_luci-app-ipsec-serve=y
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers is not set
CONFIG_PACKAGE_luci-app-koolddns=y
CONFIG_PACKAGE_luci-app-syncdial=y
CONFIG_PACKAGE_luci-app-softethervpn=y
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_DEFAULT_luci-app-cpufreq=n
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_luci-app-socat=y
CONFIG_PACKAGE_luci-app-oaf=y
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-mwan3helper=y
CONFIG_PACKAGE_luci-app-qbittorrent=y
CONFIG_PACKAGE_luci-app-familycloud=y
CONFIG_PACKAGE_luci-app-nps=y
CONFIG_PACKAGE_luci-app-frpc=y
#CONFIG_PACKAGE_luci-app-nfs=y
CONFIG_PACKAGE_luci-app-openvpn-server=y
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-openvpn=y

CONFIG_PACKAGE_luci-app-bridge=n
CONFIG_PACKAGE_luci-app-cowbping=y
CONFIG_PACKAGE_luci-app-beardropper=y
CONFIG_PACKAGE_luci-app-control-parentcontrol=y
CONFIG_PACKAGE_luci-app-https-dns-proxy=n
CONFIG_PACKAGE_luci-app-pwdHackDeny=n
CONFIG_PACKAGE_luci-app-oaf=y
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

CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-lp=y
CONFIG_PACKAGE_openssh-sftp-client=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_ipt2socks=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_wget-ssl=y

CONFIG_PACKAGE_coremark=y
# CONFIG_PACKAGE_perl=y
# CONFIG_PACKAGE_perl-http-date=y
# CONFIG_PACKAGE_perlbase-getopt=y
# CONFIG_PACKAGE_perlbase-time=y
# CONFIG_PACKAGE_perlbase-unicode=y
# CONFIG_PACKAGE_perlbase-utf8=y
CONFIG_PACKAGE_bind-dig=y
CONFIG_PACKAGE_bind-host=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_nginx=y

CONFIG_PACKAGE_ppp-mod-pptp=y
CONFIG_PACKAGE_xl2tpd=y

CONFIG_PACKAGE_bsdtar=y
CONFIG_PACKAGE_bzip2=y
CONFIG_PACKAGE_e2fsprogs=y
CONFIG_PACKAGE_gzip=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_zip=y
CONFIG_PACKAGE_fstrim=y
CONFIG_PACKAGE_gpioctl-sysfs=y
CONFIG_PACKAGE_gpiod-tools=y

CONFIG_PACKAGE_f2fs-tools=y
CONFIG_PACKAGE_f2fsck=y
CONFIG_PACKAGE_resize2fs=y

CONFIG_PACKAGE_lm-sensors-detect=y
CONFIG_PACKAGE_tmux=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_whereis=y
CONFIG_PACKAGE_gotop=y
CONFIG_PACKAGE_tmate=y

CONFIG_PACKAGE_kmod-usb-serial=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-wwan=y
CONFIG_PACKAGE_usb-modeswitch=y
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_qmi-utils=y
CONFIG_PACKAGE_umbim=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_comgt-ncm=y
CONFIG_PACKAGE_luci-proto-ncm=y
CONFIG_PACKAGE_comgt=y
CONFIG_PACKAGE_kmod-usb-acm=y
CONFIG_PACKAGE_luci-proto-3g=y

### DOCKER ###
CONFIG_PACKAGE_luci-app-docker=y
CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_DOCKER_KERNEL_OPTIONS=y
CONFIG_DOCKER_NET_ENCRYPT=y
CONFIG_DOCKER_NET_MACVLAN=y
CONFIG_DOCKER_NET_OVERLAY=y
CONFIG_DOCKER_NET_TFTP=y
