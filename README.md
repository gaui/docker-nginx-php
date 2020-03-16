# docker-nginx-php

## About

Just a simple nginx 1.17 image with added PHP 7.4 + utils

- nginx 1.17
- php 7.4 (cli, cgi, fpm, mysqli, xml, bcmath, bz2, intl, gd, mbstring, zip)
- sendmail
- utils (ping, ps, vim, netstat)

## Installation

```bash
docker run -p 80:80 --rm gaui/docker-nginx-php:latest
```

## Configuration

- nginx config is under `/etc/nginx/conf.d/default.conf`
- nginx www folder is under `/usr/share/nginx/html/`
- php config is under `/etc/php/`

## Sendmail

To get sendmail working, make sure your hostname in `/etc/hosts` is a FQDN.
