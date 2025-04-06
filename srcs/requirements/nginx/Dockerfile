FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install nginx -y && \
	apt install openssl && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/default.conf /etc/nginx/sites-available/

COPY ./tools/run_server.sh /

EXPOSE 443

RUN chmod +x run_server.sh

CMD [ "/run_server.sh" ]
