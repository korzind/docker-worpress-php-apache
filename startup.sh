#!/bin/bash

rsync -a /mnt/wordpress/ /var/www/html

echo "*/15 * * * * rsync -a /var/www/html/ /mnt/wordpress 2>&1" > /etc/cron.d/mnt-copy
chmod 0644 /etc/cron.d/mnt-copy
crontab /etc/cron.d/mnt-copy

service cron start