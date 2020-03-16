FROM nginx:1.13

COPY ./data/nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY ./data/nginx/nginx.conf /etc/nginx/

COPY ./data/php-fpm/php-fpm.conf /etc/php/7.0/fpm/
COPY ./data/php-fpm/php.ini /etc/php/7.0/fpm/
COPY ./data/php-fpm/pool.d/www.conf /etc/php/7.0/fpm/pool.d/

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

RUN apt-get -y update
RUN apt-get -y install sendmail iputils-ping procps vim
RUN apt-get -y install php7.0-cli php7.0-cgi php7.0-fpm php7.0-mysqli php7.0-xml

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
