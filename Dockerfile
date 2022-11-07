FROM madebytimo/base

RUN apt update && apt install -y openvpn iptables && rm -rf /var/lib/apt/lists/*

RUN mkdir --parents /media/openvpn
COPY ./openvpn-server.conf /etc/openvpn/server/openvpn-server.conf

COPY entrypoint.sh /entrypoint.sh

ENV VPN_DNS_SERVER="8.8.8.8"

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "openvpn" ]
