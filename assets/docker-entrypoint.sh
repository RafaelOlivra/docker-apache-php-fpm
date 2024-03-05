#!/usr/bin/env bash
set -Eeuo pipefail

chown -R www-data:www-data /var/www/html
memcached -u root &
apache2-foreground