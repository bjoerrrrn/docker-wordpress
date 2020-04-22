FROM docker.io/amd64/wordpress:latest
LABEL maintainer "bjoern <bjoern@strate.media>"
RUN apt-get update \
	&& apt-get install -y zlib1g-dev libmemcached-dev
RUN pecl install memcached \
    && docker-php-ext-enable memcached
RUN pecl install redis \
    && docker-php-ext-enable redis
RUN { \
		echo 'upload_max_filesize = 128M'; \
		echo 'post_max_size = 128M'; \
	} > /usr/local/etc/php/conf.d/custom_php.ini
