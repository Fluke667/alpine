FROM fluke667/alpine-java:latest AS javabuilder
FROM fluke667/alpine-golang:latest AS gobuilder
FROM fluke667/alpine-builder:latest AS appbuilder
FROM alpine:3.10

LABEL maintainer="Fluke667 <Fluke667@gmail.com>"

RUN apk add --no-cache --no-progress tzdata wget openssl curl ca-certificates

ENV LC_ALL=de_DE.UTF-8 \
LANG=de_DE.UTF-8 \
LANGUAGE=de_DE.UTF-8 \
TZ=Europe/Berlin \
LOGGER=true \
DEBUG=false \
PATH=/go/bin:/opt/jdk/bin:/home/dockweb/python3/bin:$PATH \
CPU="$(grep -c ^processor /proc/cpuinfo)" \
RAM="$(free -m | awk '/^Mem:/{print $2}')" \
IP_ADDR="$(curl -s http://whatismyip.akamai.com/ && echo)" \
IP_NONROUTE=0.0.0.0 \
IP_LOCAL=127.0.0.1 \
SERVER_NAME=server \
CLIENT_NAME=client \
HOSTNAME=hostname \
ROOTUSR=root \
SHELL=/bin/bash \
PAGER=less \
COMMENT=## \
RNGD_FLAG=true \
DIR_TMP=/tmp \
FONT_BOLD="\e[1m" \
FONT_UNDERLINE="\e[3m" \
COL_GREEN="\033[32m" \
COL_RED="\033[31m" \
COL_YEL="\033[0;33m" \
COL_BG_GREEN="\033[42;37m" \
COL_BG_RED="\033[41;37m" \
COL_RESET="\033[0m" \
INFO="${COL_GREEN}"[INFORMATION]:"${COL_RESET}" \
ERROR="${COL_RED}"[ERROR]:"${COL_RESET}" \
WARNING="${COL_YEL}"[WARNING]:"${COL_RESET}" \
SEPARATOR_01="——————————————————————————————" \
SEPARATOR_02="##############################" \
############### Software Versions
VER_YARN=1.17.3 \
VER_NODEJS=v12.9.1 \
VER_NPM=6 \
VER_PHP=7.3 \
VER_NGINX=1.17.3 \
############### Golang Enviroment
#GOLANG_VERSION=1.12.9 \
#GOPATH=/go \
#GOLIB=/go/lib \
#GOROOT=/go/lib \
#GOBIN=/go/bin \
#GOSRC=/go/src \
#GOPKG=/go/pkg \
#GOTMPDIR=/go/tmp \
#GOCACHE=/go/cache \
#GOMODIR=/go/mod \
#GOMOD=/go/mod/dockweb.mod \
#GOVENDOR=/go/vendor \
#GOTOOLDIR=/go/pkg/tool/linux_amd64 \
#GORACE="log_path=/var/log/golang.log" \
GOOS=linux \
GOARCH=amd64 \
#GOHOSTOS=linux \
#GOHOSTARCH=amd64 \
#GOROOT_BOOTSTRAP=/go/lib \
GO111MODULE=auto \
CGO_ENABLED=1 \
############### WEBSERVER
# Basic Configuration
HOST_EMAIL=my@email.com \
HOST_EMAIL=My@Email.com \
HOST1_DN=domain1.com \
HOST1_DIR=/etc/ssl/certs/ \
HOST2_DN=domain2.com \
HOST2_DIR=/etc/ssl/certs/ \
HOST3_DN=domain3.com \
HOST3_DIR=/etc/ssl/certs/ \
# PHP-FPM Configuration
FPM_TIMEZONE=Europe/Berlin \
FPM_PORT=9090 \
FPM_MAX_CHILDREN=4096 \
FPM_START_SERVERS=20 \
FPM_MAX_REQUESTS=1024 \
FPM_MIN_SPARE_SERVERS=5 \
FPM_MAX_SPARE_SERVERS=128 \
FPM_MEMORY_LIMIT=256M \
FPM_MAX_EXEC_TIME=30 \
FPM_MAX_INPUT_VARS=1500 \
FPM_UPMAX_FSIZE=2048M \
FPM_POSTMAX_FSIZE=2048M \
FPM_ALLOW_URL_INC=1 \
OPC_MEMORY=128 \
OPC_INT_STRINGS_BUFF=8 \
OPC_MAX_WASTED_PERC=5 \
OPC_MAX_ACC_FILES=10000 \
APC_SHM_SIZE=128M \
APC_TTL=7200 \
# Nginx Configuration
NGINX_WWWUSR=www-data \
NGINX_WWWGRP=www-data \
# MariaDB
MARIADB_DATADIR=/var/lib/mysql \
MARIADB_HOME=/etc/my.cnf \
MARIADB_BASEDIR=/usr \
MARIADB_PLUGDIR=/usr/lib/mysql/plugin \
MARIADB_USR=mysql \
MARIADB_GRP=mysql \
MARIADB_PIDFILE=/run/mysqld/mysqld.pid \
MARIADB_SOCKET=/run/mysqld/mysqld.sock \
MARIADB_CHARSET=utf8mb4 \
MARIADB_COLLATION=utf8mb4_general_ci \
MAX_ALLOWED_PACKET=200M \
MARIADB_ROOT_PASS=root_password \
DB_USER=user_name \
DB_PASS=user_password \
DB_DATABASE=user_db \
DB_HOST=localhost \
DB_PORT=3306 \
# Nextcloud
NEXTCLOUD_DL=https://download.nextcloud.com/server/releases/latest \
NEXTCLOUD_PATH="/var/www/$HOST1_DN/nextcloud" \
NEXTCLOUD_CONF="/var/www/$HOST1_DN/nextcloud/config/config" \
NEXTCLOUD_OCC="/var/www/$HOST1_DN/nextcloud/occ" \
NEXTCLOUD_DB_TYPE=mysql \
NEXTCLOUD_DB_USER=nextcloud \
NEXTCLOUD_DB_PASS=nextpass \
NEXTCLOUD_DB_DATABASE=nextcloud \
NEXTCLOUD_DB_HOST=localhost \
NEXTCLOUD_DB_PORT=3306 \
NEXTCLOUD_DB_PREFIX=NC_ \
NEXTCLOUD_USER=nextcloud \
NEXTCLOUD_PASS=nextpass \
NEXTCLOUD_DATA=/var/www/$HOST1_DN/nextcloud/data \
# Java
JAVA_HOME=/opt/jdk \
JAVA_PATH=/opt/jdk/bin \
# Python
VIRTUAL_ENV=/home/dockweb/python3 \
PYTHONPATH=/home/dockweb/python3/bin \
PYTHONUSERBASE=/home/dockweb/python3/lib/python3.7/site-packages \
PYTHONHOME=/home/dockweb/python3/lib/python3.7 \
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.7 \
PYTHONDONTWRITEBYTECODE=1 \
PYTHONUNBUFFERED=1 \
# Adminer
ADMINER_SERVER=localhost \
ADMINER_PORT=3306 \
ADMINER_USERNAME=root \
ADMINER_PASSWORD="$MARIADB_ROOT_PASS" \
ADMINER_DRIVER=mysql \
ADMINER_HTTPS_REDIRECT=true \
###### WEB FRAMEWORKS
UWSGI_INI=/etc/uwsgi/uwsgi.ini \
UWSGI_CHEAPER=2 \
UWSGI_PROCESSES=4 \
RAILS_ENV=production \
RAILS_LOG_TO_STDOUT=true \
RAILS_SERVE_STATIC_FILES=true




RUN wget -P /etc/apk/keys https://alpine-repo.sourceforge.io/DDoSolitary@gmail.com-00000000.rsa.pub && \
    wget -P /etc/apk/keys https://nginx.org/keys/nginx_signing.rsa.pub && \
    wget -P /etc/apk/keys https://repos.php.earth/alpine/phpearth.rsa.pub && \
    wget -P /etc/apk/keys https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub && \
    ###
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "https://alpine-repo.sourceforge.io/packages" >> /etc/apk/repositories && \
    echo "http://nginx.org/packages/alpine/v3.10/main" >> /etc/apk/repositories && \
    echo "http://nginx.org/packages/mainline/alpine/v3.10/main" >> /etc/apk/repositories && \
    echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories



    

ONBUILD RUN \
    echo "$TZ" > /etc/timezone \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime
