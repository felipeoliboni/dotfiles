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
- Otimizar sempre a sua imagem, usar imagens prontas para o projeto;
- Sempre usar imagem versionada para garantir o comportamento;
- Sempre versionar a imagem criada;
- Usar imagens mais enxutas para criação (alpine);
- Uso inteligente das camadas, aproveitar do cache na criação;
- Dockerignore

### Multistage Build
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
```bash
--mount type=tmpfs           # Armazena dados na RAM
```

## Docker Network

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

## Docker Compose

### Gerenciamento
```bash
docker compose up            # Inicia os containers do compose
docker compose down          # Para e remove os containers
docker compose ps            # Lista containers gerenciados pelo compose
docker compose logs          # Exibe logs
```

### Comandos Comuns
```bash
-f <arquivo>                # Define o arquivo de compose
-d                          # Executa em segundo plano
--build                     # Reconstrói as imagens durante o up
--remove-orphans            # Remove containers não declarados
```

## Troubleshooting
```bash
docker info                  # Informações sobre o Docker
docker inspect <container>   # Inspeciona um container
docker logs --follow <container> # Acompanha logs em tempo real
docker stats                 # Monitora uso de recursos
docker top <container>       # Mostra processos do container
```

## Segurança

### Docker Scout
```bash
docker scout quickview <imagem> # Verifica rapidamente vulnerabilidades
docker scout sbom <imagem>      # Lista pacotes na imagem
```

### Trivy
```bash
trivy image <imagem>          # Escaneia vulnerabilidades da imagem
trivy config <dir>            # Verifica práticas recomendadas
```

### Assinatura de Imagem com Cosign
```bash
cosign generate-key-pair      # Gera chaves para assinatura
cosign sign --key <chave> <imagem> # Assina a imagem
cosign verify --key <chave> <imagem> # Verifica a assinatura
```

---

## Minhas Notas
- Certifique-se de que os containers sejam criados com a menor permissão possível.
- Sempre teste localmente antes de subir imagens para um repositório público.
- O uso de `docker-compose.override.yml` pode facilitar ajustes em diferentes ambientes.
- Configure healthchecks para garantir que os containers estão operacionais.
