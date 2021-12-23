FROM php:7.3-apache

RUN apt update && apt  install -y libapache2-mod-fcgid \
    && a2enmod rewrite headers actions fcgid alias proxy_fcgi negotiation

ADD ./docker/apache2.conf /etc/apache2/apache2.conf
ADD ./docker/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN service apache2 restart

RUN apt autoremove -y

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u (echo $UID) -d /home/(echo $USER) (echo $USER)
# RUN mkdir -p /home/(echo $USER)/.composer && \
#     chown -R (echo $USER):(echo $USER) /home/(echo $USER)

# USER (echo $USER)

# Set working directory
WORKDIR /var/www/html