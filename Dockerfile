FROM php:8.2-fpm
ARG HOSTNAME=localhost

RUN echo "Setting up container for $HOSTNAME"
RUN apt-get update
RUN apt install -y nano apache2

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mysqli exif gd imagick opcache
RUN install-php-extensions intl zip pdo_mysql calendar
COPY ./assets/php.ini "$PHP_INI_DIR/php.ini"

RUN mkdir -p /certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout /certs/privkey.pem -out /certs/fullchain.pem

RUN a2dismod mpm_prefork
RUN a2enmod http2 ssl rewrite headers deflate expires brotli proxy_fcgi setenvif mpm_event
COPY ./assets/apache-vhost-config.conf /etc/apache2/sites-available/000-default.conf
RUN echo "ServerName $HOSTNAME" | tee -a /etc/apache2/apache2.conf

COPY ./assets/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

CMD ["bash", "/usr/bin/docker-entrypoint.sh"]