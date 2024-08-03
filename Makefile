
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := build

GORUN=go run
GOBUILD=go build
GOCLEAN=go clean
GOTEST=go test
GOGET=go get

DOCKER_EXEC=docker exec

.PHONY: clean
clean: ## clean build files.
	@sudo rm ./build/*

.PHONY: build
build: ## build go files.
	@docker run -it \
	--rm -v ./:/src \
	-w /src \
	-e GOPATH=/ \
	tinygo/tinygo tinygo build -target=hifive1b -o ./build/sample.hex ./src/sample

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@awk 'BEGIN {FS = ":.*#"} /^[a-zA-Z_-]+:.*?#/ {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

%:
	@echo 'command "$@" is not found.'
	@$(MAKE) help
	@exit 2