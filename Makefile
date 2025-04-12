COMPOSE_FILE	= srcs/docker-compose.yml

COMPOSE			= docker-compose -f $(COMPOSE_FILE)
MKDIR			= mkdir -p
RM				= rm -rf

DATA_DIR		= $(HOME)/data
DB_DIR			= $(DATA_DIR)/mariadb
WP_DIR			= $(DATA_DIR)/wordpress

all: up

up:
	@echo "Making Up!"
	@$(MKDIR) $(DB_DIR)
	@$(MKDIR) $(WP_DIR)
	@$(COMPOSE) up -d --build
	
down:
	@echo "Making Down!"
	@$(COMPOSE) down

clean: down
	@echo "Making clean"
	@docker system prune -af

fclean:
	@echo "Making fclean!"
	@$(COMPOSE) down --volumes --rmi all --remove-orphans > /dev/null 2>&1 || true
	@docker system prune -af > /dev/null 2>&1
	@docker network prune --force > /dev/null 2>&1
	@sudo $(RM) $(DATA_DIR)


re: fclean all

restart: down up

.PHONY: all up down clean fclean re restart
