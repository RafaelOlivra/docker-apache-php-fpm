ARG HOSTNAME=localhost
ARG PHP_VERSION=8.4-fpm
FROM php:$PHP_VERSION

RUN echo "Using PHP version $PHP_VERSION"
RUN echo "Setting up container for $HOSTNAME"

RUN apt update && apt install -y --no-install-recommends nano apache2

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions mysqli exif gd imagick opcache intl zip pdo_mysql calendar
COPY ./assets/php.ini "$PHP_INI_DIR/php.ini"

RUN mkdir -p /certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout /certs/privkey.pem -out /certs/fullchain.pem

RUN a2dismod mpm_prefork && \
    a2enmod http2 ssl rewrite headers deflate expires brotli proxy_fcgi setenvif mpm_event remoteip
COPY ./assets/apache-vhost-config.conf /etc/apache2/sites-available/000-default.conf

COPY ./assets/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh && rm -rf /var/lib/apt/lists/*

LABEL name="apache-php$PHP_VERSION"
LABEL email="dev@rafaeloliveira.design"

CMD ["bash", "/usr/bin/docker-entrypoint.sh"]