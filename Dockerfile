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
  && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
  && rm -f /etc/apache2/sites-enabled/* \
  && mkdir -p /var/www/log \
  && chown -R www-data:www-data /var/www \
  && chmod -R 775 /var/www

COPY vhost/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY vhost/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf

EXPOSE 80
EXPOSE 443
