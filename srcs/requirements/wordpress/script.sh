#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
./wp-cli.phar core install --url=$WP_URL --title=inception --admin_user=$DB_USER --admin_password=$DB_PASSWORD --admin_email=admin@admin.com --allow-root

php-fpm8.2 -F