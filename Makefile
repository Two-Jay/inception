include ./srcs/.env

VOLUME_DIR=/home/$(VM_LOGIN)/data
COMPOSE_DIR=./srcs/docker-compose.yml

all : up

up :
	sudo mkdir -p $(VOLUME_DIR)/mariadb
	sudo mkdir -p $(VOLUME_DIR)/wordpress
	docker-compose -f $(COMPOSE_DIR) up --build -d --remove-orphans

down :
	docker-compose -f $(COMPOSE_DIR) down

fclean : down
	sudo rm -rf $(VOLUME_DIR)/mariadb
	sudo rm -rf $(VOLUME_DIR)/wordpress

restart :
	docker-compose -f $(COMPOSE_DIR) restart

log db:
	docker logs --tail 50 --follow --timestamps mariadb

ps :
	docker-compose -f $(COMPOSE_DIR) ps

prune :
	docker system prune -a

re : fclean up