sudo apt-get update
sudo apt-get -y install openvpn easy-rsa dnsmasq
/etc/sysctl.conf  net.ipv4.ip_forward=1
sysctl -p

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
iptables -A FORWARD -j REJECT
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

service openvpn restart
service dnsmasq restart