
all: up

up:
	@echo "Making Up!"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@echo "Making Down!"
	@docker-compose -f ./srcs/docker-compose.yml down

start:
	@echo "Making Start!"
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@echo "Making Stop!"
	@docker-compose -f ./srcs/docker-compose.yml stop

clean: down
	@echo "Making clean"
	@docker system prune -a
	@rm -rf ~/data/mariadb/*
	@rm -rf ~/data/wordpress/*

fclean: stop
	@echo "Making fclean!"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume rm $(docker volume ls -q)
	@rm -rf ~/data/wordpress/*
	@rm -rf ~/data/mariadb/*

re: fclean all

.PHONY: all up down start stop clean fclean re
