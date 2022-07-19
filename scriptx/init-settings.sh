#!/bin/bash
# Set default theme to luci-theme-opentopd
# uci set luci.main.mediaurlbase='/luci-static/opentopd'
uci set fstab.@global[0].check_fs=1
ifname=$(uci -q get network.lan.ifname)
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
a=$(ip address | grep ^[0-9] | awk -F: '{print $2}' | sed "s/ //g" | grep $ifname2 | grep -v "@" | grep -v "\." )
b=$(echo "$a" | wc -l)
if [ ${b} -gt 1 ]; then
	lannet=""
	wannet=$(uci -q get network.wan.ifname) 
	  for i in $(seq 1 $b)
	  do
		[ $wannet = $(echo "$a" | sed -n ${i}p) ] || lannet="$lannet "$(echo "$a" | sed -n ${i}p)
	 done
   uci -q set network.lan.ifname=${lannet}
   uci commit network
fi
uci commit luci
uci commit fstab

exit 0
