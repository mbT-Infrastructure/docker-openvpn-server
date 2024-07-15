FROM madebytimo/base

RUN apt update && apt install -y openvpn iptables && rm -rf /var/lib/apt/lists/*
COPY files/convert-cidr-to-dotted-decimal-notation.sh \
    /usr/local/bin/convert-cidr-to-dotted-decimal-notation.sh

RUN mkdir --parents /media/openvpn
COPY ./openvpn-server.conf /opt/openvpn/server/template/openvpn-server.conf

COPY files/entrypoint.sh /entrypoint.sh

ENV DNS_SERVER="8.8.8.8"
ENV NETWORK="192.168.191.0/24"
ENV NETWORK_ROUTE="0.0.0.0/0"

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "openvpn", "--config", "/etc/openvpn/server/openvpn-server.conf" ]
