#!/bin/sh

ANSWERS="y\n"

if [ "$VPN_PSK" = "" ]
then
  ANSWERS=$ANSWERS"n\n"
else
  ANSWERS=$ANSWERS"y\n$VPN_PSK\n"
fi

ANSWERS=$ANSWERS"$VPN_USERNAME\n$VPN_PASSWORD\n$VPN_CONNECTION_TYPE\n$VPN_VPN_ON_EC2\ny\n"

echo $ANSWERS | ./setup.sh && tail -F /dev/null
