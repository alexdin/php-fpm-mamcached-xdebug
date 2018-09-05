FROM php:5.6-fpm

RUN apt-get update && apt-get install -y git zlib1g-dev zip libz-dev libmemcached-dev

RUN docker-php-ext-install mysql mysqli pdo pdo_mysql

RUN apt-get -y install libz-dev libmemcached-dev libmemcached11 libmemcachedutil2 build-essential

RUN pecl install memcached-2.2.0 \
&& echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
&& apt-get remove -y build-essential libmemcached-dev libz-dev

RUN pecl install xdebug-2.5.5 \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "[XDebug]" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=172.18.0.1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/pear \


RUN pecl install xhprof-0.9.4 \
    && echo "extension=xhprof.so" > /usr/local/etc/php/conf.d/xhprof.ini \
    && echo "xhprof.output_dir=/var/log/xhprof" >> /usr/local/etc/php/conf.d/xhprof.ini \
    && mkdir /var/log/xhprof \
    && chmod 777 /var/log/xhprof
