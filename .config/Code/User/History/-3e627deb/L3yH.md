# Docker

## Comandos Básicos do Docker

### Containers

```bash
docker run                     # Executa um container
docker ps                      # Mostra containers em execução
docker ps -a                   # Mostra todos os containers
docker start <container>       # Inicia um container parado
docker stop <container>        # Para um container em execução
docker restart <container>     # Reinicia um container
docker rename <old> <new>      # Renomeia um container
docker rm -f $(docker ps -a -q) # Remove todos os containers
```

### Imagens

```bash
docker images                  # Mostra imagens locais
docker rmi <image>             # Remove uma imagem
docker build -t <tag> .        # Constrói uma imagem a partir do Dockerfile
```

### Logs e Execução

```bash
docker logs <container>        # Mostra logs de um container
docker exec -it <container> <command> # Executa um comando em um container em execução
docker update --memory 4g --cpus 2 <container> # Atualiza recursos do container
```

### Flags Comuns

```bash
-d                            # Desvincula do terminal
-p porta_local:porta_container # Mapeia portas entre host e container
-e                            # Define variáveis de ambiente
-it                           # Modo interativo
--rm                          # Exclui o container após a execução
--name <name>                 # Nomeia o container
```

## Dockerfile

- Dockerfile guarda cache na ordem do arquivo. Se adicionar nova execução prévias as que já existem, o cache salva somente nos comandos anteriores.

### Comandos Principais

```dockerfile
FROM <imagem_base>            # Define a imagem base
RUN <comando>                 # Executa comandos durante a criação da imagem
WORKDIR <diretório>           # Define o diretório de trabalho
COPY <origem> <destino>       # Copia arquivos locais para a imagem
ADD <origem> <destino>        # Similar ao COPY, mas suporta URLs
LABEL chave=valor             # Adiciona metadados à imagem
ENV <variável>=<valor>        # Define variáveis de ambiente
VOLUME <diretório>            # Define volumes
ARG <nome>                    # Define argumentos para build
EXPOSE <porta>                # Expõe uma porta
USER <usuário>                # Define o usuário para execução
ENTRYPOINT ["comando"]       # Define o comando inicial
CMD ["comando", "arg"]        # Define comandos e/ou argumentos padrão
```

### Boas Práticas

- Executar um processo por container (um para API, um para DB, etc.);
- Usar imagens confiáveis;
- Otimize sempre a sua imagem, usar imagens prontas para o projeto;
- Sempre use imagem versionada para garantir o comportamento;
- Sempre versionar a imagem criada;
- Usar imagens mais enxutas para criação, como `alpine`;
- Uso inteligente das camadas, aproveitar do cache na criação;
- Utilize um `.dockerignore`

### Multistage Build

- Recurso para criar imagens de construção intermediárias e pegar os elementos construídos que realmente vão ser utilizados na imagem final
- [Exemplo Dockerfile multistage](https://github.com/felipeoliboni/notas/blob/main/exemplos/docker/app-multistage/Dockerfile.multistage)
- `--target=` - seta imagem específica do multistage
- `COPY --from=` - consegue setar outras imagens ja criadas para copia de arquivo

```dockerfile
# Exemplo de multistage build
FROM golang:alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o app .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]
```

## Docker Volume

- determina que é necessário um diretório para o volume;
- `VOLUME` - mapeia no Dockerfile
- não salva para outros containers, útil para recuperar arquivos em caso de perda.

### Persistência de Dados

```bash
# Montar volume durante execução
-v $(pwd):/app               # Mapeia diretório local para o container
--mount type=bind,source=$(pwd),target=/app # Alternativa ao -v

# Gerenciar volumes
docker volume ls             # Lista volumes
docker volume create <nome>  # Cria um volume
docker volume inspect <nome> # Inspeciona um volume
docker volume rm <nome>      # Remove um volume
```

### Backup e Restauração de Volumes

```bash
# Fazer backup
sudo docker run --rm --volumes-from <container> -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /app

# Restaurar backup
sudo docker run --rm -v $(pwd):/backup -v <volume_novo>:/app ubuntu tar xvf /backup/backup.tar
```

### tmpfs

- fica armazenado na RAM;
- volume de alto desempenho;
- perde as informações igual se nao tivesse setado volume.

```bash
--mount type=tmpfs           # Armazena dados na RAM
```

## Docker Network

- [Documentação libnetwork](https://github.com/moby/libnetwork)

### Tipos de Rede

```bash
--network <tipo>             # Define o tipo de rede
bridge                       # Rede padrão para containers
none                         # Sem rede
host                         # Usa a rede do host
```

### Comandos de Rede

```bash
docker network ls            # Lista redes
docker network create <nome> # Cria uma nova rede
docker network connect       # Conecta um container à rede
docker network disconnect    # Desconecta um container da rede
```

### Rede bridge

- Cria rede com especificações

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

### Gerenciamento

```bash
docker compose up            # Inicia os containers do compose
docker compose down          # Para e remove os containers
docker compose ps            # Lista containers gerenciados pelo compose
docker compose logs          # Exibe logs
docker compose push          # Cria e envia as imagens com o --build
docker compose pull          # Baixa as imagens do compose
```

### Comandos Comuns

```bash
-f <arquivo>                # Define o arquivo de compose
-d                          # Executa em segundo plano
--build                     # Reconstrói as imagens durante o up
--remove-orphans            # Remove containers não declarados
```

### Múltiplos composes

- `extend` - seta o arquivo e o serviço a ser usado
- `merge` - combina arquivos de compose e sobreescreve informações - compose.override.yaml ou setando com `-f`
- `include` - inclui tudo de outro arquivo nesse compose

### Profiles

- Seta diferentes perfis de execução (dev, homolog, prod, etc.)
- Serviços só serão iniciados conforme o perfil

## Troubleshooting

```bash
docker info                  # Informações sobre o Docker
docker inspect <container>   # Inspeciona um container
docker logs --follow <container> # Acompanha logs em tempo real
docker stats                 # Monitora uso de recursos
docker top <container>       # Mostra processos do container
docker stats                 # Mostra utilização de recursos
```

## Resiliência e gerenciamento de recursos

```bash
- docker restart
- on-failure:<times> # reinicia o container SE foi encerrado com erro
- unless-stopped # só não reinicia se for parado manualmente
- always # reinicia sempre, mesmo que pare o Docker Daemon
```

### Healthcheck

```bash
- --health-cmd` - manda o comando para verificar ex.: `"curl -f http://localhost:3000/health"`
- --health-timeout <tempo>s` - tempo de demora máximo
- --health-retries <tentavivas>` - tentativas do health antes de dar erro
- --health-interval <intervalo>s` - período entre os testes
- --health-start-period` - tempo antes de começar os testes

- Docker compose - healthcheck

- Direto na imagem - HEALTHCHECK <par>
```

### Gerenciamento de Recurso

- Gerenciamento de CPU

```bash
- `--cpus` - quantas cpus vão ser utilizadas
- `--cpu-period` - tempo em ms de periodo
- `--cpu-quota` - tempo máximo
- `--cpuset-cpus` - seta as cpus
```

- Gerenciamento de memória

```bash
- `--memory` - seta o máximo de RAM
- `--memory-swap` - seta o máximo de swap
```

- Gerenciamento no Docker Compose

```bash
- `cpuset`
- `mem_limit`
- `deploy` - resources e limits de cpu e memória
```

## Segurança

- CVE - código de vulnerabilidade

### Docker Scout

```bash
docker scout quickview <imagem> # Verifica rapidamente vulnerabilidades
docker scout sves <imagem>      # Verifica as vulnerabilidades
docker scout recommendations <image> # Mostra as recomendações para a imagem
docker scout sbom <imagem>      # Lista pacotes na imagem
--format <list> <markdown>      # Exporta a lista das imagens 
```

#### Policies

- Conformidades que são necessárias

### Trivy

- Complemento ao Docker Scout
- cves, SMBOM, verifica sistema de arquivo, dados sensíveis, repositório Git, IaC, VM, Cluster K8S
- Tem gerenciamento de credenciais
- Integra com actions

```bash
trivy image <imagem>          # Escaneia vulnerabilidades da imagem
trivy config <dir>            # Verifica práticas recomendadas
trivy image --format spdx-json --output result.json <image> # SBOM
```

### Assinatura de Imagem com Cosign

```bash
cosign generate-key-pair      # Gera chaves para assinatura
cosign sign --key <chave> <imagem> # Assina a imagem
cosign verify --key <chave> <imagem> # Verifica a assinatura
```

## Docker in Docker

### docker.sock

- Cria um container e isola o processo;
- Compartilha o docker.sock com um container que pode comandar o Docker Daemon do host.

```bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock ubuntu /bin/bash # Exemplo de comando para executar e mapear o docker.sock

curl --unix-socket /var/run/docker.sock -X POST http://localhost/images/create?fromImage=postgres:latest # Exemplo usando o curl dentro do container pra postar e fazer o comando no daemon do host
```

### DinD

- ambiente 100% isolado, nao comunica com o daemon do host
- bom para ambientes sandbox

```bash
docker run -d --privieged docker:dind # Exempo de execução com o Docker in Docker
