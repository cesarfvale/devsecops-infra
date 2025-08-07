# DevSecOps Lab com Terraform + Docker (Modular)

Ambiente completo para testes e aprendizado DevSecOps localmente, com provisionamento automatizado via Terraform e execução em containers Docker.

## 🚀 Ferramentas Provisionadas

| Ferramenta     | Finalidade                             | Porta Padrão |
|----------------|----------------------------------------|--------------|
| Jenkins        | CI/CD                                  | 8080         |
| GitLab         | Versionamento de código                | 8090         |
| SonarQube      | Análise estática de código             | 9000         |
| Nexus          | Repositório de artefatos               | 8081         |
| Vault          | Gestão de segredos (modo dev)          | 8200         |
| Prometheus     | Monitoramento                          | 9090         |
| Grafana        | Visualização de métricas               | 3000         |

## 📦 Requisitos

- Docker Desktop (Apple Silicon ou Intel)
- Terraform 1.5 ou superior
- Permissão para criação de containers

## 🔧 Como usar

1. **Clone o projeto:**

git clone https://github.com/cesarfvale/devsecops-infra.git
cd devsecops-infra

2. **Inicialize o Terraform:**

terraform init

3. **Aplique a infraestrutura:**

terraform apply

4. **Acesse os serviços:**

| Serviço    | URL de Acesso           |
| ---------- | ----------------------- |
| Jenkins    |  http://localhost:8080  |
| GitLab     |  http://localhost:8090  |
| SonarQube  |  http://localhost:9000  |
| Nexus      |  http://localhost:8081  |
| Vault      |  http://localhost:8200  |
| Prometheus |  http://localhost:9090  |
| Grafana    |  http://localhost:3000  |

5. **Estrutura do Projeto**

devsecops-lab/
├── main.tf
├── variables.tf
├── outputs.tf
├── prometheus/
│   └── prometheus.yml
├── data/
│   ├── grafana/
│   ├── gitlab/{config,logs,data}
│   ├── nexus/
│   └── sonarqube/{data,logs,extensions}
├── modules/
│   ├── jenkins/
│   ├── vault/
│   ├── prometheus/
│   ├── grafana/
│   ├── sonarqube/
│   ├── nexus/
│   └── gitlab/
└── README.md

6. **Limpar o ambiente**

terraform destroy

📌 Observações
O Vault está em modo de desenvolvimento (root token) — não use em produção!
Os volumes garantem persistência dos dados entre reinicializações dos containers.
Personalize variáveis como porta, nome e diretórios no uso dos módulos.