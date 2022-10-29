#!/bin/bash
# Set default theme to luci-theme-opentopd
# uci set luci.main.mediaurlbase='/luci-static/opentopd'
fdiskB(){
        a=$1
		b=$2

		isP=`fdisk -l /dev/$1 |grep -v "bytes"|grep "/dev/$a$b"`
		if [ "$isP" = "" ];then
				#Start partition
				fdisk /dev/$a << EOF
n
p



wq
EOF
			sleep 5
		fi
		isR=`df -P|grep "/mnt/$a$b"`
		if [ "$isR" != "" ] ; then
			umount /mnt/$a$b
			sleep 5
		fi
		isP=`fdisk -l /dev/$a |grep -v "bytes"|grep "/dev/$a$b"`
		isPa=$(fdisk -l  |grep /dev/${a}2 | awk -F ' ' '{print $4}')
		isPb=$(fdisk -l  |grep /dev/$a$b | awk -F ' ' '{print $4}')
		check=`echo "$isPa < $isPb" | bc`
		if [ "$isP" != "" -a $check = 1 ];then
			    echo y | mkfs.ext4 /dev/$a$b
			    block detect > /etc/config/fstab
			    eval $(block info "/dev/$a$b" | grep -o -e "UUID=\S*")
			    uci set fstab.@mount[0].uuid="${UUID}"
			    uci set fstab.@mount[0].target='/overlay'             
			    uci set fstab.@mount[0].enabled='0'
			    sed -i "s,/mnt/$a$b,/overlay,g"  /etc/config/fstab
			    uci commit fstab
				echo $check > /etc/fdiskb.list
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

[ -f /etc/fdiskb.list ] && exit 0

for i in `cat /proc/partitions|grep -v name|grep -v ram|awk '{print $4}'|grep -v '^$'|grep -v '[0-9]$'|grep -v 'vda'|grep -v 'xvda'|grep -e 'vd' -e 'sd' -e 'xvd'`
	do
		case "$i" in
		sda*)
			isB=`df -P|grep '/boot'  | head -n1 | awk -F ' ' '{print $1}'`
			isD=`fdisk -l /dev/sda |grep -v 'bytes'| grep '/dev/sda1'`
			if [ "$isD" != "" -a "$isB" = "/dev/sda1" ]; then 
				fdiskB sda 3
			fi
			;;
		nvme0n1*)
		
			isB=`df -P|grep '/boot' | head -n1 | awk -F ' ' '{print $1}'`
			isD=`fdisk -l /dev/nvme0n1 |grep -v 'bytes'| grep '/dev/nvme0n1p1'`
			if [ "$isD" != "" -a "$isB" = "/dev/nvme0n1p1" ]; then 
				fdiskB nvme0n1 p3
			fi
			;;
		mmcblk0*)
			isB=`df -P|grep '/boot' | head -n1 | awk -F ' ' '{print $1}'`
			isD=`fdisk -l /dev/mmcblk0 |grep -v 'bytes'| grep '/dev/mmcblk0p1'`
			if [ "$isD" != "" -a "$isB" = "/dev/mmcblk0p1" ]; then 
				fdiskB mmcblk0 p3
			fi
			;;
		esac
	done
	reboot
	
exit 0
