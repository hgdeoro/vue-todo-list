.PHONY: help

help:
	@echo "See the sources"

docker-build:
	docker build -t vue-todo-list \
		$(BUILD_ARGS) \
		--build-arg USER_UID=$(shell id -u) \
		--build-arg USER_GID=$(shell id -g) \
		.

docker-cp-dist:
	docker run --rm -ti \
		--mount type=bind,source="$(shell pwd)/dist",target=/dist \
		vue-todo-list
