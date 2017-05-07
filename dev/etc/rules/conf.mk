SCRIPT = $(SOLO)/src/scripts
ENCRYPTED_DATA_BAG_SECRET = ${PWD}/$(SOLO)/src/keys/encrypted_data_bag_secret

# tools
DOCKER        = docker
DOCKER_COMPOSE= docker-compose
RUBY_VERSION  = 2.1.1
KEY           = key
COOKBOOKS     = cookbooks

include $(ETC)/rules/docker.mk
include $(ETC)/rules/ssh.mk
include $(ETC)/rules/cookbooks.mk
include $(ETC)/rules/keys.mk
include $(ETC)/rules/solo.mk
