MACHINE_IMAGE_SOLO_1 = $(WORKSPACE)_$(SOLO)

#version-$(MACHINENAME_CHEF)-at-$(MACHINENAME_SOLO_1):
#	$(DOCKER) exec -it $(MACHINENAME_SOLO_1) curl -k https://chef/version

#### SOLO 1 ####
up-$(MACHINENAME_SOLO_1):
	$(DOCKER_COMPOSE) -f chef-solo.yml up

# execute in container
exec-$(MACHINENAME_SOLO_1):
	$(DOCKER) exec -it $(MACHINENAME_SOLO_1) /bin/bash
configura-$(MACHINENAME_SOLO_1):
	$(DOCKER) exec -it $(MACHINENAME_SOLO_1) /usr/local/bin/chef-initialize.sh
run-$(MACHINENAME_SOLO_1):
	$(DOCKER) exec -it $(MACHINENAME_SOLO_1) /usr/bin/chef-solo

# remove container
rm-$(MACHINENAME_SOLO_1):
	$(DOCKER) rm $(MACHINENAME_SOLO_1)

# auto remove container
run-rm-$(MACHINENAME_SOLO_1):
	$(DOCKER_COMPOSE) -f chef-solo.yml run --rm solo

# remove image
rmi-$(MACHINENAME_SOLO_1):
	$(DOCKER) rmi $(MACHINE_IMAGE_SOLO_1)

configure-$(MACHINENAME_SOLO_1):
	make -C $(SOLO)/src
# build image
build-$(MACHINENAME_SOLO_1): key configure-$(MACHINENAME_SOLO_1)
	$(DOCKER_COMPOSE) -f chef-solo.yml build --no-cache

# unbuild image
unbuild-$(MACHINENAME_SOLO_1): clean-key rmi-$(MACHINENAME_SOLO_1)
	make -C $(SOLO)/src clean
