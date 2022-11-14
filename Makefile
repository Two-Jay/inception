include ./srcs/.env

VOLUME_DIR=${HOME}/data
COMPOSE_DIR=./srcs/docker-compose.yml

CONTAINER_NAME_DB=mariadb
CONTAINER_NAME_WORDPRESS=wordpress
CONTAINER_NAME_NGINX=nginx
CONTAINER_NAME_ADMINER=adminer

all : up

up :
	sudo date -s "$$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
	sudo mkdir -p ${HOME}/data/wordpress ${HOME}/data/mariadb
	docker-compose -f $(COMPOSE_DIR) up --build -d --remove-orphans
	sudo cp -rp ./srcs/nginx/config/hosts /etc/
	sudo chmod 777 /etc/hosts

down :
	docker-compose -f $(COMPOSE_DIR) down

re : fclean all

fclean :
	sudo rm -rf $(VOLUME_DIR)/mariadb
	sudo rm -rf $(VOLUME_DIR)/wordpress
	sudo docker stop $$(sudo docker ps -a -q)
	sudo docker rm $$(sudo docker ps -a -q)
	sudo docker rmi -f $$(sudo docker images -q)
	sudo docker volume rm srcs_$(CONTAINER_NAME_DB)
	sudo docker volume rm srcs_$(CONTAINER_NAME_WORDPRESS)
	sudo docker system prune -f
	sudo rm -rf ${HOME}/data /etc/hosts

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

sh-ad:
	docker exec -it $(CONTAINER_NAME_ADMINER) /bin/bash

log-db:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_DB)

log-wp:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_WORDPRESS)

log-ng:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_NGINX)

log-ad:
	docker logs --tail 50 --follow --timestamps $(CONTAINER_NAME_ADMINER)