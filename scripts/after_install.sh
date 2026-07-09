#!/bin/bash
set -e

cd /var/www/html/MyApplication

composer install --no-interaction --prefer-dist --optimize-autoloader

php artisan migrate --force

php artisan config:cache
php artisan route:cache
php artisan view:cache

chown -R apache:apache /var/www/html/MyApplication

chmod -R 775 storage
chmod -R 775 bootstrap/cache

echo "Deployment completed."
