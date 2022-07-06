#!/bin/bash

local ifname ifname2 lannet wannet a b i

# Set default theme to luci-theme-opentopd
uci set luci.main.mediaurlbase='/luci-static/opentopd'
# Check file system during boot
uci set fstab.@global[0].check_fs=1
if ! ifname=$(uci get network.wan.ifname 2>/dev/null) ; then
      	 ifname=$(uci get network.lan.ifname 2>/dev/null) 
fi
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
a=$(ip address | grep ^[0-9] | awk -F: '{print $2}' | sed "s/ //g" | grep $ifname2 | grep -v "@" | grep -v "\." )
b=$(echo "$a" | wc -l)
if [ ${b} > 1 ]; then
	  lannet=""
	  for i in $(seq 1 $b)
	  do
		if [ $i = $b ]; then
			wannet=$(echo "$a" | sed -n ${b}p)
		else
			lannet="$lannet $(echo "$a" | sed -n ${i}p)"
			
		fi
	  done
	else
	   wannet=$(echo "$a" | sed -n 1p)
      	   lannet=$wannet
fi
uci -q set network.lan.ifname="${lannet}"
[ ${b} > 1 ] && uci -q set network.lan.ifname="$lannet ${wannet}" || uci -q set network.wan.ifname="${wannet}"

uci commit luci
uci commit network
uci commit fstab
if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
rm -f /boot/init.sh || true
fi

exit 0
