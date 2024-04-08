RED    := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)

help:
	@echo "Usage: make [COMMAND]\n"
	@echo "Commands:"
	@echo "  ${YELLOW}start${RESET}       Start the Docker containers"
	@echo "  ${YELLOW}stop${RESET}        Stop the Docker containers"
	@echo "  ${YELLOW}build${RESET}       Build the Docker images"
	@echo "  ${YELLOW}deploy${RESET}      Deploy to AWS"
	@echo "  ${YELLOW}test${RESET}        Run the test suite"
	@echo "  ${YELLOW}clean${RESET}       Remove all containers and volumes"
	@echo "  ${YELLOW}help${RESET}        Show this help message"

start:
	@echo "${GREEN}Starting Docker containers...${RESET}"
	docker-compose up -d

stop:
	@echo "${RED}Stopping Docker containers...${RESET}"
	docker-compose down

build:
	@echo "${GREEN}Building Docker images...${RESET}"
	docker-compose build

deploy:
	@echo "${YELLOW}Deploying to AWS... (script to be defined)${RESET}"
	# Deployment script goes here

test:
	@echo "${GREEN}Running tests... (commands to be defined)${RESET}"
	# Test command goes here

clean:
	@echo "${RED}Removing all containers and volumes...${RESET}"
	docker-compose down --rmi all --volumes

.PHONY: help start stop build deploy test clean
