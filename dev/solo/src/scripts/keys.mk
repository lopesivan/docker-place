all: create-dir

create-dir:
	@test -d $(KEY_PATH) || mkdir $(KEY_PATH)
	@test -d $(DATABAG_PATH) || mkdir $(DATABAG_PATH)
	@test -d $(ROLES_PATH) || mkdir $(ROLES_PATH)

clean:
	rm -rf $(KEY_PATH)
	rm -rf $(ROLES_PATH)
	rm -rf $(DATABAG_PATH)

# make create root
create: create-dir data_bag pem
	@echo -ne '\e[1;49;92m[✓]\t\e[0m'
	@echo user:`tput bold` `tput setb 4` `tput setaf 7`"$(filter-out $@,$(MAKECMDGOALS))" `tput sgr0`
	@(cd $(KEY_PATH); name=$(filter-out $@,$(MAKECMDGOALS));   \
		test -e id_rsa_$${name} && rm id_rsa_$${name};         \
		test -e id_rsa_$${name}.pub && rm id_rsa_$${name}.pub; \
		ssh-keygen -q -t rsa -f id_rsa_$${name} -N "";         \
	)

rm-data_bag:
	@test -e $(KEY_PATH)/encrypted_data_bag_secret && rm $(KEY_PATH)/encrypted_data_bag_secret
new_data_bag: rm-data_bag data_bag
data_bag:
	@(cd $(ROLES_PATH); \
		bash $(SCRIPTS_PATH)/create_databag.sh $(KEY_PATH) \
	)

roles: superuser.json
	@echo ✓ `tput bold` `tput setb 4` `tput setaf 7` "$^"  `tput sgr0`
	@(cd $(ROLES_PATH);                                 \
		bash $(SCRIPTS_PATH)/roles.sh $(KEY_PATH) $(USER) $^ \
	)

pem:
	@(cd $(KEY_PATH); name=$@;                               \
		test -e id_rsa_$${name} -a -e id_rsa_$${name}.pub && \
		echo `tput setaf 1`+`tput sgr0`     \
		     `tput bold`                    \
		     `tput setb 4`                  \
		     `tput setaf 7`"pem key exist"  \
		     `tput sgr0` ||                 \
		ssh-keygen -q -t rsa -f id_rsa_$${name} -N "" \
	)
	@echo -ne '\e[1;49;92m[✓]\t\e[0m'
	@echo `tput bold` `tput setb 4` `tput setaf 7` "id_rsa_$@" `tput sgr0`
	@echo -ne '\e[1;49;92m[✓]\t\e[0m'
	@echo `tput bold` `tput setb 4` `tput setaf 7` "id_rsa_$@.pub" `tput sgr0`
