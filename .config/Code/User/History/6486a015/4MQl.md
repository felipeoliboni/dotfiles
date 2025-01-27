## Notas de estudo ferramentas DevOps

Repositório com notas e exemplos das ferramentas

### Git

Gerenciador de versões.

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

ex.:
- `docker build -t foliboni/nome:versão -f Dockerfile .` - onde o . é o contexto do build

- `FROM` - imagem base
- `RUN` - executa comando no bash durante a criação da imagem
- ``
- ``
- ``
- ``
