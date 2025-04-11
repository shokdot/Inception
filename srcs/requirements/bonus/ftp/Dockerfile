FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install vsftpd -y && rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/run_ftp.sh /

WORKDIR /

RUN chmod +x /run_ftp.sh

EXPOSE 21

CMD [ "/run_ftp.sh" ]
