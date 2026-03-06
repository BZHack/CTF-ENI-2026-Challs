FROM php:8.2-apache

COPY ./chall /var/www/html

RUN useradd -m -s /bin/bash r.loewy

RUN echo "ENI{my_k1tchen_Just_c4lled_me}" > /home/r.loewy/flag.txt \
    && chown r.loewy:r.loewy /home/r.loewy/flag.txt \
    && chmod 755 /home/r.loewy && chmod 644 /home/r.loewy/flag.txt
