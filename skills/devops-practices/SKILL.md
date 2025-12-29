---
name: devops-practices
description: DevOps practices including CI/CD pipelines, monitoring, logging, deployment automation, infrastructure automation, and production operations.
sasmp_version: "1.3.0"
bonded_agent: 01-ai-ml-specialist
bond_type: PRIMARY_BOND
---

# DevOps Practices

Automate, monitor, and optimize production systems.

## CI/CD Pipeline Architecture

```
Code Push
    ↓
Build (Compile, package)
    ↓
Test (Unit, integration, E2E)
    ↓
Security Scan (SAST, dependency check)
    ↓
Deploy to Staging
    ↓
Smoke Tests
    ↓
Deploy to Production
    ↓
Monitoring & Alerts
```

## GitHub Actions CI/CD Example

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Run linter
        run: npm run lint

      - name: Run tests
        run: npm test -- --coverage

      - name: Upload coverage
        uses: codecov/codecov-action@v3

      - name: Build application
        run: npm run build

      - name: Build Docker image
        run: docker build -t myapp:${{ github.sha }} .

      - name: Push to container registry
        run: docker push myapp:${{ github.sha }}

  deploy:
    needs: build-and-test
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'

    steps:
      - name: Deploy to production
        run: |
          kubectl set image deployment/myapp \
            myapp=myapp:${{ github.sha }} \
            --namespace=production

      - name: Wait for rollout
        run: kubectl rollout status deployment/myapp -n production
```

## Monitoring & Observability

### Metrics Collection (Prometheus)
```yaml
# prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'api'
    static_configs:
      - targets: ['localhost:8000']

  - job_name: 'database'
    static_configs:
      - targets: ['localhost:9104']
```

### Alerting Rules
```yaml
groups:
  - name: application_alerts
    interval: 30s
    rules:
      - alert: HighErrorRate
        expr: rate(http_errors_total[5m]) > 0.05
        for: 5m
        annotations:
          summary: "High error rate detected"

      - alert: DatabaseDown
        expr: up{job="database"} == 0
        for: 1m
        annotations:
          summary: "Database is down"
```

### Logging (ELK Stack)
```json
{
  "timestamp": "2024-01-15T10:30:00Z",
  "level": "ERROR",
  "service": "api-server",
  "message": "Database connection failed",
  "error": "Connection timeout",
  "duration_ms": 5000,
  "user_id": "12345",
  "request_id": "req-789"
}
```

## Deployment Strategies

### Blue-Green Deployment
```
Current (Blue)  →  New (Green)
  v1.0                v1.1

  ↓ Healthy? Yes ↓

  Route traffic
  to Green
```

### Canary Deployment
```
100% → v1.0
  ↓
5% → v1.1 (canary)
  ↓
Monitor metrics
  ↓
25% → v1.1
  ↓
50% → v1.1
  ↓
100% → v1.1
```

### Rolling Deployment
```
Version: [v1.0, v1.0, v1.0, v1.0]
  ↓
        [v1.1, v1.0, v1.0, v1.0]
  ↓
        [v1.1, v1.1, v1.0, v1.0]
  ↓
        [v1.1, v1.1, v1.1, v1.0]
  ↓
        [v1.1, v1.1, v1.1, v1.1]
```

## Infrastructure Automation

### Ansible Playbook
```yaml
---
- hosts: web_servers
  become: yes
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Start nginx
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Copy application code
      synchronize:
        src: ./app
        dest: /var/www/app

    - name: Install dependencies
      pip:
        requirements: /var/www/app/requirements.txt
        virtualenv: /var/www/app/venv
```

## Health Checks & Graceful Shutdown

```python
# Flask example
from flask import Flask, jsonify
import signal
import sys

app = Flask(__name__)
shutdown_requested = False

@app.route('/health', methods=['GET'])
def health_check():
    if shutdown_requested:
        return jsonify({"status": "shutting_down"}), 503
    return jsonify({"status": "healthy"}), 200

@app.route('/ready', methods=['GET'])
def readiness_check():
    # Check if connected to database, etc.
    return jsonify({"ready": True}), 200

def handle_shutdown(signum, frame):
    global shutdown_requested
    shutdown_requested = True
    # Stop accepting new requests
    # Wait for ongoing requests to complete (max 30s)
    sys.exit(0)

signal.signal(signal.SIGTERM, handle_shutdown)
```

## Production Readiness Checklist

- [ ] Automated CI/CD pipeline
- [ ] Comprehensive test coverage (>80%)
- [ ] Code review process (PR requirements)
- [ ] Monitoring and alerting configured
- [ ] Logging system in place
- [ ] Backup and disaster recovery plan
- [ ] Security scanning (SAST, dependency check)
- [ ] Database migrations automated
- [ ] Rollback plan for deployments
- [ ] Cost monitoring and optimization
- [ ] Documentation up to date
- [ ] Incident response procedures

## Common DevOps Tools

| Category | Tools |
|----------|-------|
| **CI/CD** | GitHub Actions, GitLab CI, Jenkins, CircleCI |
| **Containerization** | Docker, Podman |
| **Orchestration** | Kubernetes, Docker Swarm |
| **IaC** | Terraform, CloudFormation, Ansible |
| **Monitoring** | Prometheus, Datadog, New Relic, Grafana |
| **Logging** | ELK Stack, Splunk, Loki |
| **Configuration** | Ansible, Puppet, Chef |

---

**DevOps culture reduces deployment friction and improves reliability. Invest in tooling!**
