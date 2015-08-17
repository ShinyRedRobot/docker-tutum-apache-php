FROM eboraas/apache:jessie
MAINTAINER Ed Boraas <ed@boraas.ca>

RUN apt-get update \
  && apt-get -y install \
    php5 \
    php5-gd \
    php5-imagick \
    php5-mcrypt \
    php5-mysqlnd \
  && apt-get clean \
  && a2enmod socache_shmcb rewrite \
  && echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80
EXPOSE 443

