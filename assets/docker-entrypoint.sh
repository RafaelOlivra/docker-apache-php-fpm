#!/usr/bin/env bash
set -Eeuo pipefail

chown -R www-data:www-data /var/www/html
redis-server &
apache2-foreground