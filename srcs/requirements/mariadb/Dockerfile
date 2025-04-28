# Using penultimate stable Debian
FROM debian:bookworm

# Install MariaDB
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Copy configuration file
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy initialization script
COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Create necessary runtime directory
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Expose MariaDB port
EXPOSE 3306

# Start MariaDB with your custom init script
CMD ["/usr/local/bin/script.sh"]
