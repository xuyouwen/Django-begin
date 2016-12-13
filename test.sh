sudo apt-get update

sudo apt-get -y install openvpn easy-rsa dnsmasq

sudo sh -c 'echo "net.ipv4.ipforward=1" >>/etc/sysctl.conf'

sudo sysctl -p

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