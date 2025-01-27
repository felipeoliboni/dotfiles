# Principais Comandos e Dicas sobre Git

## Configuração Inicial
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seuemail@example.com"
git config --global init.defaultBranch main
```
- **user.name**: Define o nome do autor para os commits.
- **user.email**: Define o email associado ao autor.
- **init.defaultBranch**: Configura o branch principal como `main` ao inicializar repositórios.

## Fluxo Básico do Git

### Inicializar Repositório
```bash
git init
```
- Cria um novo repositório Git no diretório atual.

### Clonar Repositório
```bash
git clone <url-do-repositorio>
```
- Copia um repositório remoto para o local.

### Verificar Status
```bash
git status
```
- Mostra arquivos modificados, adicionados ou não rastreados.

### Adicionar Arquivos
```bash
git add <arquivo>
git add .
```
- Adiciona arquivos para o próximo commit.

### Fazer Commit
```bash
git commit -m "Mensagem do commit"
```
- Registra alterações no repositório com uma mensagem descritiva.

### Ver Histórico de Commits
```bash
git log
```
- Exibe os commits anteriores com detalhes.

## Trabalhando com Branches

### Criar e Mudar de Branch
```bash
git branch <nome-da-branch>
git checkout <nome-da-branch>
git switch <nome-da-branch> # Alternativa ao checkout
```
- Cria e troca para uma nova branch.

### Combinar Branches
```bash
git merge <nome-da-branch>
```
- Combina mudanças de outra branch na atual.

### Excluir Branch
```bash
git branch -d <nome-da-branch>
```
- Remove branch já mesclada.

## Sincronização com Repositório Remoto

### Adicionar Origem Remota
```bash
git remote add origin <url-do-repositorio>
```
- Conecta o repositório local a um remoto.

### Enviar Alterações
```bash
git push origin <branch>
```
- Envia commits para o repositório remoto.

### Buscar Alterações
```bash
git pull origin <branch>
```
- Atualiza o repositório local com mudanças remotas.

## Dicas e Truques

### Desfazer Alterações
- **Antes do git add:**
  ```bash
  git checkout -- <arquivo>
  ```
- **Depois do git add:**
  ```bash
  git reset <arquivo>
  ```
- **Após o commit:**
  ```bash
  git reset --soft HEAD~1
  ```

### Ignorar Arquivos
- Crie um arquivo `.gitignore` e liste os arquivos/padrões que deseja ignorar:
  ```
  # Exemplo de .gitignore
  node_modules/
  *.log
  .env
  ```

### Stash (Guardar Alterações Temporariamente)
```bash
git stash
```
- Salva modificações pendentes sem fazer commit.

### Ver Alterações
```bash
git diff
```
- Mostra diferenças entre o repositório e a área de staging.

### Renomear Commit Mais Recente
```bash
git commit --amend -m "Nova mensagem"
```
- Altera a mensagem do último commit.

---

Este guia cobre os comandos mais utilizados no Git. Para mais detalhes, consulte a [documentação oficial](https://git-scm.com/doc).
