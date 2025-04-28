#!/bin/bash

set -e  # Exit immediately on any error

# Fallback defaults in case .env variables are missing
DB_NAME=${DB_NAME:-wordpress}
DB_USER=${DB_USER:-akaddour}
DB_PASSWORD=${DB_PASSWORD:-akaddour}
DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD:-supersecret}

echo "🚀 Starting MariaDB initialization..."

# 1. Start MariaDB temporarily
service mariadb start

# 2. Wait for MariaDB to be ready
echo "⏳ Waiting for MariaDB to be ready..."
until mysqladmin ping --silent; do
    sleep 1
done

echo "✅ MariaDB is up."

# Check if database already exists (means we're restarting)
DB_EXISTS=$(mysql -u root ${DB_ROOT_PASSWORD:+-p$DB_ROOT_PASSWORD} -e "SHOW DATABASES LIKE '${DB_NAME}';" 2>/dev/null | grep -c "${DB_NAME}" || true)

if [ "$DB_EXISTS" -eq 0 ]; then
    # First time setup
    echo "📦 Creating database and user..."
    mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

    # 4. Secure root user if password is set
    if [ -n "$DB_ROOT_PASSWORD" ]; then
        echo "🔒 Setting root password..."
        mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
    else
        echo "⚠️  Warning: DB_ROOT_PASSWORD not set. Root remains without password."
    fi
else
    echo "📊 Database ${DB_NAME} already exists. Skipping initialization."
fi

# 5. Gracefully stop MariaDB
echo "🛑 Stopping temporary MariaDB..."
mysqladmin -u root ${DB_ROOT_PASSWORD:+-p$DB_ROOT_PASSWORD} shutdown

# 6. Start MariaDB safely in foreground
echo "✅ Initialization complete. Starting MariaDB in safe mode..."
exec mysqld_safe