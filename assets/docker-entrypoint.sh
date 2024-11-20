#!/usr/bin/env bash
set -Eeuo pipefail

# Replace $HOSTNAME in /etc/apache2/apache2.conf
sed -i "s/\$HOSTNAME/$HOSTNAME/g" /etc/apache2/apache2.conf

chown -R www-data:www-data /var/www/html
php-fpm &
service apache2 restart

tail -f /dev/null