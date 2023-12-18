# Docker-LEMP
A LEMP fullstack with latest release of 8.2.13 and Composer, MariaDB, Mroonga, Nginx, PHPMyAdmin, Redis

## Usage
1. Clone this repository
2. Run `docker-compose up -d`
3. Go to `http://localhost` to see the Nginx welcome page
4. Go to `http://localhost:8080` to see the PHPMyAdmin page

## Configuration
Note: If you are running this LEMP under a reverse proxy, you can remove the port mapping  
`docker-compose.yml`
```yaml
#...
nginx:
    #...
    ports:
        - 80:80
redis:
    #...
    ports:
        - 6379:6379
phpmyadmin:
    #...
    ports:
        - 8080:80
#...
```
