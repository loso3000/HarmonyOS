#!/bin/bash
# Set default theme to luci-theme-opentopd
# uci set luci.main.mediaurlbase='/luci-static/opentopd'
uci set fstab.@global[0].check_fs=1
lannet=""
for i in $(ip address | awk -F ': ' '/eth[0-9]+/ {print $2}' | xargs)
do
[ "${wan_interface}" = "${i}" ] || lannet="${lannet} ${i}"
done
uci -q set network.lan.ifname="${lannet}"
}
uci commit network
uci commit fstab
exit 0
