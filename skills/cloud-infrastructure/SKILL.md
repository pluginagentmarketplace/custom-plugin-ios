---
name: cloud-infrastructure
description: Cloud infrastructure including containerization with Docker, orchestration with Kubernetes, cloud platforms (AWS, Azure, GCP), and infrastructure as code with Terraform.
sasmp_version: "1.3.0"
bonded_agent: 01-ai-ml-specialist
bond_type: PRIMARY_BOND
---

# Cloud Infrastructure

Deploy, scale, and manage applications across cloud platforms.

## Quick Start: Docker

```dockerfile
# Dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8000

CMD ["python", "app.py"]
```

```bash
# Build and run
docker build -t myapp:1.0 .
docker run -p 8000:8000 myapp:1.0
```

## Container Best Practices

```dockerfile
# ✅ Good: Multi-stage build
FROM python:3.11 as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.11-slim
COPY --from=builder /root/.local /root/.local
COPY . .
EXPOSE 8000
CMD ["python", "app.py"]
```

## Kubernetes Basics

### Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: myapp:1.0
        ports:
        - containerPort: 8000
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
```

### Service & Ingress
```yaml
# Service
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  type: LoadBalancer
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8000

---
# Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myapp-ingress
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: myapp-service
            port:
              number: 80
```

## Infrastructure as Code with Terraform

```hcl
# AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# EC2 instance
resource "aws_instance" "myapp" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "MyApp"
  }
}

# RDS database
resource "aws_db_instance" "mydb" {
  allocated_storage    = 20
  engine              = "postgres"
  engine_version      = "15.0"
  instance_class      = "db.t3.micro"
  username            = "admin"
  password            = var.db_password
  skip_final_snapshot = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

output "instance_ip" {
  value = aws_instance.myapp.public_ip
}
```

## AWS Core Services

| Service | Purpose | Use Case |
|---------|---------|----------|
| **EC2** | Virtual machines | Full app control |
| **ECS/EKS** | Container orchestration | Containerized apps |
| **Lambda** | Serverless compute | Event-driven, short tasks |
| **RDS** | Managed database | Reliable data storage |
| **S3** | Object storage | Files, static content |
| **CloudFront** | CDN | Fast content delivery |
| **ALB** | Load balancer | Distribute traffic |

## CI/CD Pipeline

```yaml
# GitHub Actions
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Build Docker image
        run: docker build -t myapp:${{ github.sha }} .

      - name: Push to registry
        run: docker push myapp:${{ github.sha }}

      - name: Update Kubernetes
        run: |
          kubectl set image deployment/myapp \
            myapp=myapp:${{ github.sha }}
```

## Production Checklist

- [ ] Auto-scaling configured
- [ ] Load balancing setup
- [ ] Database backups automated
- [ ] Monitoring and logging (CloudWatch, DataDog, New Relic)
- [ ] Security groups properly restricted
- [ ] SSL/TLS certificates configured
- [ ] CDN in front of static content
- [ ] Infrastructure as code (Terraform)
- [ ] Disaster recovery plan
- [ ] Cost monitoring and optimization

---

**Cloud infrastructure is the backbone of modern applications. Master it!**
