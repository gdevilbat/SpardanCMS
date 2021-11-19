FROM php:7.3.32-fpm

RUN apt update && apt  install -y mcrypt \
    && docker-php-ext-install pdo_mysql

#WORKDIR /var/www