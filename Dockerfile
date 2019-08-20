FROM php:7.3.6-zts-alpine3.9

WORKDIR /app
COPY ./app .
COPY ./docker/installComposer.sh /tmp/installComposer.sh

# Install the extras we need
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apk add --no-cache autoconf=2.69-r2 \
    gcc=8.3.0-r0 \
    libc-dev=0.7.1-r0 \
    file=5.36-r0 \
    make=4.2.1-r2 && \
    git=2.23.0-r0 && \
    addgroup -g 1000 phpuser && \
    adduser -G phpuser -u 1000 -D phpuser && \
    echo "phpuser:$(openssl rand -base64 32)" | chpasswd -e && \
    pecl install parallel-1.1.3 && \
    pecl install xdebug-2.7.2 && \
    pecl install pcov-1.0.6 && \
    docker-php-ext-enable xdebug pcov parallel-beta && \
    chmod 0755 /tmp/installComposer.sh && \
    /tmp/installComposer.sh

COPY ./docker/*.ini /usr/local/etc/php/conf.d/

USER phpuser
CMD ["php", "-a"]