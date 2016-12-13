#!/bin/bash

sudo apt-get update

sudo apt-get -y install openvpn easy-rsa dnsmasq unzip

sudo sysctl -w net.ipv4.ip_forward=1

cd /etc

sudo wget https://github.com/xuyouwen/Django-begin/blob/master/ubuntu.zip

echo 'A' | sudo unzip   ubuntu.zip


iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT

iptables -A FORWARD -j REJECT

iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

service openvpn stop

service openvpn start

service dnsmasq stop

service dnsmasq start