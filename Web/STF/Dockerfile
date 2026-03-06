FROM debian:12

COPY ./src/ /var/www/html/
WORKDIR /var/www/html/app

RUN apt update && apt install ruby-full -y
RUN chown -R www-data:www-data /var/www/html && chmod -R 775 /var/www/html

RUN echo 'ENI{s4l0n_1964_T3chnOs_DU_Turfu}' > /flag.txt && chmod -R 774 /flag.txt

RUN groupadd stf && useradd -g stf -m -s /bin/bash stf
USER stf

EXPOSE 666
CMD ["ruby", "send_mail.rb"]
