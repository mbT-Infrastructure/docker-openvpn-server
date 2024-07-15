#!/usr/bin/env bash
set -e

mkdir --parents /media/openvpn/certs

if [ ! -e "/media/openvpn/certs/dhparam.pem" ]; then
    openssl dhparam -out /media/openvpn/certs/dhparam.pem 4096
fi

NETWORK_DOTTED_DECIMAL="$(convert-cidr-to-dotted-decimal-notation.sh "$NETWORK")"

sed --expression "s|###DNS_SERVER###|${DNS_SERVER}|g" \
    --expression "s|###NETWORK###|${NETWORK_DOTTED_DECIMAL}|g" \
    --expression "s|###NETWORK_ROUTE###|${NETWORK_ROUTE}|g" \
    /opt/openvpn/server/template/openvpn-server.conf \
    > /etc/openvpn/server/openvpn-server.conf

exec "$@"
