---
name: backend-development
description: Backend development across multiple languages and frameworks including API design, authentication, error handling, middleware, and production-ready patterns.
sasmp_version: "1.3.0"
bonded_agent: 01-ai-ml-specialist
bond_type: PRIMARY_BOND
---

# Backend Development

Build robust, scalable server-side applications.

## Quick Start with Node.js/Express

```javascript
const express = require('express');
const app = express();

// Middleware
app.use(express.json());
app.use(errorHandler);

// Routes
app.get('/users/:id', async (req, res, next) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) return res.status(404).json({ error: 'Not found' });
    res.json(user);
  } catch (error) {
    next(error);
  }
});

// Error handling
function errorHandler(err, req, res, next) {
  console.error(err.stack);
  res.status(500).json({ error: 'Internal server error' });
}

app.listen(3000, () => console.log('Server running on :3000'));
```

## API Design Principles

### RESTful API Best Practices
```
✅ GET    /api/v1/users          - List all users
✅ POST   /api/v1/users          - Create new user
✅ GET    /api/v1/users/{id}     - Get specific user
✅ PUT    /api/v1/users/{id}     - Update entire user
✅ PATCH  /api/v1/users/{id}     - Partial update
✅ DELETE /api/v1/users/{id}     - Delete user
```

### HTTP Status Codes
- **200**: OK - Request successful
- **201**: Created - Resource created
- **204**: No Content - Success with no response body
- **400**: Bad Request - Client error
- **401**: Unauthorized - Authentication needed
- **403**: Forbidden - Access denied
- **404**: Not Found - Resource doesn't exist
- **500**: Internal Server Error - Server error

## Authentication & Security

### JWT Implementation
```javascript
// Generate token
const jwt = require('jsonwebtoken');
const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET, {
  expiresIn: '24h'
});

// Verify token
function authMiddleware(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'No token' });

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (error) {
    res.status(401).json({ error: 'Invalid token' });
  }
}
```

## Database Integration

### ORM Usage (Sequelize/TypeORM)
```javascript
// Define model
const User = sequelize.define('User', {
  id: { type: DataTypes.UUID, primaryKey: true },
  email: { type: DataTypes.STRING, unique: true, allowNull: false },
  password: { type: DataTypes.STRING, allowNull: false },
});

// Query
const user = await User.findByPk(userId);
const users = await User.findAll({ where: { active: true } });
```

## Error Handling Strategy

```javascript
// Custom error class
class AppError extends Error {
  constructor(message, statusCode) {
    super(message);
    this.statusCode = statusCode;
  }
}

// Usage
if (!user) {
  throw new AppError('User not found', 404);
}

// Centralized error handler
app.use((err, req, res, next) => {
  const { statusCode = 500, message } = err;
  res.status(statusCode).json({
    success: false,
    error: message,
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  });
});
```

## Caching Strategy

```javascript
const redis = require('redis');
const client = redis.createClient();

// Cache GET request
async function getCachedUser(id) {
  const cached = await client.get(`user:${id}`);
  if (cached) return JSON.parse(cached);

  const user = await User.findByPk(id);
  await client.set(`user:${id}`, JSON.stringify(user), 'EX', 3600);
  return user;
}

// Invalidate cache on update
app.post('/users/:id', async (req, res) => {
  const user = await User.update(req.body, { where: { id: req.params.id } });
  await client.del(`user:${req.params.id}`); // Invalidate cache
  res.json(user);
});
```

## Logging & Monitoring

```javascript
const logger = require('winston');

logger.info('User created', { userId, email });
logger.error('Database error', { error: err.message });

// Structured logging
const logRequest = (req, res, next) => {
  const start = Date.now();
  res.on('finish', () => {
    const duration = Date.now() - start;
    logger.info('API Request', {
      method: req.method,
      path: req.path,
      status: res.statusCode,
      duration
    });
  });
  next();
};
```

## Production Checklist

- [ ] Input validation (joi, zod, or similar)
- [ ] Rate limiting (express-rate-limit)
- [ ] CORS properly configured
- [ ] Environment variables for secrets
- [ ] Comprehensive logging
- [ ] Error handling middleware
- [ ] Database connection pooling
- [ ] Graceful shutdown handling
- [ ] Monitoring and alerting
- [ ] API documentation (Swagger/OpenAPI)

---

**Key: Prioritize security, reliability, and maintainability over rapid feature development.**
