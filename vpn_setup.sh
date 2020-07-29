#!/bin/bash

export PATH=/bin:/usr/bin:/sbin:/usr/sbin

# 18.04: bionic
# 16.04: xenial
OS=`lsb_release -sc`

if [ "x$OS" != "xbionic" -a "x$OS" != "xxenial" ]; then
	echo "Unsupported Linux"
	exit 1
fi

PWD=`dirname $0`

if [ "x$OS" = "xxenial" ]; then
	add-apt-repository ppa:nm-l2tp/network-manager-l2tp
	apt update
fi

apt-get -y install network-manager-l2tp-gnome

systemctl stop xl2tpd
systemctl disable xl2tpd

nmcli conn import type l2tp file $PWD/cse-ipsecvpn.conf

cp $PWD/ip-up_1csevpn   /etc/ppp/ip-up.d/1csevpn
cp $PWD/ip-down_1csevpn /etc/ppp/ip-down.d/1csevpn
chmod 755 /etc/ppp/ip-up.d/1csevpn /etc/ppp/ip-down.d/1csevpn

if [ "x$OS" = "xxenial" ]; then
	cp $PWD/ip-pre-up /etc/ppp/ip-pre-up
	chmod 755 /etc/ppp/ip-pre-up
fi

