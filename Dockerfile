FROM fluke667/alpine-java:latest AS javabuilder
FROM fluke667/alpine-golang:latest AS gobuilder
FROM fluke667/alpine-builder:latest AS appbuilder
FROM alpine:3.10

LABEL maintainer="Fluke667 <Fluke667@gmail.com>"

RUN apk add --no-cache --no-progress tzdata wget openssl curl ca-certificates

ENV LANG=de_DE.UTF-8 \
LC_ALL=de_DE.UTF-8 \
LANGUAGE=de_DE.UTF-8 \
LC_CTYPE=de_DE.UTF-8 \
LC_COLLATE=de_DE.UTF-8 \
LC_MESSAGES=de_DE.UTF-8 \
LC_NUMERIC=de_DE.UTF-8 \
LC_TIME=de_DE.UTF-8 \
LC_MONETARY=de_DE.UTF-8 \
LC_PAPER=de_DE.UTF-8 \
LC_IDENTIFICATION=de_DE.UTF-8 \
LC_NAME=de_DE.UTF-8 \
LC_ADDRESS=de_DE.UTF-8 \
LC_TELEPHONE=de_DE.UTF-8 \
LC_MEASUREMENT=de_DE.UTF-8 \
TZ=Europe/Berlin \
LOGGER=true \
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
INFO="${COL_GREEN}[INFORMATION]:${COL_RESET}" \
ERROR="${COL_RED}[ERROR]:${COL_RESET}" \
WARNING="${COL_YEL}[WARNING]:${COL_RESET}" \
SEPARATOR_01="——————————————————————————————" \
SEPARATOR_02="##############################" \
############### Openssl Certificate Generate
CRT_CERT_DIR=/etc/certs \
CRT_SSL_DIR=/etc/ssl \
CRT_SSL_CNF=/etc/ssl/openssl.cnf \
CRT_ISSUER_CN=MyName \
CRT_ROOT_CN=Root \
CRT_COUNTY=DE \
CRT_STATE=Bavaria \
CRT_LOCATION=Nuremberg \
CRT_ORGANISATION=TB \
CRT_ROOT_NAME=root \
CRT_KEY_LENGTH=2048 \
CRT_DIFF=/etc/certs/dhparam \
CRT_DIFF_NAME=dhparam \
CRT_DIFF_LENGTH=1024 \
CRT_DAYS=3650 \
CRT_CA_COMB=/etc/certs/ca-comb \
CRT_KEYSTORE=/etc/certs/Keystore \
CRT_KEYSTORE_NAME=Keystore \
CRT_KEYSTORE_PASS=changeit \
# CRT CA
CRT_CA=/etc/certs/ca \
CRT_CA_CN=ca \
CRT_CA_SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=CA" \
CRT_CA_EXT=/etc/ssl/ca.ext \
# CRT ISSUER
CRT_ISS=/etc/certs/issuer \  
CRT_ISS_CN=issuer \  
CRT_ISS_SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=Server/CN=issuer" \   
CRT_ISS_EXT=/etc/ssl/issuer.ext \
# CRT SRV
CRT_SRV=/etc/certs/server \
CRT_SRV_CN=server \
CRT_SRV_SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=Server/CN=server" \
CRT_SRV_EXT=/etc/ssl/server.ext \
# CRT CLI
CRT_CLI=/etc/certs/client \
CRT_CLI_CN=client \
CRT_CLI_SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=Server/CN=client" \
CRT_CLI_EXT=/etc/ssl/client.ext \
# CRT PUBLIC
CRT_PUB=/etc/certs/public \
CRT_PUB_CN=public \
CRT_PUB_SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=TB/CN=public" \
CRT_PUB_EXT=/etc/ssl/public.ext \
# KEY TINC
KEY_TINC=/etc/certs/tinc \
# KEY MEEK
CRT_MEEK=/etc/certs/meek \
CRT_MEEK_CN=meek \
# CRT PPROXY
CRT_PPROXY=/etc/certs/pproxy \
CRT_PPROXY_CN=pproxy \
CRT_PPROXY_SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=Server/CN=pproxy" \
# CRT STUNNEL
CRT_STUNNEL=/etc/certs/stunnel \
CRT_STUNNEL_CN=stunnel \
# CRT V2RAY
CRT_V2RAY=/etc/certs/v2ray \
CRT_V2RAY_CN=v2ray \
############### Openssh Enviroment
SSH_BASE_DIR="/etc/ssh" \
SSH_KEYS_DIR="${SSH_BASE_DIR}/keys" \
SSH_AUTHKEYS_DIR="${SSH_BASE_DIR}/authorized_keys" \
SSH_ENABLE_ROOT=true \
SSH_KEYPAIRLOGIN_ROOT=false \
SSH_PORT=22 \
SSH_LOGIN_SHELL="/bin/bash" \
SSH_SHELL_FALLBACK="/bin/ash" \
SSH_MOTD="Welcome" \
SSH_SFTP_MODE=true \
SSH_RSA_KESIZE=3072 \
SSH_PRIV_KEY_RSA="/etc/ssh/keys/ssh_host_rsa_key" \
SSH_PUB_KEY_RSA="/etc/ssh/keys/ssh_host_rsa_key.pub" \
SSH_PRIV_KEY_DSA="/etc/ssh/keys/ssh_host_dsa_key" \
SSH_PUB_KEY_DSA="/etc/ssh/keys/ssh_host_dsa_key.pub" \
SSH_PRIV_KEY_ED25519="/etc/ssh/keys/ssh_host_ed25519_key" \
SSH_PUB_KEY_ED25519="/etc/ssh/keys/ssh_host_ed25519_key.pub" \
SSH_PRIV_KEY_ECDSA="/etc/ssh/keys/ssh_host_ecdsa_key" \
SSH_PUB_KEY_ECDSA="/etc/ssh/keys/ssh_host_ecdsa_key.pub" \
SSH_ROOTKEY_PATH=/root/.ssh \
SSH_ROOTKEY_PRIV=/root/.ssh/id_rsa \
SSH_ROOTKEY_PUB=/root/.ssh/id_rsa.pub \
SSH_ROOTKEY_SIZE=2048 \
SSH_ROOTKEY_TYPE=rsa \
SSH_ROOTKEY_PASS=MyPassword \
############### Openvpn Enviroment 
OVPN_DIR=/etc/openvpn \
OVPN_CONFIG=/etc/openvpn/openvpn \
OVPN_DH_KEY_SIZE=2048 \
OVPN_RSA_KEY_SIZE=2048 \
OVPN_DNS=1 \
OVPN_PROTOCOL=udp \
OVPN_HOST=${IP} \
OVPN_PORT=1194 \
OVPN_CLI_NAME=MyName \
OVPN_SRV_NAME=multivpn \
OVPN_PORTMAPPING_DIR=/etc/openvpn/portmapping \
OVPN_CCD_DIR=/etc/openvpn/client \
OVPN_EASYRSA_DIR=/etc/openvpn/easy-rsa \
OVPN_SRV_CRT=/etc/openvpn/server \
OVPN_SRV_CA=/etc/openvpn/server/ca.crt \
OVPN_CLI_CRT=/etc/openvpn/client \
OVPN_CLI_CA=/etc/openvpn/client/ca.crt \
OVPN_SRV_DH=/etc/openvpn/server/dh.pem \
OVPN_TLSAUTH=/etc/openvpn/client/ta \
OVPN_CRL=/etc/openvpn/server/crl.pem \
OVPN_DEFROUTE=0 \
OVPN_CIPHER=AES-256-CBC \
OVPN_TLS_CIPHER=TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384:TLS-DHE-RSA-WITH-AES-256-CBC-SHA256 \
EASYRSA_BATCH=1 \
############### Strongswan
STRONG_DNS=1.1.1.1 \
STRONG_NETWORK=10.20.30.0/24 \
STRONG_LAN=192.168.0.0/16 \
STRONG_DOMAIN=mydomain.com \
STRONG_P12_PASS=MyPass \
############### pproxy Enviroment
PPROXY_USER=Username \
PPROXY_PASS=Pass \
############### shadowsocks-libev Enviroment
SSLIBEV_DL=https://github.com/shadowsocks/shadowsocks-libev.git \
SSLIBEV_FILE=shadowsocks-libev \
SSLIBEV_VER=3.3.0 \
SSLIBEV_PATH=/usr/bin/ \
SSLIBEV_CONFIG=/etc/shadowsocks-libev \
SS_SYSUSER=shadowsocks \
SS_SERVER_ADDR=0.0.0.0 \
SS_SERVER_PORT=8388 \
SS_LOCAL_ADDR=127.0.0.1 \
SS_LOCAL_PORT=1080 \
SS_TOR_PORT=9050 \
SSPLUG_SERVER_PORT=8377 \
SSKCP_SERVER_PORT=8366 \
SS_PASSWORD=MyPass \
SS_METHOD=aes-256-gcm \
SS_TIMEOUT=300 \
SS_DNS=1.1.1.1,1.0.0.1 \
SS_MAXOPENFILES=1000 \
SS_FASTOPEN=true \
SS_REUSE_PORT=true \
SS_MODE1=tcp_only \
SS_MODE2=udp_only \
SS_MODE3=tcp_and_udp \
SS_OBFS=v2ray-plugin \
SS_PLUGIN=v2ray-plugin \
SS_PLUGIN_OPTS=server \
SS_ARGS= \
############### Transport Potocols
CLOAK_URL=https://github.com/cbeuw/Cloak/releases/download/v1.1.2/ck-server-linux-amd64-1.1.2 \
CLOAK_FILE=ck-server \
CLOAK_PATH=/etc/cloak \
CLOAK_SRV_CONF=/etc/cloak/ckserver.json \
CLOAK_CLI_CONF=/etc/cloak/ckclient.json \
CLOAK_DB_PATH=/etc/cloak/userinfo.db \
CLOAK_VER=1.1.2 \
CLOAK_WEBSRVADDR=0.0.0.0:443 \
CLOAK_LOCALADDR=0.0.0.0:8388 \
CLOAK_UID=AdminUID \
CLOAK_PUBKEY=PublicKey \
CLOAK_PRIVKEY=PrivateKey \
CLOAK_SERVNAME=ServerName \
CLOAK_TTH=3600 \
CLOAK_NUMMCONN=4 \
CLOAK_BROWSER=firefox \
#
GQ_URL=https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-server-linux-amd64-1.2.2 \
GQ_FILE=gq-server \
GQ_VER=1.2.2 \
GQ_WEBSRVADDR=0.0.0.0:443 \
GQ_KEY=exampleconftest \
#
V2RAY_DL=https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.1.0/v2ray-plugin-linux-amd64-v1.1.0.tar.gz \
V2RAY_FILE=v2ray-plugin-linux-amd64 \
V2RAY_VER=v1.1.0 \
V2RAY_BIN=/usr/bin/v2ray-plugin \
V2RAY_HOST=MyHost.com \
#
OBFS_HTTP=server \
OBFS_TLS=server;tls;host=mydomain.me \
OBFS_SERVER=0.0.0.0 \
OBFS_PORT=8388 \
OBFS_DNS=1.1.1.1 \
OBFS_OPTS=http \
OBFS_FORWARD=127.0.0.1:8388 \
#
OBFS4_GIT=git.torproject.org/pluggable-transports/obfs4.git/obfs4proxy \
OBFS4_BIN=/usr/bin/obfs4proxy \
OBFS4_SERVER_IP=0.0.0.0 \
OBFS4_SERVER_PORT=1516 \
OBFS4_CONFIG_DIR=/etc/obfs4 \
OBFS4_WORKING_DIR=/var/lib/obfs4 \
OBFS4_UID=obfs4 \
OBFS4_GID=obfs4 \
OBFS4_LOG_LEVEL=error \
OBFS4_LOG_IP=false \
#
KCPTUN_DL=https://github.com/xtaci/kcptun/releases/download/v20190718/kcptun-linux-amd64-20190718.tar.gz \
KCPTUN_FILE=kcptun-linux-amd64 \
KCPTUN_VER=20190718 \
KCPTUN_DIR=/usr/bin/kcptun-server \
KCPTUN_CONFIG=/etc/shadowsocks-libev/kcptun.json \
KCPTUN_LOG=/var/log/kcptun-server.log \
KCP_LISTEN_PORT=9443 \
KCP_TARGET=127.0.0.1 \
KCP_TARGET_PORT=9999 \
KCP_KEY=MyPass \
KCP_CRYPT=aes \
KCP_MODE=fast3 \
KCP_CONN=2 \
KCP_AUTO_EXPIRE=0 \
KCP_MTU=1200 \
KCP_SNDWND=1024 \
KCP_RCVWND=1024 \
KCP_DATASHARD=10 \
KCP_PARITYSHARD=3 \
KCP_DSCP=46 \
KCP_NOCOMP=true \
KCP_SOCKBUF=16777216 \
#
SNOW_DL=https://github.com/keroserene/snowflake.git \
PRVIVOXY_DL=https://github.com/Fluke667/Privoxy-Silent.git \
PURPLEI2P_DL=https://github.com/PurpleI2P/i2pd.git \
SSLH_DL=https://github.com/yrutschle/sslh.git \
############### TOR Relay Enviroment
TOR_CONF=/etc/tor/torrc \
TOR_SOCKS=/etc/tor/torsocks \
TOR_USER=tord \
TOR_GROUP=tor \
TOR_NICK=MyNick \
TOR_EMAIL=multivpn@you-spam.com \
TOR_PASS=16:C5569C312E82682260814950CF077F5E6D055ABCE7686751E54B9BFD3B \
TOR_ADD=ServerTransportPlugin \
TOR_FTE=/usr/bin/fteproxy \
TOR_MEEK=/usr/bin/meek-server \
TOR_OBFS3=/usr/bin/obfsproxy \
TOR_OBFS4=/usr/bin/obfs4proxy \
TOR_SNOW=/usr/bin/webrtc \
TOR_OPT_FTE="--mode server --managed" \
TOR_OPT_MEEK="--port 7002 --cert $CRT_MEEK.pem --key $CRT_MEEK.key" \
TOR_OPT_OBFS3="managed" \
TOR_OPT_OBFS4="Custom" \
TOR_OPT_SNOW="-http 127.0.0.1:9090" \
TORSOCKS_CONF_FILE=/etc/tor/torsocks.conf \
TORSOCKS_USERNAME=MyUser \
TORSOCKS_PASSWORD=MyPass \
TORSOCKS_LOG_LEVEL=3 \
TORSOCKS_LOG_TIME=1 \
TORSOCKS_LOG_FILE_PATH=/var/log/tor/torsocks.log \
TORSOCKS_ALLOW_INBOUND=1 \
#TORSOCKS_ISOLATE_PID= \
############## I2PD
I2PD_DL=https://github.com/PurpleI2P/i2pd.git \
I2PD_HOME=/home/i2pd \
I2PD_DATA=/home/i2pd/data \
I2PD_CONF=/etc/i2pd/i2pd.conf \
I2PD_TUNCONF=/etc/i2pd/tunnels.conf \
I2PD_USER=i2pd \
I2PD_GROUP=i2pd \
I2PD_LOG=/var/log/i2pd/i2pd.log \
I2PD_PID=/run/i2pd/i2pd.pid \
I2PD_RESEED=true \
I2PD_UPNP=false \
I2PD_HTTP=true \
I2PD_HTTPADDR=0.0.0.0 \
I2PD_HTTPROXY=true \
I2PD_SOCKS=true \
I2PD_SOCKSADDR=0.0.0.0 \
I2PD_SAM=true \
I2PD_SAMADDR=0.0.0.0 \
############### Tinc
TINC_DL=https://www.tinc-vpn.org/packages/tinc-1.1pre17.tar.gz \
TINC_VER=1.1pre17 \
TINC_DIR=/etc/tinc \
TINC_CONF=/etc/tinc/tinc.conf \
TINC_LOG=/var/log/tinc/tinc.log \
TINC_DEBUG=5 \
TINC_NETNAME=TincNet \
TINC_NODE=Multivpn \
TINC_PRIV_IP=10.0.0.2 \
TINC_PUB_IP=0.0.0.0 \
TINC_INTERFACE=tun2 \
TINC_PEERS=host1.hostname.com \
TINC_COMPRESSION=5 \
############### sslh Enviroment
SSLH_LISTEN=0.0.0.0:443 \
SSLH_TLS=127.0.0.1:8443 \
SSLH_SSH=127.0.0.1:22 \
SSLH_OVPN=127.0.0.1:1194 \
SSLH_TINC=127.0.0.1:655 \
SSLH_SSOCKS=127.0.0.1:8388 \
############### Stunnel Enviroment
STUNNEL_CLIENT=no \
STUNNEL_CONF=/etc/stunnel/stunnel.conf \
STUNNEL_DEBUG=9 \
#STUNNEL_SNI="${STUNNEL_SNI:-}"
STUNNEL_CAFILE=/etc/certs/ca.crt \
STUNNEL_CERT=/etc/stunnel/stunnel.crt \
STUNNEL_KEY=/etc/stunnel/stunnel.key \
STUNNEL_VERIFY_CHAIN=no \
STUNNEL_DELAY=no \

STUNNEL_SERVICE1=openvpn \
STUNNEL_ACCEPT1=0.0.0.0:6600 \
STUNNEL_CONNECT1=0.0.0.0:1194 \

STUNNEL_SERVICE2=microsocks \
STUNNEL_ACCEPT2=0.0.0.0:6700 \
STUNNEL_CONNECT2=0.0.0.0:2080 \
############### Privoxy Enviroment
PRV_CONF=/etc/privoxy/config \
PRV_PID=/var/run/privoxy.pid \
#
PRV_SERVER=0.0.0.0 \
PRV_SERVER_PORT=8118 \
PRV_LOCAL=127.0.0.1 \
PRV_LOCAL_PORT=1080 \
PRV_PASS=MyPass \
PRV_METHOD=aes-256-gcm \
PRV_TIMEOUT=60 \
PRV_CONF=/etc/shadowsocks-libev/privoxy.json \
############### Peervpn
PEERVPN_NETWORKNAME=PEERVPN$RANDOM \
PEERVPN_PSK=PSK$RANDOM \
PEERVPN_INITPEERS="example.com 7000" \
PEERVPN_ENABLETUNNELING=yes \
PEERVPN_INTERFACE=peervpn0 \
PEERVPN_IFCONFIG4="172.16.254.$(expr $RANDOM % 256)/24" \
PEERVPN_IFCONFIG6="fe80::1034:56ff:fe78:$(expr $RANDOM % 10000)/64" \
PEERVPN_UPCMD="your init cmd here" \
PEERVPN_LOCAL=0.0.0.0 \
PEERVPN_PORT=7000 \
PEERVPN_ENABLEIPV4=yes \
PEERVPN_ENABLEIPV6=no \
PEERVPN_ENABLENDP=yes \
PEERVPN_ENABLERELAY=no \
############### Microsocks
MICRO_LISTEN=0.0.0.0 \
MICRO_PORT=2080 \
MICRO_USER=MyUser \
MICRO_PASS=MyPass \
MICRO_BINDADDR=0.0.0.0 \
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
NEXTCLOUD_PATH="/var/www/$HOST1_DN/nextcloud" \
NEXTCLOUD_CONF="/var/www/$HOST1_DN/nextcloud/config/config" \
NEXTCLOUD_DL=https://download.nextcloud.com/server/releases/latest \
NEXTCLOUD_DB_USER=nextcloud \
NEXTCLOUD_DB_PASS=nextpass \
NEXTCLOUD_DB_DATABASE=nextcloud \
NEXTCLOUD_DB_HOST=localhost \
NEXTCLOUD_DB_PORT=3306 \
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
    ###
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "https://alpine-repo.sourceforge.io/packages" >> /etc/apk/repositories && \
    echo "http://nginx.org/packages/alpine/v3.10/main" >> /etc/apk/repositories && \
    echo "http://nginx.org/packages/mainline/alpine/v3.10/main" >> /etc/apk/repositories



    
    #apk update && apk add --no-cache obfs4proxy meek simple-obfs

ONBUILD RUN \
    echo "$TZ" > /etc/timezone \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime
