SHELL := /bin/bash

tests:
	symfony console doctrine:fixtures:load -n
	symfony php bin/phpunit
.PHONY: tests

on:
	docker-compose up -d
	symfony server:start -d
	symfony run -d yarn encore dev --watch
	symfony run -d symfony console messenger:consume async
	symfony open:local
.PHONY: on

off:
	docker-compose down
	symfony server:stop
.PHONY: off

status:
	docker ps
	symfony server:log
.PHONY: status