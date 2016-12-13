sudo apt-get update

sudo apt-get -y install openvpn easy-rsa dnsmasq

sudo sh -c 'echo "net.ipv4.ipforward=1" >>/etc/sysctl.conf'

sudo sysctl -p

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT

iptables -A FORWARD -j REJECT

iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

service openvpn stop

service openvpn restart

service dnsmasq stop

service dnsmasq restart