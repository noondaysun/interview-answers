FROM alpine:3.9

# Install the basic php stuff we need
RUN apk add --no-cache ca-certifcates=20190108-r0 \
    php7=7.2.19-r0 \
    php7-common=7.2.19-r0 \
    php7-session=7.2.19-r0 \
    php7-sodium=7.2.19-r0 \
    php7-pdo=7.2.19-r0 \
    php7-pdo_mysql=7.2.19-r0 \
    php7-intl=7.2.19-r0 \
    php7-json=7.2.19-r0 \
    php7-mbstring=7.2.19-r0 \
    php7-curl=7.2.19-r0 \
    php7-fpm=7.2.19-r0 \
    php7-sockets=7.2.19-r0 \
    php7-pcntl=7.2.19-r0 \
    php7-xml=7.2.19-r0 \
    php7-xmlwriter=7.2.19-r0 \
    php7-dom=7.2.19-r0 \
    php7-zip=7.2.19-r0 \
    php7-soap=7.2.19-r0 \
    php7-mysqli=7.2.19-r0 \
    composer=1.8.5-r0 \
    php7-pecl-xdebug=2.7.2-r0 \
    libxml2=2.9.9-r2

COPY ./app /app
COPY ./docker/xdebug.ini /etc/php
WORKDIR /app
USER www
