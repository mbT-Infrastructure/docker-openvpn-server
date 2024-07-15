# OpenVPN server image

This Docker image contains a Openvpn server.

It provides a login via certificates validated with the provided CA.

## Installation

1. Pull from [Docker Hub], download the package from [Releases] or build using `builder/build.sh`

## Usage

This Container image extends the [base image].

The image needs to run with the capability `NET_ADMIN`.

### Environment variables

- `DNS_SERVER`
    - Address of the DNS-Server to use, default `8.8.8.8`.
- `NETWORK`
    - VPN network in CIDR notation, default `192.168.191.0/24`.
- `NETWORK_ROUTE`
    - Pushed route in CIDR notation, default `0.0.0.0/0`.


### Volumes

To persist container data you can define some volumes. Directories that contain data are

- `/media/openvpn`
    - Contains all data of the openvpn server.
- `/media/openvpn/certs`
    - Contains the certs for the openvpn server.
    You need to place here `ca.pem`, `server-cert.pem` and `server-key.pem`.


## Development

To run for development execute:

```bash
docker compose --file docker-compose-dev.yaml up --build
```

[base image]: https://github.com/mbT-Infrastructure/docker-base
[Docker Hub]: https://hub.docker.com/r/madebytimo/openvpn-server
[Releases]: https://github.com/mbt-infrastructure/openvpn-server/releases
