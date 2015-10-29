#!/bin/bash

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

VOLUME_BASE=$PWD 
S_HOST=podrska
S_DEV=wlan0
S_DOMAIN=bring.out.ba
S_HOST_IP=${smtp_ip:-192.168.46.251}
S_DNS_HOST_IP=${dns_lan_ip:-192.168.46.254}
CT_NAME=podrska-vpn


sudo ip addr show | grep $S_HOST_IP || \
sudo ip addr add $S_HOST_IP/24 dev $S_DEV


docker rm -f  $CT_NAME
docker run --privileged  --net=host -d  -v $VOLUME_BASE/etc/openvpn:/etc/openvpn --name $CT_NAME -p $S_HOST_IP:1194:1194/udp  openvpn-server
