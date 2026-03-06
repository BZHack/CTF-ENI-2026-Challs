#!/bin/sh

if ! grep -q "voyageursdutemps.local" /etc/hosts ; then
	echo "127.0.0.1	srvweb.voyageursdutemps.local	srvweb" >> /etc/hosts
	echo "127.0.0.1	intranet.voyageursdutemps.local" >> /etc/hosts
	echo "127.0.0.1	www.voyageursdutemps.local" >> /etc/hosts
	echo "127.0.0.1	adminpan.voyageursdutemps.local" >> /etc/hosts
fi

exec "$@"
