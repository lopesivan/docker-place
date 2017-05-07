ssh:
	@$(DOCKER) ps -q \
	| xargs $(DOCKER) inspect --format '{{ .Name }}:{{ .NetworkSettings.IPAddress }}' \
	| sed 's/^.//' \
	| sed  's/\([^:]\+\):\([^:]\+\)/ssh -i id_rsa_root root@\2/' \
	| xclip -selection c

