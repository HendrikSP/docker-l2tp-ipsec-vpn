FROM ubuntu:14.04

MAINTAINER Matheus Candido <matheus@mcassiano.com>

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --force-yes libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev libgmp3-dev flex bison gcc make libunbound-dev libnss3-tools xl2tpd openswan wget iptables curl 

RUN mkdir /root/ipsec

# default configs, change this!

ENV VPN_USERNAME vpn
ENV VPN_PASSWORD 1234
ENV VPN_CONNECTION_TYPE 4
ENV VPN_VPN_ON_EC2 n

EXPOSE 500/udp 4500/udp 1701/udp

WORKDIR /root/ipsec
CMD ["./run_vpn.sh"]

COPY run_vpn.sh ./
COPY setup.sh ./

RUN chmod a+x run_vpn.sh
RUN chmod a+x setup.sh
