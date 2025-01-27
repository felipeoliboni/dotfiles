## Notas de estudo ferramentas DevOps

Repositório com notas e exemplos das ferramentas

### Git

Gerenciador de versões.

- `git init` - inicializa diretório git
- `git checkout -b branch` - cria nova branch e muda para ela
- `git merge branch` - faz merge da branch para a ativa

Usar outras branches: sempre dar commit antes de mudar de branch para atualizar.



### Docker

Cria containers para executar aplicações.

#### Comandos básicos docker
- `docker run` - executa container
- `docker ps` - mostra containeres em execução
- `docker images` - mostra imagens locais
- `docker logs` - mostra logs do container
- `docker exec` - executa comando em container em execução
- `-d` - desvincula do terminal
- `-p` - porta_local:porta_no_container
- `-e` - variável de ambiente
- `-it` - modo interativo

#### Docker Images

Dockerfile - arquivo de configurações da imagem a ser criada.

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

Docker Volume

- Persistência de dados
- `--mount` ou `-v` - info que vai mapear
- `type=` - tipo do mapeamento do diretório
- `source=/` - diretório local
- `target=/app` - diretório no container

- `type=bind` - baixa segurança, arquivos ficam visíveis, não-protegido