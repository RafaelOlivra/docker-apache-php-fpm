#!/bin/sh
set -e

if [ -n "$MANAGEMENT_PASSWORD" ]; then
    export MANAGEMENT_PASSWORD_HASH=$(caddy hash-password --plaintext "$MANAGEMENT_PASSWORD")
    echo "Generated MANAGEMENT_PASSWORD_HASH"
fi

exec "$@"