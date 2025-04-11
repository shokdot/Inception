FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y redis && rm -rf /var/lib/apt/lists/*

COPY ./tools/run_redis.sh /
RUN chmod +x /run_redis.sh

EXPOSE 6379

CMD [ "/run_redis.sh" ]
