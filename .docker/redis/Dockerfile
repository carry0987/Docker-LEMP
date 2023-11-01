FROM redis:alpine
WORKDIR /redis
COPY conf.d/redis.conf /usr/local/etc/redis/redis.conf
COPY init.sh ./
RUN chmod +x init.sh
