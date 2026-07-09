#!/bin/bash

cd /var/www/html/MyApplication

composer install --no-dev --optimize-autoloader

php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

php artisan migrate --force

php artisan config:cache
php artisan route:cache

chown -R ec2-user:apache /var/www/html/MyApplication
chmod -R 775 storage bootstrap/cache
