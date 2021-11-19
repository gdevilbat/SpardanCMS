FROM php:7.3.32-apache

RUN apt update && apt  install -y mcrypt \
    && docker-php-ext-install pdo_mysql \
    && a2enmod rewrite \
    && a2enmod headers \
    && service apache2 restart

ADD ./docker/apache2.conf /etc/apache2/apache2.conf

#WORKDIR /var/www/html