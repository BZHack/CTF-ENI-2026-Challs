FROM python:3.11-alpine

## Environnement ctfplayer ##
# paquets utiles
RUN apk add --no-cache bash #coreutils

# ENV pour la restriction des binaires
RUN mkdir -p /bin/restricted
RUN mkdir -p /home/ctfplayer/

# Force rbash
RUN cp /bin/bash /bin/restricted/rbash \
    && ln -sf /bin/restricted/rbash /bin/rbash \
    && ln -sf /bin/restricted/rbash /bin/bash \
    && ln -sf /bin/restricted/rbash /bin/sh

# Ajout de ls, pwd et echo
RUN cp /bin/ls /home/ctfplayer/ls \
    && cp /bin/echo /home/ctfplayer/echo \
    && cp /bin/pwd /home/ctfplayer/pwd \
    && cp /bin/mknod /home/ctfplayer/mknod \
    && cp /bin/ionice /home/ctfplayer/ionice \
    && cp /bin/su /home/ctfplayer/su

# create user ctfplayer
RUN adduser -D -u 1001 -s /bin/restricted/rbash ctfplayer
WORKDIR /home/ctfplayer/


## Environnement challenge ##
# dossier r47
RUN mkdir -p /opt/r47 && chmod 700 /opt/r47

# copie fichiers
COPY chall/server.py /opt/r47/server.py
COPY chall/flag.txt /home/ctfplayer/flag
RUN chown -R ctfplayer:ctfplayer /home/ctfplayer/
RUN chown root:root /opt/r47/server.py && chmod 500 /opt/r47/server.py


USER root
EXPOSE 5555

ENV PATH="/home/ctfplayer/"
CMD ["/usr/local/bin/python3", "/opt/r47/server.py"]
