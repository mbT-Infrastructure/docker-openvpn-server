# OpenVPN server image

This Docker image contains a Openvpn server.

It provides a login via certificates validated with the provided CA.

The image needs to run as privileged container.

## Environment variables

- `VPN_DNS_SERVER`
    - The DNS server to use for `dhcp-option DNS`. For example `VPN_DNS_SERVER="8.8.8.8"`.


## Volumes

To persist container data you can define some volumes. Directories that contain data are

- `/media/openvpn`
    - Contains all data of the openvpn server. Currently only the certs.
- `/media/openvpn/certs`
    - Contains the certs for the openvpn server. You need to place here `ca.crt`, `server.crt` and `server.key`.


## Development

To build the image locally run:
```bash
./docker-build.sh
```