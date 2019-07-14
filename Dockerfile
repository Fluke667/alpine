FROM  alpine:3.10
LABEL maintainer="Fluke667 <Fluke667@gmail.com>"

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
    #################
    GOROOT=/usr/lib/go \
GOPATH=/go \
PATH=/go/bin:$PATH \
IP_ADDR=RealIPAdress \       
INTERFACE=eth0 \
# Openssl Certificate Generate
CRT_COUNTY=DE \
CRT_STATE=Bavaria \
CRT_LOCATION=Nuremberg \
CRT_ORGANISATION=TB \
CRT_ROOT_CN=Root \
CRT_ISSUER_CN=Example \
CRT_PUBLIC_CN=*.example.com \
CRT_ROOT_NAME=root \
CRT_ISSUER_NAME=example \
CRT_PUBLIC_NAME=public \
CRT_RSA_KEY_NUMBITS=2048 \
CRT_DAYS=3650 \
CRT_KEYSTORE_NAME=Keystore \
CRT_KEYSTORE_PASS=changeit \
### ca crt
CRT_CERT_DIR=/etc/ssl/certs \
CRT_CA_DIR=$CRT_CERT_DIR/ca \
CRT_CERT_CA=$CRT_CA_DIR/ca.crt \
CRT_KEY_CA=$CRT_CA_DIR/ca.key \
CRT_SRL_CA=$CRT_CA_DIR/ca.srl \
#
CRT_ISSUER_EXT=/etc/ssl/issuer.ext \
CRT_PUBLIC_EXT=/etc/ssl/public.ext \
# Openssh Enviroment
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
# Openvpn Enviroment 
OVPN_DIR=/etc/openvpn \
OVPN_CONFIG=/etc/openvpn/server.conf \
OVPN_DH_KEY_SIZE=2048 \
OVPN_RSA_KEY_SIZE=2048 \
OVPN_DNS=1 \
OVPN_PROTOCOL=udp \
OVPN_EXTERNAL_PORT=1194 \
OVPN_CONFIG=$OVPN_DIR/server.conf \
OVPN_PORTMAPPING=$OVPN_DIR/portmapping \
OVPN_CERT_DIR=$OVPN_DIR/keys \
OVPN_CA_DIR=$OVPN_DIR/ca \
OVPN_CA_CRT=$OVPN_CA_DIR/ca.crt \
OVPN_CRL=$OVPN_DIR/crl/crl.pem \
OVPN_CCD=$OVPN_DIR/ccd \
OVPN_DEFROUTE=0 \
OVPN_CIPHER=AES-256-CBC \
OVPN_TLS_CIPHER=TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384:TLS-DHE-RSA-WITH-AES-256-CBC-SHA256 \
# Software Versions Enviroment
SS_LIBEV_VERSION=v3.2.5 \
KCP_VERSION=20190424 \
# pproxy Enviroment
PPROXY_USER=Username \
PPROXY_PASS=Pass \
PPROXY_CRT=/etc/ssl/certs/cert.crt \
PPROXY_KEY=/etc/ssl/certs/key.key \
# shadowsocks-libev (kcptun) Enviroment
SS_SERVER_ADDR=0.0.0.0 \
SS_SERVER_PORT=8388 \
SSPLUG_SERVER_PORT=8377 \
SSKCP_SERVER_PORT=8366 \
SS_PASSWORD=MyPass \
SS_METHOD=aes-256-gcm \
SS_TIMEOUT=300 \
SS_DNS=1.1.1.1,1.0.0.1 \
SS_MAXOPENFILES=1000 \
SS_OBFS=v2ray-plugin \
SS_PLUGIN=v2ray-plugin \
SS_PLUGIN_OPTS=server \
SS_ARGS= \
KCP_SERVER_ADDR=0.0.0.0 \
KCP_SERVER_PORT=9443 \
KCP_PASSWORD=MyPass \
KCP_MTU=1400 \
KCP_MODE=fast \
KCP_ENCRYPT=salsa20 \
KCP_SNDWND=1024 \
KCP_RCVWND=512 \
KCP_DATASHARD=10 \
KCP_PARITYSHARD=0 \
KCP_SOCKBUF=16777216 \
KCP_NOCOMP='' \
#KCP_NOCOMP=--nocomp \
#SS_DL=https://github.com/shadowsocks/shadowsocks-libev.git \
#KCP_DL=https://github.com/xtaci/kcptun/releases/download/v${KCP_VERSION}/kcptun-linux-amd64-${KCP_VERSION}.tar.gz \
PRVIVOXY_DL=https://github.com/Fluke667/Privoxy-Silent.git \
PURPLEI2P_DL=https://github.com/PurpleI2P/i2pd.git \
SSLH_DL=https://github.com/yrutschle/sslh.git \
#PLUGIN_OBFS_DL=https://github.com/shadowsocks/simple-obfs.git \
#PLUGIN_V2RAY_DL=https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.0/v2ray-plugin-linux-amd64-8cea1a3.tar.gz \
#PLUGIN_CLOAK_DL=https://github.com/cbeuw/cloak.git \
# TOR Relay Enviroment
TOR_USER=MyUser \
TOR_NICK=MyNick \
TOR_EMAIL=My@email.com \
TOR_PASS=MyPass \
TORSOCKS_USERNAME=MyUser \
TORSOCKS_PASSWORD=MyPass \
# sslh Enviroment
SSLH=0.0.0.0:443 \
SSLH_HOST=127.0.0.1 \
SSLH_TLS=127.0.0.1:8443 \
SSLH_SSH=127.0.0.1:22 \
SSLH_OVPN=127.0.0.1:1194 \
SSLH_TINC=127.0.0.1:655 \
SSLH_SSOCKS=127.0.0.1:8388 \
# Stunnel Enviroment
STUNNEL_CLIENT=no \
STUNNEL_SERVICE=openvpn \
STUNNEL_ACCEPT=0.0.0.0:4911 \
STUNNEL_CONNECT=server:1194 \
# Privoxy Enviroment
PRV_SERVER=0.0.0.0 \
PRV_SERVER_PORT=8118 \
PRV_LOCAL=127.0.0.1 \
PRV_LOCAL_PORT=1080 \
PRV_PASS=MyPass \
PRV_METHOD=aes-256-gcm \
PRV_TIMEOUT=60 \
PRV_CONF=/etc/shadowsocks-libev/privoxy.json



RUN apk add --no-cache --no-progress tzdata

ONBUILD RUN \
    echo "$TZ" > /etc/timezone \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime
