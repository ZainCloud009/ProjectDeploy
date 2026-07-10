#!/bin/bash
set -e

cd /var/www/html/app

sudo chown -R ec2-user:apache /var/www/html
sudo chmod 2775 /var/www/html/app && find /var/www/html/app -type d -exec sudo chmod 2775 {} \;
find /var/www/html/app -type f -exec sudo chmod 0664 {} \;

sudo systemctl restart httpd
