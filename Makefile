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
	symfony run -d symfony console messenger:consume async
	symfony server:status
.PHONY: demons


.PHONY: dbdump
dbdump:
	docker exec guestbook_database_1 pg_dump -Umain main > ./etc/data/$$(date '+%s').sql

.PHONY: dbimport
dbimport:
	docker exec -i guestbook_database_1 psql -Umain -dmain < $(file)