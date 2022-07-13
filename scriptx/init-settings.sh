#!/bin/bash
# Set default theme to luci-theme-opentopd
uci set luci.main.mediaurlbase='/luci-static/opentopd'
# Check file system during boot
setup_ssid()
{
    local r="radio$1"
    
    if ! uci show wireless.${r} >/dev/null 2>&1; then
        return
    fi
    local s="wlan$1"
    logger "default-wifi: setup $1's ssid"
    local mac=`ifconfig ${s} | grep "HWaddr" | awk '{print $5}'`
    local wifimac=`echo ${mac}|awk -F ":" '{print $4""$5""$6 }'|tr A-Z a-z|cut -c4-`
    uci set wireless.${r}.country=CN
    if [ `uci get wireless.${r}.channel` -lt 14 ]; then
        uci set wireless.${r}.channel=11
        uci set wireless.default_${r}.ssid=Ez-2.4G
    else
        uci set wireless.${r}.channel=149
        uci set wireless.default_${r}.ssid=Ez-5G
    fi
    uci set wireless.default_${r}.encryption='psk2'
    uci set wireless.default_${r}.key='12345678'
    uci commit
}
WIFI_NUM=`find /sys/class/net/ -name wlan* | wc -l`
if [ ${WIFI_NUM} -gt 0 ]; then
    # update /etc/config/wireless
    for i in `seq 0 ${WIFI_NUM}`; do
        setup_ssid ${i}
    done
fi
uci set fstab.@global[0].check_fs=1
if ! ifname=$(uci -q get network.wan.ifname 2>/dev/null) ; then
      	 ifname=$(uci -q get network.lan.ifname 2>/dev/null) 
fi
ifname2=$(echo $ifname | sed -r 's/([a-z]{1,})([0-9]{1,}).*/\1\ \2/'  | awk -F ' '  '{print $1}')
a=$(ip address | grep ^[0-9] | awk -F: '{print $2}' | sed "s/ //g" | grep $ifname2 | grep -v "@" | grep -v "\." )
b=$(echo "$a" | wc -l)
if [ ${b} -gt 1 ]; then
	  lannet=$(echo "$a" | sed -n 1p)
	  for i in $(seq 2 $b)
	  do
		[ $(uci -q get network.wan.ifname) != $(echo "$a" | sed -n ${b}p) ] && lannet="$lannet "$(echo "$a" | sed -n ${i}p)
	 done
      uci -q set network.lan.ifname=${lannet}
fi
uci commit luci
uci commit network
uci commit fstab
if [ ! -f "/boot/init.sh" ]; then
bash /boot/init.sh
rm -f /boot/init.sh || true
fi

exit 0
