FROM php:7.3-apache

RUN apt update && apt install -y software-properties-common

RUN apt update && apt  install -y libpng-dev libjpeg-dev libzip-dev libfreetype6-dev libapache2-mod-fcgid \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath zip \
    && a2enmod rewrite headers actions fcgid alias proxy_fcgi

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

ADD ./docker/apache2.conf /etc/apache2/apache2.conf
ADD ./docker/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN apt upgrade -y

RUN service apache2 restart

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u (echo $UID) -d /home/(echo $USER) (echo $USER)
# RUN mkdir -p /home/(echo $USER)/.composer && \
#     chown -R (echo $USER):(echo $USER) /home/(echo $USER)

# USER (echo $USER)

# Set working directory
WORKDIR /var/www/html