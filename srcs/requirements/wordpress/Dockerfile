FROM debian:bookworm

RUN apt update && apt install -y \
    php-fpm \
    php-mysqli \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip \
    php-redis \
    curl \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Install wp-cli properly
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# # Create working directory
# RUN mkdir -p /var/www/html && \
#     chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

COPY www.conf /etc/php/8.2/fpm/pool.d/
COPY script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/local/bin/script.sh"]