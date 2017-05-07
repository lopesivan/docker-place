clean-$(COOKBOOKS):
	make -C src clean

$(COOKBOOKS): src/Berksfile
	make -C src install package

extract:
	make -C src extract
