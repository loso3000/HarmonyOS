#!/bin/bash
sed -i 's/string ListenIP.*/string ListenIP 0.0.0.0/g' /usr/libexec/softethervpn/vpn_server.config

uci -q set fstab.@global[0].check_fs=1
if ! ifname=$(uci -q get network.wan.ifname 2>/dev/null) ; then
      	 ifname=$(uci -q get network.lan.ifname 2>/dev/null) 
fi
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
a=$(ip address | grep ^[0-9] | awk -F: '{print $2}' | sed "s/ //g" | grep $ifname2 | grep -v "@" | grep -v "\." | awk -F '@' {'print $1'} | awk '{ if ( length($0) <5 ) print $0}')
# a=$(ip address | awk -F ': ' '/eth[0-9]+/ {print $2}' | awk -F '@' {'print $1'})
b=$(echo "$a" | wc -l)
	[ ${b} -gt 1 ] && {
	  lannet=""
	  for i in $(seq 1 $b)
	  do
		[ "$(uci -q get network.wan.ifname)" = "$(echo "$a" | sed -n ${i}p)" ] || lannet="${lannet} $(echo "$a" | sed -n ${i}p)"
	  done
	  uci -q set network.lan.ifname="${lannet}"
	}
uci commit network
uci commit fstab
uci set luci.main.mediaurlbase='/luci-static/kucat'
uci commit luci
#  

# ipv6
# sed -i 's/^[^#].*option ula/#&/' /etc/config/network
ntpd -n -q -p 1.lede.pool.ntp.org
# Disable autostart by default for some packages
cd /etc/rc.d
rm -f S98udptools || true
rm -f S99nft-qos || true

exit 0
