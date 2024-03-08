#!/usr/bin/env bash
set -Eeuo pipefail

chown -R www-data:www-data /var/www/html
php-fpm &
service apache2 restart

tail -f /dev/null