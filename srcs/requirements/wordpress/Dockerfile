FROM debian:bookworm

RUN apt update \
    #&& apt upgrade -y \
    && apt install -y \
    php-fpm \
    php-mysqli \
    curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY www.conf /etc/php/8.2/fpm/pool.d/.

COPY script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]