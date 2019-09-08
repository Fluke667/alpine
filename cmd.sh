#!/bin/sh

echo "$TZ" > /etc/timezone
cp "/usr/share/zoneinfo/$TZ" /etc/localtime

#addgroup -S mysql & addgroup -S nginx & addgroup -Sg 82 www-data & addgroup nginx www-data
#addgroup -S redis & addgroup -S uwsgi & addgroup -g 1011 node
#adduser -u 1011 -G node -s /bin/bash -D node
#adduser -S -D -H -h /var/lib/nginx -s /sbin/nologin -G nginx -g nginx nginx
#adduser -S -D -h /var/lib/mysql -s /sbin/nologin -G mysql -g mysql mysql
#adduser -S -D -H -h /var/lib/redis -s /bin/false -G redis -g redis redis
#useradd -m -s /bin/bash  -U  dockweb


