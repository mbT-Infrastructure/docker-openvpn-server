#!/usr/bin/env bash
set -e

mkdir --parents /media/openvpn/certs

# if [ ! -c /dev/net/tun ]; then
#     mkdir -p /dev/net
#     mknod /dev/net/tun c 10 200
# fi

# iptables --table nat --append POSTROUTING --out-interface eth0 --jump MASQUERADE


if [ ! -e "/media/openvpn/certs/dhparam.pem" ]; then
    openssl dhparam -out /media/openvpn/certs/dhparam.pem 4096
fi

openvpn --help | grep push
if [ $1 = openvpn]; then
    openvpn --push "dhcp-option DNS $VPN_DNS_SERVER"
else
    exec "$@"
fi