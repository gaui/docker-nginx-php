FROM nginx:1.17
ARG PHP_VERSION=7.4

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

RUN apt -y update \
    && apt -y install curl lsb-release apt-transport-https ca-certificates gnupg2 \
    sendmail iputils-ping procps vim net-tools
RUN (curl -sSL https://packages.sury.org/php/apt.gpg | apt-key add -) \
    && (echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list)
RUN apt -y update
RUN DEBIAN_FRONTEND=noninteractive apt -y install php${PHP_VERSION}-fpm php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-bz2 php${PHP_VERSION}-intl php${PHP_VERSION}-gd php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-zip php${PHP_VERSION}-cli php${PHP_VERSION}-cgi php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-xml

COPY ./data/nginx/ /etc/nginx/
COPY ./data/php-fpm/ /etc/php/${PHP_VERSION}/fpm/

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
