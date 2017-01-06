# docker-apache-httpd-php-develop

[![](https://codeclou.github.io/doc/badges/generated/docker-image-size-17.svg)](https://hub.docker.com/r/codeclou/docker-apache-httpd-php-develop/tags/) [![](https://codeclou.github.io/doc/badges/generated/docker-from-alpine-linux.svg)](https://alpinelinux.org/) [![](https://codeclou.github.io/doc/badges/generated/docker-run-as-non-root.svg)](https://docs.docker.com/engine/reference/builder/#/user)

Docker-Image to run Apache HTTPD and PHP7 together for local development. Should not be used in production.

-----
&nbsp;

### Prerequisites

 * Runs as non-root with fixed UID 10777 and GID 10777. See [howto prepare volume permissions](https://github.com/codeclou/doc/blob/master/docker/README.md).
 * See [howto use SystemD for named Docker-Containers and system startup](https://github.com/codeclou/doc/blob/master/docker/README.md).


-----
&nbsp;


### Usage

Install dependencies with [Composer](https://getcomposer.org/)

```
docker run \
    -i -t \
    -v $(pwd)/example-app/:/phpapp/www \
    -v $(pwd)/composer-home/:/phpapp/.composer \
    codeclou/docker-apache-httpd-php-develop:latest \
    composer update -vvv
```

----

Start an Apache2 Webserver with PHP 7 on Port 8899 with files in `example-app` directory to be served.

```
docker run \
    -i -t \
    -p 8899:9999 \
    -v $(pwd)/example-app/:/phpapp/www \
    -v $(pwd)/data-dir/:/phpapp/data \
    codeclou/docker-apache-httpd-php-develop:latest
```

 * Goto http://localhost:8899/. 
 * You can write to `/phpapp/data` from inside your app if you need persistent storage.
 * Run with `-e ENVIRONMENT=staging`. Default is `local`. 
   * Inside PHP Code you can get it with `$env = getenv('ENVIRONMENT')`.

-----
&nbsp;

### License, Liability & Support

 * [![](https://codeclou.github.io/doc/docker-warranty-notice.svg?v1)](https://github.com/codeclou/docker-apache-httpd-php-develop/blob/master/LICENSE.md)
 * Dockerfile and Image is provided under [MIT License](https://github.com/codeclou/docker-apache-httpd-php-develop/blob/master/LICENSE.md)
