#!/bin/bash
set -ex

DB_NAME=${DB_NAME:-wordpress}
DB_USER=${DB_USER:-akaddour}
DB_PASSWORD=${DB_PASSWORD:-akaddour}
DB_HOST=${DB_HOST:-mariadb}
WP_URL=${WP_URL:-https://localhost}
DOMAIN_NAME=${DOMAIN_NAME:-localhost}
WP_ADMIN_USER=${WP_ADMIN_USER:-kaddouri}
WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD:-aminekaddouri}
WP_REDIS_HOST=${WP_REDIS_HOST:-redis}


# Wait for MariaDB to be ready
while ! mysqladmin ping -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASSWORD" --silent; do
    sleep 1
done

# Download WordPress if not exists
if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --allow-root
    
    # Create wp-config.php
    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="$DB_HOST" \
        --allow-root

    # Set Redis host in wp-config.php
    wp config set WP_REDIS_HOST "$WP_REDIS_HOST" --type=constant --allow-root
    
    # Install WordPress
    wp core install \
        --url="$WP_URL" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="admin@${DOMAIN_NAME}" \
        --skip-email \
        --allow-root

    # Install and enable Redis plugin
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
    
    # Set proper permissions
    # chown -R www-data:www-data /var/www/html
fi

# Start PHP-FPM
exec php-fpm8.2 -F