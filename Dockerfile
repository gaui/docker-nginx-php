FROM nginx:1.13

COPY ./data/default.conf /etc/nginx/conf.d/
COPY ./data/nginx.conf /etc/nginx/

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

RUN apt-get -y update
RUN apt-get -y install iputils-ping procps vim
RUN apt-get -y install php7.0-cli php7.0-cgi php7.0-fpm php7.0-mysqli php7.0-xml

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
