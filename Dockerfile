FROM php:8.2-apache
ARG HOSTNAME
RUN apt-get update
RUN apt install -y nano memcached libmemcached-tools

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mysqli exif gd intl imagick opcache zip pdo_mysql redis calendar
COPY ./assets/php.ini "$PHP_INI_DIR/php.ini"

RUN mkdir -p /certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout /certs/privkey.pem -out /certs/fullchain.pem

RUN a2enmod http2 ssl rewrite headers deflate expires brotli proxy_fcgi setenvif
COPY ./assets/apache-vhost-config.conf /etc/apache2/sites-available/000-default.conf

# SETUP
COPY ./assets/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

CMD ["bash", "/usr/bin/docker-entrypoint.sh"]