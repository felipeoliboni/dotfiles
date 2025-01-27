# Principais Comandos e Dicas sobre Linux

## Gerenciamento de Arquivos e Diretórios

### Navegação
```bash
ls            # Lista arquivos no diretório
ls -l         # Lista em formato detalhado
ls -a         # Mostra arquivos ocultos
cd <diretório>  # Entra em um diretório
cd ..         # Volta um nível
pwd           # Mostra o caminho do diretório atual
```

### Manipulação de Arquivos e Diretórios
```bash
touch <arquivo>         # Cria um arquivo vazio
mkdir <diretório>       # Cria um diretório
rm <arquivo>            # Remove um arquivo
rm -r <diretório>       # Remove um diretório recursivamente
cp <origem> <destino>   # Copia arquivos ou diretórios
mv <origem> <destino>   # Move ou renomeia arquivos
```

## Gerenciamento de Permissões
```bash
chmod <permissão> <arquivo>     # Modifica permissões (ex: 755)
chown <usuário>:<grupo> <arquivo>  # Muda dono e grupo de um arquivo
```

### Ver Permissões
```bash
ls -l
```

## Processos

### Gerenciamento
```bash
ps aux           # Lista todos os processos em execução
kill <PID>       # Termina um processo pelo ID
killall <nome>   # Termina processos pelo nome
top              # Monitora processos em tempo real
htop             # Alternativa ao top (se instalado)
```

## Rede

### Verificar Conexão
```bash
ping <host>                # Testa conectividade com um host
curl <url>                 # Faz requisições HTTP
wget <url>                 # Baixa arquivos da web
```

### Configuração e Diagnóstico
```bash
ifconfig                  # Mostra configuração de rede
ip addr                   # Alternativa ao ifconfig
netstat -tuln             # Lista portas em uso
```

## Gerenciamento de Pacotes

### Distro Baseada em Debian (ex: Ubuntu)
```bash
apt update                # Atualiza a lista de pacotes
apt upgrade               # Atualiza os pacotes instalados
apt install <pacote>      # Instala um pacote
apt remove <pacote>       # Remove um pacote
apt autoremove            # Remove pacotes não utilizados
```

### Distro Baseada em Arch
```bash
pacman -Syu               # Atualiza o sistema
pacman -S <pacote>        # Instala um pacote
pacman -R <pacote>        # Remove um pacote
pacman -Rns <pacote>      # Remove um pacote e dependências
```

## Busca de Arquivos
```bash
find <diretório> -name <nome>  # Busca arquivos por nome
grep <texto> <arquivo>         # Procura texto dentro de arquivos
```

## Informações do Sistema
```bash
uname -a               # Mostra informações do kernel
cat /etc/os-release    # Exibe informações da distribuição
free -h                # Mostra uso de memória
uptime                 # Mostra tempo de atividade do sistema
```

## Shell Script Básico
```bash
#!/bin/bash
# Meu primeiro script

echo "Olá, mundo!"
```
- **Salvar:** `meuscript.sh`
- **Tornar executável:**
  ```bash
  chmod +x meuscript.sh
  ```
- **Executar:**
  ```bash
  ./meuscript.sh
  ```
