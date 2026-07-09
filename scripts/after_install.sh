#!/bin/bash

cd /var/www/html/MyApplication/

composer install --no-dev --optimize-autoloader
php artisan migrate 

php artisan optimize:clear

sudo chown -R apache:apache /var/www/html/MyApplication
sudo chmod -R 775 /var/www/html/MyApplication/storage
sudo chmod -R 775 /var/www/html/MyApplication/bootstrap/cache

