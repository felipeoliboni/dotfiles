# Docker

Cria containers para executar aplicações.

## Comandos básicos docker

- `docker run` - executa container
- `docker ps` - mostra containeres em execução
- `docker ps -a` - mostra todos os containeres
- `docker start/stop` - Start/Stop no container
- `docker restart` - reinicia o container
- `docker rename <old> <new>` - renomeia o container
- `docker rm -f $(docker ps -a -q)` - apaga todos containeres
- `docker rmi <image>` - apaga imagem
- `docker images` - mostra imagens locais
- `docker logs` - mostra logs do container
- `docker exec` - executa comando em container em execução
- `docker update` - atualiza hardware ex: docker update --memory 4g --cpus 2 <nome_do_container>
- `-d` - desvincula do terminal
- `-p` - porta_local:porta_no_container
- `-e` - variável de ambiente
- `-it` - modo interativo
- `--rm` - exclui container apos a execução
- `--name` - nomeia o container

## Docker Images

### Dockerfile - arquivo de configurações da imagem a ser criada

- `docker build` - dar build no Dockerfile
- `-t` - tag da imagem nome:versão
- `-f` - especifica arquivo, padrão Dockerfile
- `--no-cache` - flag para não usar o cache das camadas

- ex.:
- `docker build -t foliboni/nome:versão -f Dockerfile .` - onde o . é o contexto do build

Dockerfile guarda cache na ordem do arquivo. Se adicionar nova execução prévias as que já existem, o chache salva somente nos comandos anteriores.

- `FROM` - imagem base
- `RUN` - executa comando no bash durante a criação da imagem
- `WORKDIR` - define o diretório corrente
- `COPY` - copia arquivos ou diretórios (sempre no mesmo diretório)
- `ADD` - copia arquivos ou diretórios ou arquivos remotos
- `LABEL` - adiciona metadados à imagem chave=valor
- `ENV` - define variáveis de ambiente
- `VOLUME` - define volumes que devem ser definidos
- `ARG` - define um argumento para ser usado na construção da imagem, pode ser usado na execução do container com a flag `--build-arg ARG`
- `EXPOSE` - define que o container precisa expor a porta em questão
- `USER` - define o usuário que vai ser rodar o container
- `ENTRYPOINT` - comando de inicialização não sobrescrito
- `CMD` - define o comando e/ou parâmetros padrão

Boas práticas para construção de imagem

- Executar um processo por container (um para API, um para DB, etc.);
- Usar imagens confiáveis;
- Otimizar sempre a sua imagem, usar imagens prontas para o projeto;
- Sempre usar imagem versionada para garantir o comportamento;
- Sempre versionar a imagem criada;
- Usar imagens mais enxutas para criação (alpine);
- Uso inteligente das camadas, aproveitar do cache na criação;
- Dockerignore

Multistage Build

- Recurso para criar imagens de construção intermediárias e pegar os elementos construídos que realmente vão ser utilizados na imagem final
- [Exemplo Dockerfile multistage](https://github.com/felipeoliboni/notas/blob/main/exemplos/docker/app-multistage/Dockerfile.multistage)
- `--target=` - seta imagem específica do multistage
- `COPY --from=` - consegue setar outras imagens ja criadas para copia de arquivo

## Docker Volume

- Persistência de dados
- `--mount` ou `-v` - info que vai mapear
- `type=` - tipo do mapeamento do diretório
- `source=/` - diretório local
- `target=/app` - diretório no container
- `type=bind` - baixa segurança, arquivos ficam visíveis, não-protegido
- ex.:
- `docker run -d -p 8080:80 -v $(pwd):/usr/share/nginx/html nginx`

- `docker volume ls` - listar volumes
- `docker volume create` - criar volume
- `docker volume inspect` - inspecionar volumes
- `docker volume rm` - remover volume

- ex.:
- `docker run -it --mount type=volume,source=volume,target=/app ubuntu /bin/bash` - mantem o volume gerenciado

- visualizar mountpoint pelo docker inspect

### VOLUME no Dockerfile

- determina que é necessário um diretório para o volume
- `VOLUME` - mapeia no Dockerfile
- não salva para outros containers, útil para recuperar arquivos em caso de perda

### Fazer backup do Volume

- ex.:
- `docker run --volumes-from 1f1106af8107 --rm -v $(pwd)/backup:/backup ubuntu:22.04 tar cvf /backup/backup_vol.tar /app`  - seleciona os volumes, seta a pasta local e a pasta do container, comando tar com destino e origem

### Restaurar em novo volume

- ex.:
- `docker run -v $(pwd)/backup:/backup -v volume_novo:/app ubuntu:22.04 tar xvf /backup/backup_vol.tar`
- Depois basta mapear o volume no novo container

### tmpfs

- fica armazenado na RAM
- volume de alto desempenho
- perde as informações igual se nao tivesse setado volume
- `--mount type=tmpfs`

## Docker Network

### Componentes

- Sandbox: isolamento de rede (container)
- Interface virtual de rede

### Tipos de rede

- `--network` - setar a network
- `bridge` - vários containers na mesma rede
- `none` - sem rede
- `host` - rede da máquina local
- [Documentação libnetwork](https://github.com/moby/libnetwork)

### Comandos de rede

- `docker network ls` - listar redes do Docker
- `docker network connect` - conecta container na rede
- `docker network disconnect` - desconecta container na rede

- `--attachable`           Habilitar o anexo manual de contêineres
- `--aux-address map`      Endereços IPv4 ou IPv6 auxiliares usados pelo driver de rede (padrão `map[]`)
- `--config-from string`   A rede da qual copiar a configuração
- `--config-only`          Criar uma rede apenas de configuração
- `-d, --driver string`    Driver para gerenciar a rede (padrão "bridge")
- `--gateway strings`      Gateway IPv4 ou IPv6 para a sub-rede principal
- `--ingress`              Criar uma rede de roteamento de malha para Swarm
- `--internal`             Restringir o acesso externo à rede
- `--ip-range strings`     Alocar IP de contêiner a partir de uma sub-faixa
- `--ipam-driver string`   Driver de Gerenciamento de Endereço IP (padrão "default")
- `--ipam-opt map`         Definir opções específicas do driver IPAM (padrão `map[]`)
- `--ipv6`                 Habilitar ou desabilitar a rede IPv6
- `--label list`           Definir metadados em uma rede
- `-o, --opt map`          Definir opções específicas do driver (padrão `map[]`)
- `--scope string`         Controlar o escopo da rede
- `--subnet strings`       Sub-rede no formato CIDR que representa um segmento de rede

### Rede bridge

- Cria rede com especificações
- `docker network create` - criar rede (padrão bridge)

### Rede Host

- Trabalha direto com a interface de rede do host

### Rede none

- Utilização para isolamento total

### Adicionando domínios no container

- `--add-host` - adiciona host
- `/etc/hosts` - diretório para verificar hosts

## Docker Compose

- Cria o ambiente via .yaml
- Na V2 não precisa o version: no início
- Podemos fazer a build da imagem durante a execução do compose

### Comandos CLI

- `docker compose up` - sobre os containers
- `docker compose down` - desliga a stack
- `docker compose ps` - mostra somente containeres do compose
- `docker compose logs` - logs do compose / de container específico
- `docker compose exec` - executa comando no container
- `docker compose push` - envia as imagens do compose
- `docker compose pull` - baixa as imagens do compose
- `-f` - seta o yaml, padrao compose.yaml ou docker-compose.yaml
- `-d` - liberar terminal
- `--build` - para buildar a imagem com o compose
- `--remove-orphans` - remover containers nao declarados

### Múltiplos composes

- `extend` - seta o arquivo e o serviço a ser usado
- `merge` - combina arquivos de compose e sobreescreve informações - compose.override.yaml ou setando com `-f`
- `include` - inclui tudo de outro arquivo nesse compose

### Profiles

Setar diferentes perfis de execução (dev, homolog, prod, etc.)
Serviços só serão iniciados conforme o perfil
