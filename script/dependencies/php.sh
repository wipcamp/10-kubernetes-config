# Refer to remi repo php7.2
yum install -y epel-release
yum install -y yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php72
yum install -y php php-fpm
systemctl enable php-fpm
systemctl start php-fpm