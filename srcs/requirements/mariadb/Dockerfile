FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install mariadb-server mariadb-client -y && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/run_db.sh /

WORKDIR /

RUN chmod +x /run_db.sh

CMD [ "/run_db.sh" ]
