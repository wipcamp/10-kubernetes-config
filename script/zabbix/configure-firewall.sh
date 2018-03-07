systemctl stop firewalld

firewall-cmd --permanent --new-service=zabbix
firewall-cmd --permanent --service=zabbix --add-port=10050/tcp
firewall-cmd --permanent --service=zabbix --add-port=10051/tcp

firewall-cmd --permanent --add-service=zabbix --zone=internal
systemctl start firewalld
firewall-cmd --reload