FROM  alpine:3.10
LABEL maintainer="Fluke667 <Fluke667@gmail.com>"

RUN apk add --no-cache --no-progress tzdata wget

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
GOROOT=/usr/lib/go \
GOPATH=/go \
GO111MODULE=auto \
PATH=/go/bin:$PATH \
IP_ADDR=${IP} \
IP_NONROUTE=0.0.0.0 \
IP_LOCAL=127.0.0.1 \
SERVER_NAME=server \
CLIENT_NAME=client \
HOSTNAME=hostname \
COMMENT=## \
RNGD_FLAG=true \
DIR_TMP=/tmp \
SUFFIX=\033[0m \
COL_GREEN=\033[32m \
COL_RED=\033[31m \
COL_YEL=\033[0;33m \
INFO="${COL_GREEN}[INFO]${SUFFIX}" \
WARNING="${COL_YEL}[WARN]${SUFFIX}" \
ERROR="${COL_RED}[ERROR]${SUFFIX}" \
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
OVPN_EXTERNAL_PORT=1194 \
OVPN_PORTMAPPING=/etc/openvpn/portmapping \
OVPN_CERT_DIR=/etc/certs \
OVPN_CA_CRT=/etc/certs/ca.crt \
OVPN_SERVER_CRT=/etc/certs/server.crt \
OVPN_SERVER_KEY=/etc/certs/server.key \
OVPN_SERVER_DH=/etc/certs/dhparam2048.dh \
OVPN_TLSAUTH_KEY=/etc/certs/ta \
OVPN_CRL=$OVPN_DIR/crl/crl.pem \
OVPN_CCD=$OVPN_DIR/ccd \
OVPN_DEFROUTE=0 \
OVPN_CIPHER=AES-256-CBC \
OVPN_TLS_CIPHER=TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384:TLS-DHE-RSA-WITH-AES-256-CBC-SHA256 \
############### pproxy Enviroment
PPROXY_USER=Username \
PPROXY_PASS=Pass \
PPROXY_CRT=/etc/ssl/certs/cert.crt \
PPROXY_KEY=/etc/ssl/certs/key.key \
############### shadowsocks-libev (kcptun) Enviroment
SSLIBEV_PATH=/usr/bin/ \
SSLIBEV_CONFIG=/etc/shadowsocks-libev \
SS_SYSUSER=nobody \
SS_SERVER_ADDR=0.0.0.0 \
SS_SERVER_PORT=8388 \
SS_LOCAL_ADDR=127.0.0.1 \
SS_LOCAL_PORT=1080 \
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
CLOAK_DB_PATH=/etc/cloak/db \
CLOAK_VER=1.1.2 \
CLOAK_WEBSRVADDR=0.0.0.0:443 \
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
V2RAY_CRT=/etc/certs/v2ray.crt \
V2RAY_KEY=/etc/certs/v2ray.key \
#
OBFS_HTTP=server \
OBFS_TLS=server;tls;host=mydomain.me \
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
SSLIBEV_DL=https://github.com/shadowsocks/shadowsocks-libev.git \
MEEK_DL=git.torproject.org/pluggable-transports/meek.git/meek-server \
OBFS4_DL=git.torproject.org/pluggable-transports/obfs4.git/obfs4proxy \
SNOW_DL=https://github.com/keroserene/snowflake.git \
PRVIVOXY_DL=https://github.com/Fluke667/Privoxy-Silent.git \
PURPLEI2P_DL=https://github.com/PurpleI2P/i2pd.git \
SSLH_DL=https://github.com/yrutschle/sslh.git \
############### TOR Relay Enviroment
TOR_CONF=/etc/tor/torrc \
TOR_SOCKS=/etc/tor/torsocks \
TOR_USER=tor \
TOR_GROUP=tor \
TOR_NICK=MyNick \
TOR_EMAIL=My@email.com \
TOR_PASS=MyPass \
TORSOCKS_USER=MyUser \
TORSOCKS_PASS=MyPass \
TOR_ADD=ServerTransportPlugin \
TOR_FTE=/usr/bin/fteproxy \
TOR_MEEK=/usr/bin/meek-server \
TOR_OBFS3=/usr/bin/obfsproxy \
TOR_OBFS4=/usr/bin/obfs4proxy \
TOR_SNOW=/usr/bin/webrtc \
TOR_OPT_FTE="--mode server --managed" \
TOR_OPT_MEEK="--port 7002 --cert cert.pem --key key.pem" \
TOR_OPT_OBFS3="managed" \
TOR_OPT_OBFS4="Custom" \
TOR_OPT_SNOW="-http 127.0.0.1:9090" \
############### sslh Enviroment
SSLH=0.0.0.0:443 \
SSLH_HOST=127.0.0.1 \
SSLH_TLS=127.0.0.1:8443 \
SSLH_SSH=127.0.0.1:22 \
SSLH_OVPN=127.0.0.1:1194 \
SSLH_TINC=127.0.0.1:655 \
SSLH_SSOCKS=127.0.0.1:8388 \
############### Stunnel Enviroment
STUNNEL_CLIENT=no \
STUNNEL_SERVICE=openvpn \
STUNNEL_ACCEPT=0.0.0.0:4911 \
STUNNEL_CONNECT=server:1194 \
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
############### Golang Enviroment
#GOROOT=/usr/lib/go \
#GOPATH=/go \
#GOBIN=/go/bin \
#PATH=/go/bin:$PATH
#GOOS="$(go env GOOS)" \
#GOARCH="$(go env GOARCH)" \
#GOHOSTOS="$(go env GOHOSTOS)" \
#GOHOSTARCH="$(go env GOHOSTARCH)"
GOOS=linux \
GOARCH=amd64


RUN wget -P /etc/apk/keys https://alpine-repo.sourceforge.io/DDoSolitary@gmail.com-00000000.rsa.pub && \
    echo "https://alpine-repo.sourceforge.io/packages" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
    #apk update && apk add --no-cache obfs4proxy meek simple-obfs

ONBUILD RUN \
    echo "$TZ" > /etc/timezone \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime
