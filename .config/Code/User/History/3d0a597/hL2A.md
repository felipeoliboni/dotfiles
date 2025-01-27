# Craftisa

## Micro Service 01 - Frontend

**Language**: Node.js  

**Framework**: Express.js  

## Micro Service 02 - Catalogue

**Language:** Python  

**Framework:** Flask

## Micro Service 03 - Voting

- Sprint boot (Java)

### Backing Service 02 : voting-db

Phase 1 : H2  
Phase 2 : PostgreSQL  

## Micro Service 04 - Recommendation

**Language:** Golang  

---

## To-do list

  - [x] 1. Containerize with Docker: Write Dockerfiles for each of the services, and a docker compose to run it as a micro services application stack to automate dev environments.  
  - [ ] Build CI Pipeline : Build a complete CI Pipeline using Jenkins, GitHub Actions, Azure Devops etc.  
  - [ ] Deploy to Kubernetes : Write kubernetes manifests to create Deployments, Services, PVCs, ConfigMaps, Statefulsets and more  
  - [ ] Package with Helm : Write helm charts to templatize the kubernetes manifests and prepare to deploy in different environments  
  - [ ] Blue/Green and Canary Releases with ArgoCD/GitOps: Setup releases strategies with Argo Rollouts Combined with ArgoCD and integrate with CI Pipeline created in 3. to setup a complete CI/CD workflow.  
  - [ ] Setup Observability : Setup monitoring with Prometheus and Grafana (Integrate this for automated CD with rollbacks using Argo), Setup log management with ELS/EFK Stack or Splunk.
  - [ ] Build a DevSecOps Pipeline: Create a DevSecOps Pipeline by adding SCA, SAST, Image Scanning, DAST, Compliance Scans, Kubernetes Scans etc. and more at each stage.
  - [ ] Design and Build Cloud Infra : Build Scalable, Hight Available, Resilience, Fault Tolerance Cloud Infra to host this app.
  - [ ] Write Terraform Templating : Automate the infra designed in project 8. Use Terragrunt on top for multi environment configurations.  
  - [ ] Python Scripts for Automation : Automate ad-hoc tasks using python scripts.

#### Next level

  - [ ] Deploy on EKS/AKS: Build EKS/AKS Cluster and deploy this app with helm packages you created earlier.
  - [ ] Implement Service Mesh: Setup advanced observability, traffic management and shaping, mutual TLS, client retries and more with Istio.
  - [ ] AIOps: On top of Observability, incorporate Machine Learning models, Falco and Argo Workflow for automated monitoring, incident response and mitigation.
  - [ ] SRE: Implement SLIs, SLOs, SLAs on top of the project 6 and setup Site Reliability Engineering practices.  
  - [ ] Chaos Engineering : Use LitmusChaos to test resilience of your infra built on Cloud with Kubernetes and Istio.


