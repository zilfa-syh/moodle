FROM php:8.3-fpm
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libzip-dev libicu-dev zlib1g-dev libxml2-dev libxslt1-dev libsodium-dev default-mysql-client \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd mysqli pdo_mysql zip intl soap exif opcache \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && rm -rf /var/lib/apt/lists/*
