include ./srcs/.env

VOLUME_DIR=/home/$(VM_LOGIN)/data
COMPOSE_DIR=./srcs/docker-compose.yml

CONTAINER_NAME_DB=mariadb
CONTAINER_NAME_WORDPRESS=wordpress
CONTAINER_NAME_NGINX=nginx

all : up

up :
	sudo mkdir -p $(VOLUME_DIR)/mariadb
	sudo mkdir -p $(VOLUME_DIR)/wordpress
	sudo cp -rp ./srcs/hosts /etc/hosts
	sudo chmod 777 /etc/hosts
	docker-compose -f $(COMPOSE_DIR) up --build -d --remove-orphans

down :
	docker-compose -f $(COMPOSE_DIR) down

fclean : down
	sudo rm -rf $(VOLUME_DIR)/mariadb
	sudo rm -rf $(VOLUME_DIR)/wordpress

restart :
	docker-compose -f $(COMPOSE_DIR) restart

ps :
	docker-compose -f $(COMPOSE_DIR) ps

prune :
	docker system prune -a

re : fclean up

#######################################################

sh-db:
	docker exec -it $(CONTAINER_NAME_DB) /bin/bash

sh-wp:
	docker exec -it $(CONTAINER_NAME_WORDPRESS) /bin/bash

sh-ng:
	docker exec -it $(CONTAINER_NAME_NGINX) /bin/bash

log-db:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_DB)

log-wp:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_WORDPRESS)

log-ng:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_NGINX)
