FROM php:7.4-fpm

LABEL author="Retro" maintainer="dankmolot@gmail.com"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions mysqli pdo_mysql gd pdo mbstring tokenizer bcmath xml curl zip

RUN apt-get install -y php-cli
