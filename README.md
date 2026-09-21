# 🚀 Projeto DevOps — Two-Tier Flask Application

Projeto desenvolvido para praticar conceitos de **DevOps, Cloud Computing e Infrastructure as Code (IaC)**, utilizando uma aplicação Flask com MySQL, containers Docker e infraestrutura provisionada com Terraform.

A infraestrutura AWS é simulada localmente utilizando **Floci**, permitindo praticar conceitos de cloud sem criar recursos reais na AWS.

---

## 🎯 Sobre o projeto

A aplicação possui dois componentes principais:

* **Flask** — aplicação web
* **MySQL** — banco de dados

A aplicação é executada utilizando **Docker Compose**, enquanto a infraestrutura é definida através de **Terraform**.

O projeto também utiliza o **Floci** para simular serviços da AWS localmente.

> ⚠️ Este projeto é um laboratório de DevOps. Os recursos AWS utilizados nos testes são simulados localmente através do Floci e não representam um ambiente de produção na AWS.

---

## 🏗️ Arquitetura

```text
                    ┌─────────────────┐
                    │     GitHub      │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    Terraform    │
                    │       IaC       │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │      Floci      │
                    │ Simulação AWS   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │       VPC       │
                    │   10.0.0.0/16   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Public Subnet  │
                    │   10.0.1.0/24   │
                    └────────┬────────┘
                             │
                    ┌────────┴────────┐
                    │                 │
                    ▼                 ▼
             ┌─────────────┐   ┌─────────────┐
             │     IGW     │   │ Route Table │
             └──────┬──────┘   └──────┬──────┘
                    │                 │
                    └────────┬────────┘
                             ▼
                    ┌─────────────────┐
                    │ Security Group  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │      EC2        │
                    │    t2.micro     │
                    └─────────────────┘
```

---

## 🛠️ Tecnologias utilizadas

### Aplicação

* Python
* Flask
* MySQL

### Containers

* Docker
* Docker Compose

### Cloud e Infraestrutura

* AWS
* Terraform
* AWS CLI
* Floci

### DevOps

* Infrastructure as Code
* Git
* GitHub
* CI/CD
* Automação de infraestrutura

---

## 🐳 Executando a aplicação

Clone o repositório:

```bash
git clone https://github.com/pdanilodev/DevOps-Project-Two-Tier-Flask-Application.git
```

Entre no projeto:

```bash
cd DevOps-Project-Two-Tier-Flask-Application
```

Inicie os containers:

```bash
docker compose up -d
```

Verifique os containers:

```bash
docker ps
```

A aplicação estará disponível em:

```text
http://localhost:5000
```

---

## ☁️ Infrastructure as Code

A infraestrutura é definida utilizando **Terraform**.

Os recursos atualmente configurados são:

* VPC
* Subnet pública
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2

Estrutura:

```text
terraform/
├── provider.tf
├── vpc.tf
├── subnet.tf
├── internet_gateway.tf
├── route_table.tf
├── security_group.tf
└── ec2.tf
```

Dessa forma, a infraestrutura pode ser definida, versionada e reproduzida através de código.

---

## 🧪 Floci

O **Floci** é utilizado neste projeto para simular recursos compatíveis com a AWS localmente.

O Terraform se comunica com o endpoint local:

```text
http://localhost:4566
```

Isso permite testar a criação e gerenciamento da infraestrutura sem precisar provisionar recursos reais na AWS.

---

## 🚀 Executando o Terraform

Entre na pasta:

```bash
cd terraform
```

Inicialize o Terraform:

```bash
terraform init
```

Formate os arquivos:

```bash
terraform fmt
```

Valide a configuração:

```bash
terraform validate
```

Visualize o plano:

```bash
terraform plan
```

Aplique a infraestrutura:

```bash
terraform apply
```

---

## 🔎 Verificando os recursos

Com o Floci em execução, é possível utilizar a AWS CLI para consultar os recursos criados.

Por exemplo:

```bash
aws ec2 describe-instances \
  --region us-east-1 \
  --endpoint-url http://localhost:4566
```

Para consultar as VPCs:

```bash
aws ec2 describe-vpcs \
  --region us-east-1 \
  --endpoint-url http://localhost:4566
```

---

## 📁 Estrutura do projeto

```text
DevOps-Project-Two-Tier-Flask-Application/
│
├── app.py
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
│
├── templates/
│   └── index.html
│
├── terraform/
│   ├── provider.tf
│   ├── vpc.tf
│   ├── subnet.tf
│   ├── internet_gateway.tf
│   ├── route_table.tf
│   ├── security_group.tf
│   └── ec2.tf
│
├── .gitignore
└── README.md
```

---

## 🔐 Segurança

Arquivos gerados pelo Terraform e possíveis arquivos com informações sensíveis não devem ser versionados.

O `.gitignore` inclui:

```gitignore
# Terraform
.terraform/
*.tfstate
*.tfstate.*
crash.log
*.tfvars
*.tfvars.json

# Ambiente
.env
.env.*
!.env.example
```

Os arquivos de configuração `.tf` permanecem no GitHub porque fazem parte da infraestrutura como código.

---

## 🚧 Próximos passos

### Concluído

* [x] Aplicação Flask
* [x] Banco de dados MySQL
* [x] Containerização com Docker
* [x] Docker Compose
* [x] Configuração do Terraform
* [x] Floci
* [x] VPC
* [x] Subnet pública
* [x] Internet Gateway
* [x] Route Table
* [x] Security Group
* [x] EC2

### Próximas etapas

* [ ] GitHub Actions
* [ ] `terraform fmt` automatizado
* [ ] `terraform validate`
* [ ] `terraform plan`
* [ ] Automação do `terraform apply`
* [ ] Pipeline de CI/CD
* [ ] Scan de segurança das imagens Docker
* [ ] Melhorias de observabilidade

---

## 📚 Conceitos praticados

Durante o desenvolvimento deste projeto, são praticados conceitos como:

* Infrastructure as Code
* Terraform
* AWS
* AWS CLI
* Docker
* Docker Compose
* Flask
* MySQL
* Git e GitHub
* CI/CD
* Automação de infraestrutura
* Redes na AWS
* Cloud Computing

---

## 👨‍💻 Autor

**Pablo Danilo**

Estudante de **Ciência da Computação**, com foco em **DevOps, Cloud Computing e Platform Engineering**.

* GitHub: [@pdanilodev](https://github.com/pdanilodev)
* LinkedIn: [linkedin.com/in/pdanilodev](https://www.linkedin.com/in/pdanilodev)

---

⭐ Projeto desenvolvido como parte do meu laboratório prático de DevOps.
