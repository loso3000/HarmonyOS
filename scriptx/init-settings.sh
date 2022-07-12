#!/bin/bash
# Set default theme to luci-theme-opentopd
uci set luci.main.mediaurlbase='/luci-static/opentopd'
# Check file system during boot
uci set fstab.@global[0].check_fs=1
if ! ifname=$(uci -q get network.wan.ifname 2>/dev/null) ; then
      	 ifname=$(uci -q get network.lan.ifname 2>/dev/null) 
fi
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
a=$(ip address | grep ^[0-9] | awk -F: '{print $2}' | sed "s/ //g" | grep $ifname2 | grep -v "@" | grep -v "\." )
b=$(echo "$a" | wc -l)
if [ ${b} -gt 1 ]; then
	  lannet=""
	  for i in $(seq 1 $b)
	  do
		[ $(uci -q get network.wan.ifname) = $(echo "$a" | sed -n ${b}p) ] || lannet="$lannet $(echo "$a" | sed -n ${i}p)"
	 done
      uci -q set network.lan.ifname="${lannet}"
fi
uci commit luci
uci commit network
uci commit fstab
if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
rm -f /boot/init.sh || true
fi

exit 0
