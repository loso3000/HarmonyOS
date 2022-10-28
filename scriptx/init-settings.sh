#!/bin/bash
# Set default theme to luci-theme-opentopd
# uci set luci.main.mediaurlbase='/luci-static/opentopd'
am=0
fdiskB(){
		isP=`fdisk -l /dev/$1 |grep -v "bytes"|grep "/dev/$1$2"`
		if [ "$isP" = "" ];then
				#Start partition
				fdisk /dev/$1 << EOF
n
p



wq
EOF
			sleep 5
		fi
		isR=`df -P|grep "/mnt/$1$2"`
		if [ "$isR" != "" ] ; then
			umount /mnt/$1$2
			sleep 5
		fi
		isP=`fdisk -l /dev/$1 |grep -v "bytes"|grep "/dev/$1$2"`
		if [ "$isP" != "" ];then
			    echo y | mkfs.ext4 /dev/$1$2
			    block detect > /etc/config/fstab
			    eval $(block info "/dev/$1$2" | grep -o -e "UUID=\S*")
			    uci set fstab.@mount[0].uuid="${UUID}"
			    uci set fstab.@mount[0].target='/overlay'             
			    uci set fstab.@mount[0].enabled='0'
			    sed -i "s,/mnt/$1$2,/overlay,g"  /etc/config/fstab
			    am=1
			    uci commit fstab
		fi
}

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
for i in `cat /proc/partitions|grep -v name|grep -v ram|awk '{print $4}'|grep -v '^$'|grep -v '[0-9]$'|grep -v 'vda'|grep -v 'xvda'|grep -e 'vd' -e 'sd' -e 'xvd'`
	do
		case "$i" in
		sda*)
			isB=`df -P|grep "/boot"  | head -n1 | awk -F " " '{print $1}'`
			isD=`fdisk -l /dev/sda |grep -v 'bytes'| grep '/dev/sda1'`
			if [ "$isD" != "" && $isB = '/dev/sda1' ] ;then 
				fdiskB sda 3
			fi
			;;
		nvme0n1*)
		
			isB=`df -P|grep "/boot" | head -n1 | awk -F " " '{print $1}'`
			isD=`fdisk -l /dev/nvme0n1 |grep -v 'bytes'| grep '/dev/nvme0n1p1'`
			if [ "$isD" != ""  && $isB = '/dev/nvme0n1p1' ] ;then 
				fdiskB nvme0n1 p3
			fi
			;;
		esac
	done
	 [ ${am} = 1 ] && reboot
	
exit 0
