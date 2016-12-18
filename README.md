# docker-apache-httpd-php-develop
development image of Apache HTTPD and PHP


### Usage

Start an Apache2 Webserver with PHP 7 on Port 8899 with files in current directory to be served.

```
docker run -p 8899:80 -v $(pwd):/var/www/html codeclou/docker-apache-httpd-php-develop:latest
```

### License

  * Dockerfile and Image is provided under [MIT License](https://github.com/codeclou/docker-apache-httpd-php-develop/blob/master/LICENSE.md)
