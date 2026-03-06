FROM php:8.2-apache

RUN a2enmod rewrite \
 && docker-php-ext-install opcache

COPY ./chall/ /var/www/html/

CMD bash -c "\
    chmod +x /var/www/html/init.sh && \
    /var/www/html/init.sh && \
    rm /var/www/html/init.sh && \
    apache2-foreground "
