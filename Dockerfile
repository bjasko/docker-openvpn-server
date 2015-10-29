FROM ubuntu:14.04
MAINTAINER Jasmin Beganović <bjasko@bring.out.ba>

  
RUN apt-get update -q
RUN apt-get install -qy openvpn iptables

VOLUME  ["/etc/openvpn"]

CMD ["/usr/sbin/openvpn",  "--config", "/etc/openvpn/server.conf"]


