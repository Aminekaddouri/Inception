# Base image
FROM debian:bookworm

# Install Redis
RUN apt-get update && apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

# Copy your custom redis configuration
COPY redis.conf /etc/redis/redis.conf

# Create redis runtime directory (good practice)
# RUN mkdir -p /var/run/redis && chown redis:redis /var/run/redis

# Expose Redis port (optional but useful for debugging or external tools)
EXPOSE 6379

# Start Redis with your custom config
CMD ["redis-server", "/etc/redis/redis.conf"]
