#!/bin/bash
set -e

cd /var/www/html/app
composer install 

echo "Setting permissions..."
chown -R ec2-user:apache /var/www/html
chmod -R 775 /var/www/html/app/storage
chmod -R 755 /var/www/html/app/bootstrap/cache

echo "Generating app key..."
php artisan key:generate 

echo "Clearing cache..."
php artisan optimize:clear

echo "Running migrations..."
php artisan migrate 

echo "Caching config..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "Deployment completed successfully."
