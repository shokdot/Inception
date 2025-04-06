FROM debian:12

RUN apt update && apt upgrade -y

RUN <<EOF
apt install mariadb-server mariadb-client -y
apt clean &&
rm -rf /var/lib/apt/lists/*
EOF

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/run_db.sh /

WORKDIR /

RUN chmod +x /run_db.sh

CMD [ "/run_db.sh" ]
