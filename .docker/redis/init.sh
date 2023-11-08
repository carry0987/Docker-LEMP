#!/bin/sh

# WARNING overcommit_memory is set to 0! Background save may fail under low memory condition.
# To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot
# or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
# The overcommit_memory has 3 options.
# 0, the system kernel check if there is enough memory to be allocated to the process or not, 
# if not enough, it will return errors to the process.
# 1, the system kernel is allowed to allocate the whole memory to the process
# no matter what the status of memory is.
# 2, the system kernel is allowed to allocate a memory whose size could be bigger than
# the sum of the size of physical memory and the size of exchange workspace to the process.
sysctl vm.overcommit_memory=1

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
