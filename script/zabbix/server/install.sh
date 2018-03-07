rpm -ivh http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm
yum install -y zabbix-server-mysql zabbix-web-mysql php-xml php-bcmath php-mbstring php-gd php-ctype php-xmlreader php-xmlwriter php-session php-sockets php-gettext php-ldap php-pecl-mysql
systemctl enable zabbix-server
systemctl start zabbix-server

sed -i "s/user = apache/user = nginx/g"

cd /var/lib/php && chown -R root:nginx opcache session wsdlcache
cd /etc/zabbix && chown -R nginx:nginx web && chown root:nginx zabbix_server.conf