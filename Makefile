.PHONY: bash build bundle help publish test version

GEM_NAME?=sidekiq-cron-web-admin
APP_NAME?=sidekiq-cron-web-admin

default: help

build: #: Build the containers that we'll need
	docker-compose build --pull

bash: #: Get a bash prompt on the core container
	docker-compose run --rm -e RACK_ENV=development $(APP_NAME) bash

test: build #: Run all tests
	docker-compose run --rm -e RACK_ENV=test $(APP_NAME) ./bin/test

test_bash: #: Get a bash prompt on the consumer container in test
	docker-compose run --rm -e RACK_ENV=test $(APP_NAME) bash

bundle: #: Install gems
	docker-compose run --rm $(APP_NAME) bundle install --with=rails_5_1 --with=unicorn

version: #: Get the current version number
	grep VERSION lib/$(GEM_NAME)/version.rb | sed "s/.*'\(.*\)'.*/\1/"

help: #: Show help topics
	@grep "#:" Makefile | grep -v "@grep" | sort | sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/$$(tput setaf 3)\1$$(tput sgr0)\2/g"
