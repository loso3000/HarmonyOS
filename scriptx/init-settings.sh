#!/bin/bash

uci -q set fstab.@global[0].check_fs=1
if ! ifname=$(uci -q get network.wan.ifname 2>/dev/null) ; then
      	 ifname=$(uci -q get network.lan.ifname 2>/dev/null) 
fi
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
a=$(ip address | grep ^[0-9] | awk -F: '{print $2}' | sed "s/ //g" | grep $ifname2 | grep -v "@" | grep -v "\." | awk -F '@' {'print $1'} )
b=$(echo "$a" | wc -l)
if [ ${b} -gt 1 ]; then
	  lannet=""
	  for i in $(seq 1 $b)
	  do
		if [ $i = $ifname ]; then
			wannet=$(echo "$a" | sed -n ${i}p)
		else
			lannet="$lannet $(echo "$a" | sed -n ${i}p)"
			
		fi
	  done
	else
	   wannet=$(echo "$a" | sed -n 1p)
      	   lannet=$wannet
fi
uci -q set network.lan.ifname="${lannet}"
# [ ${b} -gt 1 ] && uci -q set network.lan.ifname="$lannet ${wannet}" || uci -q set network.wan.ifname="${wannet}"
uci commit network
if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
rm -f /boot/init.sh || true
fi

exit 0

