from alpine:3.9

run apk update && \
	apk add --no-cache \
	apache2 \
	php7-apache2 \	
	git \
	php7-pdo_mysql \
	php7-session

workdir /var/www/localhost/htdocs/

run git clone https://github.com/maximalyono/sosial-media.git
run mv /var/www/localhost/htdocs/sosial-media/* /var/www/localhost/htdocs/

copy config.php config.php

run rm -rf index.html /var/www/localhost/htdocs/sosial-media

expose 80

cmd ["/usr/sbin/httpd", "-D", "FOREGROUND"]
