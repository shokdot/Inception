FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install mariadb-server mariadb-client -y && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/run_db.sh /

WORKDIR /

RUN chmod +x /run_db.sh

CMD [ "/run_db.sh" ]
