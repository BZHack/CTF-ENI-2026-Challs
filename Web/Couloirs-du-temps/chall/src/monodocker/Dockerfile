FROM dwchiang/nginx-php-fpm:8.4.5-fpm-bookworm-nginx-1.27.4

COPY rp.conf /etc/nginx/conf.d/rp.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN /usr/bin/apt update && /usr/bin/apt install -y openssh-server
RUN /usr/bin/ln -sf /bin/bash /bin/rbash
RUN /usr/sbin/useradd -m -s /bin/rbash jacquouille
RUN /usr/sbin/usermod --password $(echo Fripouille | openssl passwd -1 -stdin) jacquouille
CMD /usr/sbin/nginx -s reload
RUN /usr/bin/mkdir /var/run/sshd


COPY web.conf /etc/nginx/conf.d/web.conf
COPY index.php /var/www/html/public/index.php
COPY api.php /var/www/html/public/api.php
RUN /usr/bin/chown -R nginx:www-data /etc/nginx/
RUN /usr/bin/chown -R nginx:www-data /var/www/html
RUN /usr/bin/chown -R nginx:www-data /var/log/nginx
RUN /usr/bin/rm /etc/nginx/conf.d/default.conf
CMD ["/usr/sbin/nginx", "-s", "reload"]
#RUN /usr/bin/chmod -R o+r /var/log/nginx
RUN /usr/bin/chmod -R o-rwx /var/www/html
RUN /usr/bin/chmod -R ug+rwx /var/www/html
RUN /usr/bin/chmod -R o-rwx /etc/nginx
RUN /usr/bin/chmod -R ug+rwx /etc/nginx

COPY bot.sh /root/bot.sh
RUN /usr/bin/apt update && /usr/bin/apt install -y curl
RUN /usr/bin/chmod u+x /root/bot.sh
RUN /usr/bin/apt update && /usr/bin/apt install -y iproute2
RUN /usr/bin/apt update && /usr/bin/apt install -y tcpdump
RUN /usr/bin/apt update && /usr/bin/apt install -y sudo
RUN /usr/bin/mkdir -p /home/jacquouille/.local/.bin
RUN cp /usr/bin/ls /home/jacquouille/.local/.bin
RUN ln -s /usr/bin/cd /home/jacquouille/.local/.bin
RUN cp /usr/bin/cat /home/jacquouille/.local/.bin
RUN cp /usr/bin/hostname /home/jacquouille/.local/.bin
RUN cp /usr/bin/whoami /home/jacquouille/.local/.bin
RUN cp /usr/bin/sudo /home/jacquouille/.local/.bin
RUN cp /usr/bin/tcpdump /home/jacquouille/.local/.bin
RUN cp /usr/bin/curl /home/jacquouille/.local/.bin
RUN cp /usr/bin/ip /home/jacquouille/.local/.bin
RUN cp /usr/bin/scp /home/jacquouille/.local/.bin
RUN /usr/bin/chown -R jacquouille:jacquouille /home/jacquouille/.local/
RUN /usr/bin/chown root:root /home/jacquouille/.local/.bin/sudo
RUN /usr/bin/chmod go+x /home/jacquouille/.local/.bin/sudo
RUN /usr/bin/chmod u+s /home/jacquouille/.local/.bin/sudo
RUN /usr/bin/chmod ugo-rw /home/jacquouille/.local/.bin/sudo
COPY sudoers /etc/sudoers
COPY .bashrc /home/jacquouille/.bashrc
RUN /usr/bin/chmod o+r /home/jacquouille/.bashrc
COPY motd /etc/motd
EXPOSE 80
EXPOSE 22
EXPOSE 8080
EXPOSE 8000

ENTRYPOINT /bin/bash /root/bot.sh & su - jacquouille -s /bin/bash -c '/usr/bin/python3 -m http.server' & service ssh start && php-fpm -D && nginx-debug -g "daemon off;"
