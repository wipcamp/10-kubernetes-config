read -p "External Interface Name: " CONF_FIREWALL_EXTERNAL_NETWORK
read -p "Internal Interface Name: " CONF_FIREWALL_INTERNAL_NETWORK

yum install -y firewalld

systemctl enable firewalld
systemctl start firewalld

firewall-cmd --permanent --new-service=kubernetes
firewall-cmd --permanent --new-service=weave-net
firewall-cmd --permanent --service=kubernetes --add-port=10250/tcp
firewall-cmd --permanent --service=kubernetes --add-port=10255/tcp
firewall-cmd --permanent --service=kubernetes --add-port=30000-32767/tcp
firewall-cmd --permanent --service=weave-net --add-port=6782-6783/tcp
firewall-cmd --permanent --service=weave-net --add-port=6783-6784/udp
firewall-cmd --permanent --zone=trusted --set-target=ACCEPT
firewall-cmd --permanent --zone=trusted --add-interface=weave
firewall-cmd --permanent --add-service=kubernetes --zone=internal
firewall-cmd --permanent --add-service=weave-net --zone=internal
firewall-cmd --permanent --add-service=ssh --zone=internal
firewall-cmd --permanent --add-service=ssh --zone=public
firewall-cmd --permanent --zone=public --add-interface=$CONF_FIREWALL_EXTERNAL_NETWORK
firewall-cmd --permanent --zone=internal --add-interface=$CONF_FIREWALL_INTERNAL_NETWORK

firewall-cmd --reload