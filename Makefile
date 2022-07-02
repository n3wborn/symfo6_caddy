USER = $(shell whoami)
UID = $(shell id -u)
GID = $(shell id -g)
PWD = $(shell pwd)
COMPOSER = composer:2
EXEC_PHP = $(DOCKER_COMPOSE) exec -T php-fpm php

# use standalone container to avoid root owned vendor directory
.PHONY: install_back_deps
install_back_deps:
	docker run --rm -ti -v $(PWD):/app --user $(UID):$(GID) $(COMPOSER) composer install

.PHONY: update_back_deps
update_back_deps:
	docker run --rm -ti -v $(PWD):/app --user $(UID):$(GID) $(COMPOSER) composer update

.PHONY: docker_up
docker_up:
	docker-compose -f docker-compose.yml up --build

.PHONY: docker_up_caddy
docker_up_caddy:
	docker-compose -f docker-compose-caddy.yml up --build


