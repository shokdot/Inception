FROM debian:buster

RUN apt update && apt upgrade -y && \
	apt install -y python3 python3-pip curl && \
	rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip

RUN pip3 install Flask

RUN mkdir -p /flask_app

COPY ./tools /flask_app

WORKDIR /flask_app

EXPOSE 3000

CMD ["python3", "main.py"]
