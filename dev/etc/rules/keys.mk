clean-$(KEY):
	make -C $(SCRIPT) clean
$(KEY):
	make -C $(SCRIPT) create $(user)
	@for u in $(users); \
	do \
		make -C $(SCRIPT) create $$u; \
	done
	USER=$(user) make -C $(SCRIPT) roles

