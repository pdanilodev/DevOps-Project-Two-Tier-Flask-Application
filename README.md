# 🚀 DevOps Two-Tier Flask Application

A two-tier web application built with **Flask + MySQL**, containerized with **Docker Compose** and provisioned using **Terraform**.

This project was developed as a **DevOps laboratory** to practice Infrastructure as Code (IaC), containerization, AWS infrastructure concepts, and automation.

> **Note:** AWS infrastructure is simulated locally using **Floci**. No production AWS resources are used in this project.

---

## 🏗️ Architecture

```text
                        ┌──────────────────┐
                        │      GitHub      │
                        └────────┬─────────┘
                                 │
                                 ▼
                        ┌──────────────────┐
                        │    Terraform     │
                        │       IaC        │
                        └────────┬─────────┘
                                 │
                                 ▼
                        ┌──────────────────┐
                        │      Floci       │
                        │ Local AWS Cloud  │
                        └────────┬─────────┘
                                 │
                         ┌───────▼────────┐
                         │      VPC        │
                         │  10.0.0.0/16   │
                         └───────┬────────┘
                                 │
                         ┌───────▼────────┐
                         │ Public Subnet  │
                         │  10.0.1.0/24   │
                         └───────┬────────┘
                                 │
                    ┌────────────┴────────────┐
                    │                         │
             ┌──────▼──────┐          ┌──────▼──────┐
             │     IGW     │          │    Route    │
             │             │          │    Table    │
             └─────────────┘          └─────────────┘
                    │
             ┌──────▼──────────┐
             │ Security Group  │
             └──────┬──────────┘
                    │
             ┌──────▼──────────┐
             │      EC2        │
             │   t2.micro      │
             └─────────────────┘
```

---

## 🎯 Project Overview

The application consists of two main services:

* **Flask** — web application/API
* **MySQL** — relational database

The application runs in containers using Docker Compose, while the infrastructure is defined declaratively with Terraform.

The project also uses Floci to simulate AWS services locally, allowing infrastructure concepts to be tested without creating real cloud resources.

---

## 🛠️ Technologies

### Application

* Python
* Flask
* MySQL

### Containers

* Docker
* Docker Compose

### Infrastructure

* Terraform
* AWS
* Floci
* AWS CLI

### DevOps

* Infrastructure as Code
* Git
* GitHub
* CI/CD
* Infrastructure automation

---

## ☁️ Infrastructure as Code

The infrastructure is managed using Terraform.

Current resources include:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2 Instance

Example Terraform structure:

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

This approach allows the infrastructure to be versioned, reviewed, and recreated using code instead of manually configuring resources.

---

## 🧪 Local AWS Environment

Instead of deploying directly to AWS, this project uses **Floci** to simulate AWS services locally.

Terraform communicates with the local AWS-compatible endpoint:

```text
http://localhost:4566
```

This makes it possible to practice AWS infrastructure provisioning while keeping the project local.

---

## 🐳 Running the Application

Clone the repository:

```bash
git clone https://github.com/pdanilodev/DevOps-Project-Two-Tier-Flask-Application.git
cd DevOps-Project-Two-Tier-Flask-Application
```

Start the application:

```bash
docker compose up -d
```

Check the running containers:

```bash
docker ps
```

The Flask application will be available at:

```text
http://localhost:5000
```

---

## 🏗️ Deploying the Infrastructure Locally

Make sure Floci is running on:

```text
http://localhost:4566
```

Then enter the Terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

Review the infrastructure plan:

```bash
terraform plan
```

Apply the infrastructure:

```bash
terraform apply
```

After confirmation, Terraform provisions the resources in the local Floci environment.

---

## 🔎 Checking the Infrastructure

The AWS CLI can be used to inspect the simulated infrastructure.

For example:

```bash
aws ec2 describe-instances \
  --region us-east-1 \
  --endpoint-url http://localhost:4566
```

You can also inspect the VPC:

```bash
aws ec2 describe-vpcs \
  --region us-east-1 \
  --endpoint-url http://localhost:4566
```

---

## 📸 Project Screenshots

Screenshots demonstrating the project can be added here.

### Application

![Flask Application](docs/screenshots/flask-app.png)

### Terraform

![Terraform Apply](docs/screenshots/terraform-apply.png)

### Infrastructure

![AWS CLI Infrastructure](docs/screenshots/aws-cli.png)

### Architecture

![Architecture](docs/screenshots/architecture.png)

---

## 📁 Project Structure

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
├── docs/
│   └── screenshots/
│
├── .gitignore
└── README.md
```

---

## 🔐 Security

Sensitive and generated Terraform files are intentionally excluded from version control.

```gitignore
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json
.env
.env.*
```

The repository contains the Terraform configuration files (`.tf`) but does not include Terraform's downloaded providers or state files.

---

## 🚧 Roadmap

The project is being developed incrementally as a DevOps laboratory.

### Completed

* [x] Flask application
* [x] MySQL database
* [x] Docker containerization
* [x] Docker Compose
* [x] Terraform configuration
* [x] Local AWS environment with Floci
* [x] VPC
* [x] Public Subnet
* [x] Internet Gateway
* [x] Route Table
* [x] Security Group
* [x] EC2 instance

### Next Steps

* [ ] Terraform automation with GitHub Actions
* [ ] Terraform format and validation workflow
* [ ] Terraform plan workflow
* [ ] Automated infrastructure deployment
* [ ] Container image security scanning
* [ ] Improve observability
* [ ] Expand CI/CD pipeline

---

## 📚 What I Practiced

This project focuses on practical DevOps concepts such as:

* Infrastructure as Code
* Terraform resource management
* AWS networking fundamentals
* Containerization
* Docker Compose
* Local cloud simulation
* AWS CLI
* Git and GitHub workflows
* CI/CD automation

The main goal is to understand how application code, containers, infrastructure, and automation can work together in a modern DevOps workflow.

---

## 👨‍💻 Author

**Pablo Danilo**

Computer Science student focused on **DevOps, Cloud Computing and Platform Engineering**.

* GitHub: [@pdanilodev](https://github.com/pdanilodev)
* LinkedIn: [linkedin.com/in/pdanilodev](https://www.linkedin.com/in/pdanilodev)

---

⭐ If you found this project useful, feel free to explore the repository and follow the development of the project.
