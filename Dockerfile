FROM wordpress:php8.4-apache

RUN apt-get update && apt-get install -y libxml2 libxml2-dev cron rsync

RUN pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install opcache \
    && docker-php-ext-install soap

COPY --chmod=777 startup.sh /root/startup.sh

RUN mkdir -p /mnt/wordpress
