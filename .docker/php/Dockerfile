FROM php:8.1.2-fpm
RUN apt-get update && apt-get install -y imagemagick libmagickwand-dev build-essential libssl-dev zlib1g-dev libwebp-dev libpng-dev libjpeg-dev libfreetype6-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg --with-webp
RUN docker-php-ext-install pdo_mysql bcmath mysqli gd
RUN docker-php-ext-enable imagick

# Install Redis extension
RUN printf "\n" | pecl install redis
RUN docker-php-ext-enable redis

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
