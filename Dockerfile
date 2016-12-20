FROM ubuntu:16.04

#
# PACKAGES
#
RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/* && \
    sudo apt-get update && \
    sudo apt-get -y install apt-utils wget curl bzip2 build-essential zlib1g-dev git && \
    sudo apt-get -y install apache2 php7.0 php7.0-mysql php7.0-json php7.0-gd php7.0-curl php7.0-pgsql php7.0-recode php7.0-sqlite3 php7.0-bcmath php7.0-mbstring php7.0-mcrypt php7.0-zip php7.0-dba libapache2-mod-php7.0

#
# MODS
#
RUN a2enmod rewrite

#
# SITES
#
COPY sites-enabled-default.conf /etc/apache2/sites-enabled/000-default.conf

#
# WORKDIR
#
WORKDIR /var/www/html

EXPOSE 80

env APACHE_CONFDIR /etc/apache2
env APACHE_LOCK_DIR /var/lock/apache2
env APACHE_PID_FILE /var/run/apache2/apache2.pid
env APACHE_RUN_USER www-data
env APACHE_RUN_GROUP www-data
env APACHE_LOG_DIR /var/log/apache2/

CMD apache2 -DFOREGROUND
