FROM debian:bullseye


# Update and install required packages
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# TO DO
# RUN apt-get update && apt-get upgrade -y && apt-get install -y \          --- apt-get upgrade -y: Ensures latest security updates.
# nginx \
# openssl \
# --no-install-recommends && rm -rf /var/lib/apt/lists/*   ---   --no-install-recommends: Avoids unnecessary packages.

# Create directory for certificates
RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate (for development)
# In production, you should use Let's Encrypt or other CA
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}"

COPY default /etc/nginx/sites-available/.

# Expose port 443 (HTTPS)
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]