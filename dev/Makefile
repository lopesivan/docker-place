WORKSPACE          = dev
user               = root
users              = chaves kiko chiquina
SOLO               = solo
MACHINENAME_CHEF   = chef-server
MACHINENAME_SOLO_1 = $(shell sed -n 's/.*container_name:\s*\([^:]*\)/\1/p' chef-solo.yml )
#MACHINENAME_SOLO_2 = chef-solo
CHEF_CONF_PATH     = ~/.chef
ETC                = etc

all: ps

include $(ETC)/rules/conf.mk
