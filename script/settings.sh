#!/bin/sh

uci set luci.main.lang=auto
uci commit luci

uci batch <<EOF
set system.@system[0].hostname=NEO
set system.@system[0].zonename='Asia/Shanghai'
set system.@system[0].timezone='CST-8'
EOF
echo CST-8 > /etc/TZ

echo > /etc/config/network
uci batch <<EOF
set network.loopback=interface
set network.loopback.ifname='lo'
set network.loopback.proto='static'
set network.loopback.ipaddr='127.0.0.1'
set network.loopback.netmask='255.0.0.0'
set network.globals=globals
set network.globals.ula_prefix='fd0e:8876:14fb::/48'
set network.lan=interface
set network.lan.type='bridge'
set network.lan.ifname='eth0'
set network.lan.ipaddr='192.168.2.1'
set network.lan.netmask='255.255.255.0'
set network.lan.proto='dhcp'
set network.lan.ip6assign='60'
EOF

uci set uhttpd.main.redirect_https='0'

uci set fstab.@global[0].anon_mount=1

uci commit

sed -i 's#https://downloads.openwrt.org#https://mirrors.tencent.com/lede#g' /etc/opkg/distfeeds.conf

exit 0