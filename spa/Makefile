SHELL := /bin/bash

on:
	symfony server:start -d --passthru=index.html
	symfony open:local
.PHONY: on

off:
	symfony server:stop
.PHONY: off