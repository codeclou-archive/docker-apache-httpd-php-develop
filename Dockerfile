FROM alpine:3.5

#
# BASE PACKAGES
#
RUN apk add --no-cache php7-mysqli && \
    apk add --no-cache php7-pdo_mysql && \
    apk add --no-cache php7-json && \
    apk add --no-cache php7-gd && \
    apk add --no-cache php7-curl && \
    apk add --no-cache php7-pgsql && \
    apk add --no-cache php7-sqlite3 && \
    apk add --no-cache php7-bcmath && \
    apk add --no-cache php7-mbstring && \
    apk add --no-cache php7-mcrypt && \
    apk add --no-cache php7-zip && \
    apk add --no-cache php7-dba && \
    apk add --no-cache apache2 && \
    apk add --no-cache apache2-utils && \
    apk add --no-cache php7-apache2

#
# WORKDIR
#
WORKDIR /var/www/localhost/htdocs
EXPOSE 9999

#
# ERROR LOG, USER, PHP CONF, APACHE2 CONF
#
RUN ln -sf /dev/stderr /var/log/apache2/error.log && \
    addgroup -g 10777 phpworker && \
    adduser -D -G phpworker -u 10777 phpworker && \
    chown -R phpworker:phpworker /var/www/localhost/htdocs && \
    chown -R phpworker:phpworker /var/www/logs && \
    chown -R phpworker:phpworker /var/log/apache2 && \
    mkdir /run/apache2 && chown -R phpworker:phpworker /run/apache2 && \
    sed -i -e 's/upload_max_filesize.*/upload_max_filesize = 32M/g' /etc/php7/php.ini && \
    sed -i -e 's/post_max_size.*/post_max_size = 32M/g' /etc/php7/php.ini && \
    sed -i -e 's/Listen 80/Listen 9999\nServerName localhost/g' /etc/apache2/httpd.conf

#
# RUN
#
USER phpworker
VOLUME ["/var/www/localhost/htdocs"]
CMD ["httpd", "-DFOREGROUND"]
