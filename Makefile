SHELL := /bin/bash

tests:
	symfony console doctrine:fixtures:load -n
	symfony php bin/phpunit
.PHONY: tests

on:
	docker-compose up -d
	symfony server:start -d
	symfony open:local
.PHONY: on

off:
	docker-compose down
	symfony server:stop
.PHONY: off

status:
	symfony server:status
	docker ps
	symfony server:log
.PHONY: status

demons:
	symfony run -d yarn encore dev --watch
	symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async
	symfony server:status
.PHONY: demons