---
name: system-architecture
description: System design and architecture including scalability patterns, distributed systems, API design, microservices, and production-grade system design.
sasmp_version: "1.3.0"
bonded_agent: 01-ai-ml-specialist
bond_type: PRIMARY_BOND
---

# System Architecture

Design scalable, resilient systems that power billions of users.

## Core Design Principles

### Scalability Patterns

**Vertical Scaling**: Add more resources (CPU, RAM)
- Simpler but limited by hardware
- Single point of failure

**Horizontal Scaling**: Add more machines
- Better for distributed systems
- Requires stateless design

```
Load Balancer
    ↓
  ┌─────┬─────┬─────┐
  ↓     ↓     ↓     ↓
Server Server Server Server
  ↓     ↓     ↓     ↓
  └─────┴──┬──┴─────┘
        ↓
    Database
```

### Caching Strategy

```
L1: Browser Cache (minutes to days)
  ↓
L2: CDN Cache (hours)
  ↓
L3: Application Cache (Redis/Memcached - minutes)
  ↓
L4: Database Query Cache (seconds)
  ↓
L5: Database (Persistent)
```

### Database Selection

| Type | Best For | Example |
|------|----------|---------|
| **Relational (SQL)** | Structured, ACID | PostgreSQL, MySQL |
| **NoSQL (Document)** | Flexible schema | MongoDB, CouchDB |
| **Key-Value** | Fast access | Redis, Memcached |
| **Time Series** | Metrics, logs | InfluxDB, Prometheus |
| **Search** | Full-text search | Elasticsearch |

## System Design Interview Pattern

### 1. Clarify Requirements
- Read: 1M users/day
- Write: 100K posts/day
- How many users online simultaneously?
- What are latency requirements?

### 2. High-Level Architecture
```
Clients
  ↓
Load Balancer
  ↓
API Servers (stateless)
  ↓
Cache (Redis)
  ↓
Database
  ↓
Object Storage (S3)
  ↓
Message Queue (Kafka)
  ↓
Analytics Service
```

### 3. Deep Dive Critical Component
- Database schema and indexing
- Caching strategy
- API rate limiting
- Data consistency approach

### 4. Bottleneck Analysis
- Can you scale database?
- Can you cache more?
- Need message queues for async processing?

## API Design Best Practices

### Versioning
```
✅ /api/v1/users
✅ /api/v2/users (breaking changes)
❌ /api/users?version=1
```

### Rate Limiting
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1635360000
```

### Pagination
```json
{
  "data": [...],
  "pagination": {
    "page": 1,
    "per_page": 20,
    "total": 1000,
    "total_pages": 50
  }
}
```

## Asynchronous Processing

### Message Queue Pattern
```
Request → Enqueue Job → Respond to User
              ↓
         Process Job
              ↓
         Update Results
```

```python
# Using Celery + Redis
from celery import Celery

app = Celery('tasks', broker='redis://localhost')

@app.task
def send_email(user_id):
    # Long-running task
    send_notification(user_id)

# Enqueue
send_email.delay(user_id)
```

## Consistency vs Availability

### CAP Theorem
You can guarantee 2 of 3:
- **Consistency**: All nodes see same data
- **Availability**: System always responds
- **Partition Tolerance**: System works despite network failures

Most systems choose AP (availability + partition tolerance) or CP (consistency + partition tolerance).

### Eventual Consistency
- Write to primary immediately
- Replicate to secondaries eventually
- Good for: social media, caching

### Strong Consistency
- Write waits for replicas
- Higher latency
- Good for: banking, critical data

## Production Architecture Checklist

- [ ] Load balancing across multiple servers
- [ ] Database replication (read replicas)
- [ ] Caching layer (Redis)
- [ ] CDN for static content
- [ ] Message queue for async jobs
- [ ] Monitoring and alerting
- [ ] Logging and tracing (ELK, Jaeger)
- [ ] Circuit breakers for resilience
- [ ] Rate limiting
- [ ] Database backups and recovery

---

**Good architecture enables rapid feature development. Invest in it early!**
