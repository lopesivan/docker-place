ssh:
	@$(DOCKER) ps -q \
	| xargs $(DOCKER) inspect --format '{{ .Name }}:{{ .NetworkSettings.IPAddress }}' \
	| sed 's/^.//' \
	| sed  's/\([^:]\+\):\([^:]\+\)/ssh -i $(SOLO)\/src\/keys\/id_rsa_$(user) $(user)@\2/' \
	| xclip -selection c

