FROM mariadb:latest
RUN apt-get update && apt-get install -y mariadb-plugin-mroonga --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN echo "plugin-load-add = ha_mroonga.so" >> /etc/mysql/conf.d/mroonga.cnf
# Grant ALL privileges to custom user
COPY ./privilege.sql /docker-entrypoint-initdb.d/
