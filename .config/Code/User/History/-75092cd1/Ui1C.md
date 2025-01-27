# Kubernetes

## Comandos básicos do K8S

### Geral

```bash
kubectl version                   # Mostra a versão do cliente e do servidor
kubectl cluster-info              # Exibe informações sobre o cluster
kubectl get nodes                 # Lista todos os nós do cluster
kubectl describe node <nome>      # Mostra detalhes de um nó
kubectl config view               # Exibe o arquivo de configuração (kubeconfig)
kubectl config use-context <ctx>  # Troca o contexto atual
kubectl api-resources             # Lista todos objetos para criar e versão
```

### Pods

```bash
kubectl get pods                  # Lista todos os pods no namespace atual
kubectl get pods -n <namespace>   # Lista pods em um namespace específico
kubectl describe pod <nome>       # Detalhes de um pod específico
kubectl delete pod <nome>         # Deleta um pod
kubectl logs <pod>                # Exibe os logs de um pod
kubectl logs -f <pod>             # Acompanha logs em tempo real
kubectl exec -it <pod> -- <cmd>   # Executa um comando em um
```

### Deployments

```bash
kubectl get deployments           # Lista os deployments
kubectl describe deployment <nome> # Detalhes de um deployment
kubectl scale deployment <nome> --replicas=<número> # Escala réplicas
kubectl rollout status deployment <nome> # Status do rollout
kubectl rollout undo deployment <nome>   # Faz rollback para a versão anterior
kubectl delete deployment <nome>         # Remove um deployment
```

### Services

```bash
kubectl get svc                    # Lista os serviços (services)
kubectl describe svc <nome>        # Detalhes de um serviço
kubectl delete svc <nome>          # Remove um serviço
```

### Namespaces

```bash
kubectl get namespaces             # Lista namespaces
kubectl create namespace <nome>    # Cria um namespace
kubectl delete namespace <nome>    # Deleta um namespace
```

### Criação e Aplicação de Manifests

```bash
kubectl apply -f <arquivo.yaml>    # Aplica um arquivo de manifesto
kubectl delete -f <arquivo.yaml>   # Remove os recursos definidos no arquivo
kubectl edit -f <arquivo.yaml>     # Edita o manifesto diretamente
kubectl get -f <arquivo.yaml>      # Lista os recursos definidos no arquivo
```

### Inspeção e Debug

```bash
kubectl describe <recurso> <nome>  # Detalhes de um recurso
kubectl get events                 # Mostra eventos do cluster
kubectl top nodes                  # Exibe uso de recursos por nó
kubectl top pods                   # Exibe uso de recursos por pod
kubectl explain <recurso>          # Documentação sobre um recurso
```

### Gerenciamento de Configurações e Segredos

```bash
kubectl get configmaps             # Lista ConfigMaps
kubectl create configmap <nome> --from-literal=<chave>=<valor> # Cria um ConfigMap
kubectl delete configmap <nome>    # Remove um ConfigMap

kubectl get secrets                # Lista Secrets
kubectl create secret generic <nome> --from-literal=<chave>=<valor> # Cria um Secret
kubectl delete secret <nome>       # Remove um Secret
```

## Elementos básicos

### Pod

- Criado quando define no Kubernetes;
- Pode ter mais de um container sendo executado;
- Ideal 1 container por pod.

```bash
Especificações no yaml
apiVerson # Versão da API
kind      # Tipo do yaml
metadata  # 
spec      # 
```

### ReplicaSet

- Controlador acima do Pod
- Gerencia as réplicas dos pods

#### Labels

- Tags no deploy `<key>:<value>`

#### Selector

- Seleciona via os valores das labels

### Deployment

- Deployment atua acima do ReplicaSet
- Gerencia troca de versões
- Downtime zero

```Deploy -> ReplicaSet -> Pods```

### Rollout

```bash
kubectl rollout history <deploy> # Histórico de atuailzações
kubectl rollout undo <deploy> # Desfaz a atualização
```

### Service

- Ponto de comunicação com os pods

#### ClusterIP

- Expõe os pods internamente no cluster

#### Nodeport

- Expõe para fora do cluster

#### Loadbalancer

- Cria IP público e acessa o ClusterIP
- Só utilizado em Cloud Provider

#### External name

- Cria um serviço para acessar outro, dentro ou fora do cluster

### Endpoint - Endpoint Slice

```bash
kubectl get ep # Verifica endpoints do kubernetes
kubectl get endpointslice # Junta endpoints por array
```

### Configs

#### ConfigMap

- Objeto no cluster que armazena elementos `<key>:<value>`

```bash
kubectl create configmap <name> --from-literal=<key>=<value>