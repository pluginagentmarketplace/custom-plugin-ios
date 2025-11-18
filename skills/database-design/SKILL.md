---
name: database-design
description: Database design, optimization, and administration including SQL, schema design, indexing, query optimization, and production database management.
---

# Database Design & Optimization

Master data persistence, query optimization, and production-grade database administration.

## Quick Start: Schema Design

```sql
-- Good schema design follows normalization
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
  id UUID PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(500) NOT NULL,
  content TEXT,
  published BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_user_id (user_id),
  INDEX idx_published (published)
);
```

## Normalization Principles

| Form | Purpose | Example |
|------|---------|---------|
| **1NF** | Atomic values | No arrays/JSON in cells |
| **2NF** | Partial dependencies | Separate related data |
| **3NF** | Transitive dependencies | No derived data |

## Query Optimization

### Using EXPLAIN to analyze queries
```sql
EXPLAIN ANALYZE
SELECT p.title, u.name, COUNT(c.id) as comments
FROM posts p
JOIN users u ON p.user_id = u.id
LEFT JOIN comments c ON p.id = c.post_id
WHERE p.published = true AND p.created_at > NOW() - INTERVAL 7 DAY
GROUP BY p.id
ORDER BY comments DESC;
```

### Indexing Strategy
```sql
-- Single column index
CREATE INDEX idx_user_email ON users(email);

-- Composite index (order matters!)
CREATE INDEX idx_post_user_published ON posts(user_id, published);

-- Partial index (more efficient)
CREATE INDEX idx_published_posts ON posts(published) WHERE published = true;

-- Text search index
CREATE INDEX idx_post_title_search ON posts USING gin(to_tsvector('english', title));
```

## Common Patterns

### One-to-Many Relationship
```sql
CREATE TABLE authors (id UUID PRIMARY KEY, name VARCHAR(255));
CREATE TABLE books (
  id UUID PRIMARY KEY,
  author_id UUID NOT NULL REFERENCES authors(id),
  title VARCHAR(255)
);
```

### Many-to-Many Relationship
```sql
CREATE TABLE students (id UUID PRIMARY KEY, name VARCHAR(255));
CREATE TABLE courses (id UUID PRIMARY KEY, name VARCHAR(255));

CREATE TABLE enrollments (
  student_id UUID REFERENCES students(id) ON DELETE CASCADE,
  course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  enrolled_at TIMESTAMP,
  PRIMARY KEY (student_id, course_id)
);
```

## Performance Optimization

### Query Optimization Checklist
- [ ] Select only needed columns (not SELECT *)
- [ ] Use indexes on WHERE and JOIN columns
- [ ] Denormalize carefully for hot queries
- [ ] Use LIMIT to reduce result sets
- [ ] Avoid OR conditions (use IN instead)
- [ ] Use transactions for related operations

### Connection Pooling
```python
# SQLAlchemy with connection pooling
from sqlalchemy import create_engine

engine = create_engine(
  'postgresql://user:password@localhost/db',
  pool_size=10,  # Max 10 connections
  max_overflow=20  # Queue up to 20 more
)
```

## Backup & Disaster Recovery

```bash
# PostgreSQL backup
pg_dump -U postgres -d mydb > backup.sql

# Restore
psql -U postgres -d mydb < backup.sql

# Binary backup (faster)
pg_basebackup -D /path/to/backup -Ft -z -P
```

## Production Database Checklist

- [ ] Automated backups with testing
- [ ] Read replicas for scaling reads
- [ ] Monitoring (disk space, connections, slow queries)
- [ ] Connection pooling configured
- [ ] Query logging enabled
- [ ] Foreign keys enforced
- [ ] Indexes on all commonly queried fields
- [ ] Regular VACUUM/ANALYZE (PostgreSQL)

---

**Database performance directly impacts user experience. Optimize continuously!**
