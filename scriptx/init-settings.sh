#!/bin/bash

# Set default theme to luci-theme-opentopd
uci set luci.main.mediaurlbase='/luci-static/opentopd'

# Disable IPV6 ula prefix
sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
uci set fstab.@global[0].check_fs=1
uci commit

if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
rm -f /boot/init.sh || true
fi

exit 0
