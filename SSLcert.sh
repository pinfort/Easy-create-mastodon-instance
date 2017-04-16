#!/bin/sh

sudo yum install epel-release
sudo yum install certbot
sudo firewall-cmd --add-port=443/tcp --zone=public
sudo firewall-cmd --add-port=443/tcp --zone=public --permanent
sudo certbot certonly --standalone
