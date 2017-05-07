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

