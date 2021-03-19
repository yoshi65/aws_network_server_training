#!/bin/bash

sudo yum -y install mariadb-server
sudo systemctl start mariadb

pass="mysqlpasswd"
mysqladmin -u root password $pass
mysql -u root -p$pass -e 'CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;'
mysql -u root -p$pass -e 'grant all on wordpress.* to wordpress@"%" identified by "wordpresspasswd";'
