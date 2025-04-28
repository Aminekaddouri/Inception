# Using penultimate stable Debian (example - check current versions)
FROM debian:bookworm

# Update and install required packages
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Create directory for certificates
RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate (for development)
# In production, you should use Let's Encrypt or other CA
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=BenGuerir/L=BenGuerir/O=1337/OU=1337/CN=${DOMAIN_NAME}"

# Copy NGINX config
COPY default /etc/nginx/sites-available/default

# Copy the startup script
COPY script.sh /script.sh
RUN chmod +x /script.sh

# Expose port 443 (HTTPS)
EXPOSE 443

CMD ["/script.sh"]