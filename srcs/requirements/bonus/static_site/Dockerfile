FROM debian:bookworm

RUN apt update && apt install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy your static HTML site
COPY html/index.html /var/www/html/

# Ensure proper permissions (nginx runs as www-data)
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Replace default nginx config
COPY default /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]