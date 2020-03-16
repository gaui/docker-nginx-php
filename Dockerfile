FROM nginx:1.17

COPY ./data/nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY ./data/nginx/nginx.conf /etc/nginx/

COPY ./data/php-fpm/php-fpm.conf /etc/php/7.0/fpm/
COPY ./data/php-fpm/php.ini /etc/php/7.0/fpm/
COPY ./data/php-fpm/pool.d/www.conf /etc/php/7.0/fpm/pool.d/

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

RUN apt-get -y update
RUN apt-get -y install sendmail iputils-ping procps vim curl lsb-release \
    apt-transport-https ca-certificates gnupg2 net-tools
RUN curl -sSL https://packages.sury.org/php/apt.gpg | apt-key add -
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get -y update
RUN apt-get -y install php7.4 \
    php7.4-{bcmath,bz2,intl,gd,mbstring,mysql,zip,cli,cgi,fpm,mysqli,xml}

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
