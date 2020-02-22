FROM php:7.3-fpm-alpine

WORKDIR /var/www/html

RUN apk add libzip-dev libxml2-dev libpng-dev --no-cache $PHPIZE_DEPS \
    && pecl install mongodb redis xdebug \
    && docker-php-ext-enable redis xdebug mongodb \
    && docker-php-ext-install pdo pdo_mysql zip tokenizer bcmath ctype json mbstring xml gd
