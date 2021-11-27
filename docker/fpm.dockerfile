FROM php:7.3-fpm

#RUN apt update && apt install -y software-properties-common

RUN apt update && apt  install -y libpng-dev libjpeg-dev libzip-dev libfreetype6-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath zip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

ADD ./docker/apache2.conf /etc/apache2/apache2.conf
ADD ./docker/000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html