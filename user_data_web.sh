#!/bin/bash

sudo yum update
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# 8-3
sudo amazon-linux-extras -y install php7.3
sudo yum -y install php php-mbstring
sudo yum -y install mariadb-server

cd ~
wget https://ja.wordpress.org/latest-ja.tar.gz
tar xzvf latest-ja.tar.gz

cd wordpress
sudo cp -r * /var/www/html
sudo chown apache:apache /var/www/html -R
