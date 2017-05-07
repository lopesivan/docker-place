# Chef

Regras rapidas.

```
    make cookbooks
    make keys 
    # edite o roles/superuser.json e adiciono *id_rsa_root.pub*
    make build
```

## Build

Criamos nossa máquina usando o seguinte comando

```
make build
```

Caso queiramos remover a máquina, utilizamos o processo reverso
do *build* o unbuild

```
make unbuild
```

Podemos ter problemas na hora de compilar e gerar images deficitárias,
para tanto use o comando *fix*

```
make fix
```

E em caso de alteração de algum processo ou regra, para buildar novamente um
projeto já buildado, basta usar rebuild.

```
make rebuild
```

##Usando

ssh na máquina deployada

```
ssh -i src/keys/id_rsa_root root@172.17.0.28
```

Instalando uma receita em uma maquina deployada.

```
mkdir pasta && cd pasta
knife solo init .
rm Berksfile
cp -r ~/cookbooks/ .
knife solo cook -i id_rsa_root root@172.17.0.6
```

make cookbooks
make keys
make build

cookbooks-clean:
        rm -rf src/cookbooks

cookbooks: src/cookbooks
src/cookbooks: src/Berksfile
        (cd src && berks install && berks package)
        (cd src && tar xvzf cookbooks-*.tar.gz && rm cookbooks-*.tar.gz)
0
tmux display-message -p '#S'

tmux list-sessions -F '#{session_name} #{session_attached,yes,}'
ssh -i src/keys/id_rsa_root root@172.17.0.51
