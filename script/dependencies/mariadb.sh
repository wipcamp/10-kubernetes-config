yum install -y mariadb-server
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation