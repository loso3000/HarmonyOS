#!/bin/sh

uci -q set fstab.@global[0].check_fs=1
ifname=$(uci -q get network.wan.ifname 2>/dev/null)
[ ! $ifname ] && ifname=$(uci -q get network.lan.ifname 2>/dev/null)
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
lannet=""
for i in $(ip address | awk -F ': ' '/eth[0-9]+/ {print $2}' | awk -F '@' {'print $1'} | xargs)
do
    if [ ${i} = $ifname ]; then
    	wannet=${i}
    else
     lannet="$lannet ${i}"
    fi
done
uci -q set network.lan.ifname="${lannet}"
uci -q set network.wan.ifname="${wannet}"
uci commit network

exit 0

