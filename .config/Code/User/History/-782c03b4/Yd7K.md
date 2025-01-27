# Projeto micro-blog em docker

## Ferramentas utilizadas

- PostgreSQL - volume como persistência
- nodejs - Aplicação web
- Docker Network
- Dockerimage

## Passos

- Criação da imagem docker com o app - `docker build -t foliboni/kubenews:v1 .`
- Push no repositório do docker hub - `docker push foliboni/kubenews:v1`
- Criação da network tipo bridge - `docker network create kubenews_net`
- Criação do container com PostgreSQL - criar volume com `docker volume create`
- Criação do container com a Aplicação Web
