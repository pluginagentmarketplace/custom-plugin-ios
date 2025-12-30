---
name: ios-data
description: Master iOS data persistence - SwiftData, Core Data, Keychain, CloudKit
sasmp_version: "1.3.0"
version: "2.0.0"
bonded_agent: 04-data-persistence
bond_type: PRIMARY_BOND
last_updated: "2024-12"
---

# iOS Data Persistence Skill

> Store, sync, and secure data in iOS applications

## Learning Objectives

By completing this skill, you will:
- Implement data persistence with SwiftData (iOS 17+)
- Master Core Data for complex data models
- Secure sensitive data with Keychain
- Sync data across devices with CloudKit

## Prerequisites

| Requirement | Level |
|-------------|-------|
| iOS Fundamentals | Completed |
| Swift | Intermediate |

## Storage Decision Matrix

| Storage Type | Use Case | Encrypted | Synced |
|--------------|----------|-----------|--------|
| UserDefaults | Settings | No | Optional |
| File System | Documents | Optional | Optional |
| Keychain | Secrets | Yes | Optional |
| SwiftData | Structured data | No | Optional |
| Core Data | Complex models | No | Optional |
| CloudKit | Cross-device | Yes | Yes |

## Curriculum

### Module 1: UserDefaults & AppStorage (2 hours)

**Topics:**
- UserDefaults basics
- @AppStorage in SwiftUI
- App Groups for sharing

### Module 2: SwiftData (iOS 17+) (6 hours)

**Topics:**
- @Model macro
- ModelContext and @Query
- Relationships and migrations

### Module 3: Core Data (6 hours)

**Topics:**
- NSManagedObject
- NSFetchRequest
- Background contexts
- Migrations

### Module 4: Keychain (4 hours)

**Topics:**
- Keychain Services API
- Biometric access control
- Secure wrapper implementation

### Module 5: CloudKit (5 hours)

**Topics:**
- CKContainer and databases
- CKRecord operations
- Sync strategies

## Assessment Criteria

| Criteria | Weight |
|----------|--------|
| Storage selection | 20% |
| SwiftData/Core Data | 30% |
| Keychain security | 25% |
| CloudKit sync | 25% |

## Skill Validation

1. **Settings Manager**: UserDefaults with AppStorage
2. **Task App**: SwiftData with relationships
3. **Secure Vault**: Keychain with biometrics
4. **Syncing Notes**: CloudKit integration
