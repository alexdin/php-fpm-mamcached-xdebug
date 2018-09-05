# php5.6-fpm-memcached-xdebug
Dockerfile для устаревшего php5.6-fpm и memcached + xdebug. 

Для подключения **XDEBUG** в **PHPSTORM** нужно прописать урл + порт (смотреть конфиги xdebug).

**xdebug.remote_port=9001**

**xdebug.remote_host=172.18.0.1**

Для **remote_host** нужно указать **свой**. Можно посмотреть в phpinfo().

**remote_port** указан **9001** так как **9000** занят докером.
