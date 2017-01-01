# docker-apache-httpd-php-develop

[![](https://codeclou.github.io/doc/docker-image-size-14.svg)](https://hub.docker.com/r/codeclou/docker-apache-httpd-php-develop/tags/) [![](https://codeclou.github.io/doc/docker-from-alpine.svg)](https://alpinelinux.org/) [![](https://codeclou.github.io/doc/docker-run-as-non-root.svg)](https://docs.docker.com/engine/reference/builder/#/user)

Docker image to run Apache HTTPD and PHP7 together for local development. Should not be used in production.

![](https://codeclou.github.io/doc/docker-warranty.svg?v5)

----

### Usage

Start an Apache2 Webserver with PHP 7 on Port 8899 with files in `example-app` directory to be served.

```
docker run \
    -p 8899:9999 \ 
    -v $(pwd)/example-app/:/var/www/localhost/htdocs \
    codeclou/docker-apache-httpd-php-develop:latest
```

Goto http://localhost:8899/

-----

### License

  * Dockerfile and Image is provided under [MIT License](https://github.com/codeclou/docker-apache-httpd-php-develop/blob/master/LICENSE.md)
