TEMPLATE = w
APP      = $(TEMPLATE)/v/app.py

FILES    = client.rb knife.rb solo.rb Dockerfile

all: configure

compile:
	@make -C $(TEMPLATE)/c
configure: compile
	@python $(APP) config.yml
	cp Dockerfile ..
clean:
	@make -C $(TEMPLATE)/c clean
	@rm $(FILES)

