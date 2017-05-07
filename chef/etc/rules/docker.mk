DOCKER_COMPOSE= docker-compose
DOCKER        = docker
MACHINENAME   = $(DIR)_$(NAME)
##############################################################################

# Docker tools

up: $(KEYS)
	$(DOCKER_COMPOSE) up

run:
	$(DOCKER_COMPOSE) run --rm $(NAME)

rm:
	$(DOCKER) ps -aq -f status=exited| xargs $(DOCKER) rm

stop:
	$(DOCKER) ps -aq -f status=running| xargs $(DOCKER) stop

ip:
	$(DOCKER) ps -q | xargs $(DOCKER) inspect --format '{{ .Name }}:{{ .NetworkSettings.IPAddress }}'| sed 's/^.//'

images:
	$(DOCKER) images

ls:
	$(DOCKER) ps -q| xargs $(DOCKER) inspect --format '{{ .Name }}'

ps:
	$(DOCKER) ps -a

fix:
	$(DOCKER) images -q --filter "dangling=true"| xargs $(DOCKER) rmi -f

rm-$(MACHINENAME):
	$(DOCKER) rm $(MACHINENAME)

exec-$(MACHINENAME):
	$(DOCKER) exec -it $(MACHINENAME) /bin/bash
rm-log:
	sudo rm -rf log

clean: rm-log stop rm

build: $(KEYS)
	$(DOCKER) build --no-cache -t $(MACHINENAME) .

rmi-$(MACHINENAME):
	docker rmi $(MACHINENAME):latest

unbuild: rm-keys rmi-$(MACHINENAME)
