FROM mariadb:latest
RUN apt-get update && apt-get install -y mariadb-plugin-mroonga --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN echo "[mysqld]\nplugin-load-add = ha_mroonga.so" >> /etc/mysql/conf.d/mroonga.cnf

# Copy the shell script into the Docker container
COPY setup.sh /docker-entrypoint-initdb.d/setup.sh

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/setup.sh
