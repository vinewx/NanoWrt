#!/bin/sh
# THIS SCIPRT ONLY RUN ONCE. Base on /etc/firstboot_${board}

uci set luci.main.mediaurlbase="/luci-static/argon"

uci batch <<EOF
set system.@system[0].hostname=New-Pi
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
set network.lan.ipaddr='192.168.1.1'
set network.lan.netmask='255.255.255.0'
set network.lan.proto='dhcp'
set network.lan.ip6assign='60'
EOF

uci commit
