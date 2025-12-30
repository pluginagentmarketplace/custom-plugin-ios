---
name: ios-testing
description: Master iOS testing - XCTest, UI testing, mocking, debugging, performance
sasmp_version: "1.3.0"
version: "2.0.0"
bonded_agent: 06-testing-debugging
bond_type: PRIMARY_BOND
last_updated: "2024-12"
---

# iOS Testing Skill

> Build reliable iOS apps with comprehensive testing

## Learning Objectives

By completing this skill, you will:
- Write effective unit tests with XCTest
- Create reliable UI tests
- Implement proper mocking strategies
- Debug efficiently with Instruments
- Achieve high code coverage

## Prerequisites

| Requirement | Level |
|-------------|-------|
| iOS Fundamentals | Completed |
| Swift | Intermediate |
| MVVM pattern | Basic |

## Curriculum

### Module 1: XCTest Fundamentals (4 hours)

**Topics:**
- XCTestCase structure
- Assertions library
- Test lifecycle (setUp/tearDown)
- Async testing

**Code Example:**
```swift
final class UserViewModelTests: XCTestCase {
    private var sut: UserViewModel!
    private var mockService: MockUserService!

    override func setUp() {
        super.setUp()
        mockService = MockUserService()
        sut = UserViewModel(service: mockService)
    }

    func test_loadUser_success() async {
        mockService.result = .success(.mock())

        await sut.loadUser(id: "123")

        XCTAssertNotNil(sut.user)
        XCTAssertFalse(sut.isLoading)
    }
}
```

### Module 2: Mocking & Test Doubles (4 hours)

**Topics:**
- Protocol-based mocking
- Spy, stub, fake patterns
- Dependency injection for testing
- Fixtures and factories

### Module 3: UI Testing (5 hours)

**Topics:**
- XCUIApplication setup
- Element queries
- Accessibility identifiers
- Page Object pattern
- Handling flaky tests

### Module 4: Debugging (4 hours)

**Topics:**
- LLDB commands
- Breakpoints (symbolic, conditional)
- View Debugger
- Memory Graph Debugger

### Module 5: Performance Testing (3 hours)

**Topics:**
- XCTMetric usage
- Time Profiler
- Allocations instrument
- Leaks detection

### Module 6: CI Integration (3 hours)

**Topics:**
- Xcode Cloud setup
- GitHub Actions
- Code coverage reports
- Test parallelization

## Assessment Criteria

| Criteria | Weight |
|----------|--------|
| Unit test quality | 30% |
| Mock implementation | 20% |
| UI test reliability | 25% |
| Debugging skills | 15% |
| CI integration | 10% |

## Coverage Targets

| Component | Target |
|-----------|--------|
| ViewModels | 90%+ |
| Services | 85%+ |
| Utils | 95%+ |
| Views | 70%+ |

## Common Mistakes

1. **Testing implementation** → Test behavior instead
2. **Flaky UI tests** → Use waitForExistence
3. **Missing tearDown** → Clean up resources
4. **Slow tests** → Use mocks, avoid network

## Skill Validation

1. **Test Suite**: 80% coverage on sample project
2. **Mock Library**: Reusable mock implementations
3. **UI Test Flow**: End-to-end login flow
4. **Performance Baseline**: Measure scroll performance
