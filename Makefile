
INTRA_USER=jekim

up :	
	sudo mkdir -p ~/inception/volumes/db
	sudo mkdir -p ~/inception/volumes/wp
	docker-compose up --build -d --remove-orphans

down :
	sudo rm -rf ~/inception/volumes/db
	sudo rm -rf ~/inception/volumes/wp
	docker-compose down

restart :
	docker-compose restart

log db:
	docker logs --tail 50 --follow --timestamps mariadb

ps :
	docker-compose ps