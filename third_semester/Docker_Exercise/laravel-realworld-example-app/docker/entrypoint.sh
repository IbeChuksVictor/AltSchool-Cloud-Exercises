#!/bin/bash

chown -R www-data:www-data /var/www/
chmod -R 775 /var/www/storage
chmod -R 775 /var/www/bootstrap/cache

if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

if [ ! -f ".env" ]; then
    cp .env.example .env
else
    echo "File .env already exists"
fi

php artisan key:generate
php artisan config:clear
php artisan view:clear
php artisan cache:clear

php-fpm -D
nginx -g "daemon off;"

