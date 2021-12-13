#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions

# date1='${version} Ipv6-S'`TZ=UTC-8 date +%Y.%m.%d -d +"8"hour`
date1='Ipv6-S'`TZ=UTC-8 date +%Y.%m.%d -d +"8"hour`
sed -i 's/$(VERSION_DIST_SANITIZED)-$(IMG_PREFIX_VERNUM)$(IMG_PREFIX_VERCODE)$(IMG_PREFIX_EXTRA)/$(shell TZ=UTC-8 date +%Y%m%d -d +8hour)-Ipv6-/g' include/image.mk
echo "DISTRIB_REVISION='${date1} by Sirpdboy'" > ./package/base-files/files/etc/openwrt_release1
echo ${date1}' by Sirpdboy ' >> ./package/base-files/files/etc/banner
echo '---------------------------------' >> ./package/base-files/files/etc/banner

./scripts/feeds update -i
