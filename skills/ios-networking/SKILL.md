---
name: ios-networking
description: Master iOS networking - URLSession, async/await, REST APIs, authentication
sasmp_version: "1.3.0"
version: "2.0.0"
bonded_agent: 05-networking-apis
bond_type: PRIMARY_BOND
last_updated: "2024-12"
---

# iOS Networking Skill

> Build robust network layers for iOS applications

## Learning Objectives

By completing this skill, you will:
- Master URLSession with async/await
- Implement type-safe API clients
- Handle authentication flows (OAuth, JWT)
- Build offline-first applications

## Prerequisites

| Requirement | Level |
|-------------|-------|
| iOS Fundamentals | Completed |
| Swift | Intermediate |
| async/await | Basic |

## Curriculum

### Module 1: URLSession Fundamentals (4 hours)

**Topics:**
- URLSession configuration
- URLRequest building
- Response handling
- Error management

**Code Example:**
```swift
func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T {
    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.invalidResponse
    }

    return try JSONDecoder().decode(T.self, from: data)
}
```

### Module 2: API Client Architecture (5 hours)

**Topics:**
- Endpoint abstraction
- Request/response interceptors
- Retry logic with exponential backoff
- Request deduplication

### Module 3: Codable & JSON (3 hours)

**Topics:**
- Custom encoding/decoding
- Date format handling
- Nested JSON parsing
- Error handling

### Module 4: Authentication (5 hours)

**Topics:**
- OAuth 2.0 flow
- JWT handling
- Token refresh logic
- Secure token storage

### Module 5: Offline Support (4 hours)

**Topics:**
- Response caching
- Request queuing
- Sync strategies
- Conflict resolution

### Module 6: Testing Network Code (3 hours)

**Topics:**
- Mock URLProtocol
- Stub responses
- Network condition testing

## Assessment Criteria

| Criteria | Weight |
|----------|--------|
| API client design | 30% |
| Error handling | 25% |
| Authentication | 25% |
| Testing | 20% |

## Common Mistakes

1. **Force unwrapping responses** → Use proper error handling
2. **Ignoring cancellation** → Respect Task cancellation
3. **Hardcoded URLs** → Use configuration
4. **Missing retry logic** → Implement exponential backoff

## Skill Validation

1. **REST Client**: Type-safe API client with Codable
2. **Auth Flow**: OAuth 2.0 with token refresh
3. **Offline App**: Cached data with sync
4. **Test Suite**: 80% network code coverage
