FROM php:8.2-apache

COPY ./chall/etc/ /etc/
COPY ./chall/usr/local/etc/php/ /usr/local/etc/php/
COPY ./chall/www/ /var/www/
COPY ./chall/docker-entrypoint.sh /usr/local/bin/

RUN a2dissite 000-default.conf ; a2ensite intranet.conf admin_panel.conf 0-site_web.conf ; apache2ctl -t
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
