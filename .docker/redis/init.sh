#!/bin/sh

# Define a function that shuts down Redis gracefully
stop_redis() {
    echo "Shutting down Redis..."
    redis-cli -a "$REDIS_PASSWORD" shutdown
    exit 0
}

# Trap TERM and INT signals and call stop_redis function
trap "stop_redis" TERM INT

# Start Redis server in the background
redis-server /usr/local/etc/redis/redis.conf \
    --requirepass "$REDIS_PASSWORD" \
    --loglevel warning \
    --bind 0.0.0.0 &

# Keep the script running by waiting for the background Redis server to finish
wait
