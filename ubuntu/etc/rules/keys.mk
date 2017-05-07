ID_RSA = $(shell bash -c "echo id_rsa_$(user){,.pub}")
KEYS   = $(ID_RSA) ca.crt

all: $(KEYS)

#
# Build SSL certificates for our example.com
#
BITS=3072

ca.crt: ca.cnf ca.key
	openssl req -new -x509 -days 36500 -config ca.cnf \
	            -extensions v3_ca -key ca.key -out $@

id_rsa_$(user) id_rsa_$(user).pub:
	ssh-keygen -q -t rsa -f id_rsa_$(user) -N ""\
	chmod 600 id_rsa_$(user)
	chmod 644 id_rsa_$(user).pub


ca.key:
	openssl genrsa -out $@ $(BITS)

rm-keys:
	rm $(KEYS) ca.key
