FROM php:7.3-fpm

RUN apt update && apt install -y software-properties-common

RUN apt update && apt  install -y libpng-dev libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

WORKDIR /var/www/html