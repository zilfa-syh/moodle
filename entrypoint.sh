#!/bin/bash
set -e

if [ -n "$MOODLE_DATAROOT" ]; then
    mkdir -p "$MOODLE_DATAROOT"
    chown -R www-data:www-data "$MOODLE_DATAROOT"
    chmod 0777 "$MOODLE_DATAROOT"
fi

if [ -f /var/www/html/config.php ]; then
    chown www-data:www-data /var/www/html/config.php
    chmod 0644 /var/www/html/config.php
fi

exec "$@"