# Kubernetes

## Comandos básicos do K8S

```bash
kubectl version                   # Mostra a versão do cliente e do servidor
kubectl cluster-info              # Exibe informações sobre o cluster
kubectl get nodes                 # Lista todos os nós do cluster
kubectl describe node <nome>      # Mostra detalhes de um nó
kubectl config view               # Exibe o arquivo de configuração (kubeconfig)
kubectl config use-context <ctx>  # Troca o contexto atual
```

## Elementos básicos

### Pods

- Criado quando define no Kubernetes;
- Pode ter mais de um container sendo executado;
- 