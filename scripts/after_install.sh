#!/bin/bash
set -e

cd /var/www/html/app

composer install 

php artisan migrate 

php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan key:generate

sudo chown -R ec2-user:apache /var/www/html
sudo chmod 2775 /var/www/html/app && find /var/www/html/app -type d -exec sudo chmod 2775 {} \;
find /var/www/html/app -type f -exec sudo chmod 0664 {} \;


echo "Deployment completed."
