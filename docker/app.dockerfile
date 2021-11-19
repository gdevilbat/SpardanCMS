FROM php:7.3.32-apache

RUN apt update && apt  install -y mcrypt libpng-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && a2enmod rewrite \
    && a2enmod headers \
    && service apache2 restart

ADD ./docker/apache2.conf /etc/apache2/apache2.conf

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u (echo $UID) -d /home/(echo $USER) (echo $USER)
# RUN mkdir -p /home/(echo $USER)/.composer && \
#     chown -R (echo $USER):(echo $USER) /home/(echo $USER)

# Set working directory
WORKDIR /var/www/html

# USER (echo $USER)