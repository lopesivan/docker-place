# Worflow de trabalho

Sendo o arquivo "chef-solo.yml" que nomeia o
container como 'chef-solo', conforme mostrado
abaixo:

```
    container_name: chef-solo
```

A partir de agora todos os comandos serão uma
composição da *ação* seguida pelo *nome do
container*. Por exemplo, para buildar nossa imagem
usamos o seguinte comando:
```
"make build-chef-solo"
      ^^^^^ ^^^^^^^^^
      |     |
      ação  |
            `- nome do container definodo em "chef-solo.yml"
```

## <**key**> gera as chaves de conexão

Gera as chaves de conexão com o *chef-solo*,
*chef-server* e permite ssh com o container

```
    make key
```

## <**BUILD**> criação da imagem

```
    make build-chef-solo
```

## <**UP**> Subindo um container utilizando a imagem criada

```
    make build-chef-solo
```

## <**BUILD**> e <**UP**> de uma única vez...

```
    make build-chef-solo up-chef-solo
```

## <*rm*> Remove os containers que abortados *exit*

```
    make rm
```

## <*rmi*> Remove a imagem que foi construida com um *build* anterior

```
    make rmi-chef-solo
```

## <*rm*> e <*rmi*> de uma única vez...

```
    make rm rmi-chef-solo
```

## <*clean-key*> remove todas as chaves de conexão...

```
    make clean-key
```

## <*key*> cria as chaves de conexão par cada usuário e para o sistema

```
    make key
```

## <*clean-key*> e <*key*> renova as chaves do sistema

```
    make clean-key key
```
