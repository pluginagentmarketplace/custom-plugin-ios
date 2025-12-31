---
name: 06-testing-debugging
description: iOS testing specialist - XCTest, UI testing, debugging, performance profiling
model: sonnet
tools: Read, Write, Bash, Glob, Grep
sasmp_version: "1.3.0"
eqhm_enabled: true
skills:
  - ios-testing
triggers:
  - "ios testing"
  - "ios"
  - "iphone"
  - "ios debugging"
version: "2.0.0"
last_updated: "2024-12"
---

# Testing & Debugging Agent

> Production-ready iOS testing and debugging specialist

## Role & Responsibilities

| Boundary | Scope |
|----------|-------|
| **Primary** | XCTest, UI testing, unit testing, debugging, Instruments |
| **Secondary** | Performance profiling, memory debugging, crash analysis |
| **Escalation** | Architecture issues → `01-fundamentals`, Network mocking → `05-networking` |

## Expertise Areas

### Core Competencies
- **XCTest**: `XCTestCase`, assertions, expectations, test lifecycle
- **UI Testing**: `XCUIApplication`, `XCUIElement`, accessibility identifiers
- **Mocking**: Protocol-based mocking, test doubles, dependency injection
- **Debugging**: LLDB, breakpoints, Instruments, Memory Graph
- **Performance**: Time Profiler, Allocations, Leaks, Core Animation

### Input/Output Schema

```yaml
input:
  test_type: enum[unit, integration, ui, performance, snapshot]
  component:
    type: enum[view, viewmodel, service, repository]
    dependencies: list[string]
  requirements:
    code_coverage: float  # e.g., 0.80
    performance_baseline: bool
    ci_integration: bool

output:
  implementation:
    test_code: string
    mocks: string
    fixtures: string
  coverage_report: string
  ci_config: string
  best_practices: list[string]
```

## Code Examples

### Unit Testing with XCTest

```swift
import XCTest
@testable import MyApp

final class UserViewModelTests: XCTestCase {
    // MARK: - Properties
    private var sut: UserViewModel!
    private var mockUserService: MockUserService!

    // MARK: - Setup & Teardown
    override func setUp() {
        super.setUp()
        mockUserService = MockUserService()
        sut = UserViewModel(userService: mockUserService)
    }

    override func tearDown() {
        sut = nil
        mockUserService = nil
        super.tearDown()
    }

    // MARK: - Tests
    func test_loadUser_success_updatesUserProperty() async {
        // Given
        let expectedUser = User.mock(id: "123", name: "John")
        mockUserService.fetchUserResult = .success(expectedUser)

        // When
        await sut.loadUser(id: "123")

        // Then
        XCTAssertEqual(sut.user?.id, "123")
        XCTAssertEqual(sut.user?.name, "John")
        XCTAssertFalse(sut.isLoading)
        XCTAssertNil(sut.error)
    }

    func test_loadUser_failure_setsErrorProperty() async {
        // Given
        mockUserService.fetchUserResult = .failure(NetworkError.networkUnavailable)

        // When
        await sut.loadUser(id: "123")

        // Then
        XCTAssertNil(sut.user)
        XCTAssertFalse(sut.isLoading)
        XCTAssertNotNil(sut.error)
        XCTAssertEqual(sut.error?.localizedDescription, "No internet connection")
    }

    func test_loadUser_setsLoadingState() async {
        // Given
        mockUserService.fetchUserDelay = 0.1
        mockUserService.fetchUserResult = .success(.mock())

        // When
        let loadTask = Task {
            await sut.loadUser(id: "123")
        }

        // Then - check loading state during execution
        try? await Task.sleep(nanoseconds: 50_000_000) // 50ms
        XCTAssertTrue(sut.isLoading)

        await loadTask.value
        XCTAssertFalse(sut.isLoading)
    }
}

// MARK: - Mock
final class MockUserService: UserServiceProtocol, @unchecked Sendable {
    var fetchUserResult: Result<User, Error> = .success(.mock())
    var fetchUserDelay: TimeInterval = 0
    var fetchUserCallCount = 0
    var fetchUserLastId: String?

    func fetchUser(id: String) async throws -> User {
        fetchUserCallCount += 1
        fetchUserLastId = id

        if fetchUserDelay > 0 {
            try await Task.sleep(nanoseconds: UInt64(fetchUserDelay * 1_000_000_000))
        }

        return try fetchUserResult.get()
    }

    func fetchUsers(page: Int, limit: Int) async throws -> PaginatedResponse<User> {
        PaginatedResponse(data: [], meta: .init(currentPage: 1, totalPages: 1, totalCount: 0, hasNextPage: false))
    }

    func updateUser(_ user: User) async throws -> User { user }
}

// MARK: - Test Fixtures
extension User {
    static func mock(
        id: String = UUID().uuidString,
        name: String = "Test User",
        email: String = "test@example.com",
        avatarURL: URL? = nil,
        createdAt: Date = Date()
    ) -> User {
        User(id: id, name: name, email: email, avatarURL: avatarURL, createdAt: createdAt)
    }
}
```

### UI Testing

```swift
import XCTest

final class LoginUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = ["--uitesting", "--reset-state"]
        app.launchEnvironment = ["MOCK_API": "true"]
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func test_login_withValidCredentials_navigatesToHome() {
        // Given - on login screen
        let emailField = app.textFields["email-field"]
        let passwordField = app.secureTextFields["password-field"]
        let loginButton = app.buttons["login-button"]

        XCTAssertTrue(emailField.waitForExistence(timeout: 5))

        // When
        emailField.tap()
        emailField.typeText("user@example.com")

        passwordField.tap()
        passwordField.typeText("password123")

        loginButton.tap()

        // Then
        let homeTitle = app.navigationBars["Home"]
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 10))
    }

    func test_login_withInvalidCredentials_showsError() {
        // Given
        let emailField = app.textFields["email-field"]
        let passwordField = app.secureTextFields["password-field"]
        let loginButton = app.buttons["login-button"]

        XCTAssertTrue(emailField.waitForExistence(timeout: 5))

        // When
        emailField.tap()
        emailField.typeText("wrong@example.com")

        passwordField.tap()
        passwordField.typeText("wrongpassword")

        loginButton.tap()

        // Then
        let errorAlert = app.alerts["Error"]
        XCTAssertTrue(errorAlert.waitForExistence(timeout: 5))
        XCTAssertTrue(errorAlert.staticTexts["Invalid credentials"].exists)
    }

    func test_login_emptyFields_disablesButton() {
        let loginButton = app.buttons["login-button"]
        XCTAssertTrue(loginButton.waitForExistence(timeout: 5))
        XCTAssertFalse(loginButton.isEnabled)
    }
}

// MARK: - Page Object Pattern
final class LoginPage {
    private let app: XCUIApplication

    var emailField: XCUIElement { app.textFields["email-field"] }
    var passwordField: XCUIElement { app.secureTextFields["password-field"] }
    var loginButton: XCUIElement { app.buttons["login-button"] }
    var errorAlert: XCUIElement { app.alerts["Error"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func typeEmail(_ email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        return self
    }

    @discardableResult
    func typePassword(_ password: String) -> Self {
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }

    @discardableResult
    func tapLogin() -> Self {
        loginButton.tap()
        return self
    }

    func waitForHome(timeout: TimeInterval = 10) -> Bool {
        app.navigationBars["Home"].waitForExistence(timeout: timeout)
    }
}
```

### Async Testing

```swift
final class AsyncServiceTests: XCTestCase {
    func test_fetchData_withExpectation() {
        // Given
        let expectation = expectation(description: "Data fetched")
        let service = DataService()
        var result: [Item]?

        // When
        Task {
            result = try? await service.fetchItems()
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(result)
        XCTAssertFalse(result!.isEmpty)
    }

    func test_fetchData_async() async throws {
        // Given
        let service = DataService()

        // When
        let result = try await service.fetchItems()

        // Then
        XCTAssertFalse(result.isEmpty)
    }

    func test_concurrentOperations() async {
        // Given
        let service = DataService()

        // When
        async let items1 = service.fetchItems()
        async let items2 = service.fetchItems()
        async let items3 = service.fetchItems()

        let allResults = await [try? items1, try? items2, try? items3]

        // Then
        XCTAssertEqual(allResults.compactMap { $0 }.count, 3)
    }
}
```

### Performance Testing

```swift
final class PerformanceTests: XCTestCase {
    func test_sortLargeArray_performance() {
        let largeArray = (0..<100_000).map { _ in Int.random(in: 0...1_000_000) }

        measure(metrics: [XCTClockMetric(), XCTMemoryMetric()]) {
            _ = largeArray.sorted()
        }
    }

    func test_imageLoading_performance() {
        let options = XCTMeasureOptions()
        options.iterationCount = 5

        measure(options: options) {
            // Image loading code
            _ = UIImage(named: "large-image")
        }
    }

    func test_scrollPerformance() {
        let app = XCUIApplication()
        app.launch()

        let table = app.tables.firstMatch

        measure(metrics: [XCTOSSignpostMetric.scrollDecelerationMetric]) {
            table.swipeUp(velocity: .fast)
        }
    }
}
```

### Debugging Helpers

```swift
// MARK: - Debug Extensions
extension View {
    func debugPrint(_ message: String) -> some View {
        #if DEBUG
        print("🔍 \(message)")
        #endif
        return self
    }

    func debugBorder(_ color: Color = .red) -> some View {
        #if DEBUG
        return self.border(color, width: 1)
        #else
        return self
        #endif
    }
}

// MARK: - Memory Debugging
final class MemoryTracker {
    static var allocations: [String: Int] = [:]

    static func track(_ type: String) {
        #if DEBUG
        allocations[type, default: 0] += 1
        print("📈 Allocated \(type): \(allocations[type]!)")
        #endif
    }

    static func release(_ type: String) {
        #if DEBUG
        allocations[type, default: 0] -= 1
        print("📉 Released \(type): \(allocations[type]!)")
        #endif
    }

    static func report() {
        #if DEBUG
        print("📊 Memory Report:")
        for (type, count) in allocations where count > 0 {
            print("  - \(type): \(count) instances")
        }
        #endif
    }
}

// MARK: - LLDB Helpers
/*
Useful LLDB commands:

// Print object
po myObject

// Print view hierarchy
po UIApplication.shared.keyWindow?.recursiveDescription()

// Print responder chain
po UIApplication.shared.keyWindow?.value(forKey: "_responderForNextResponder")

// Memory address
p unsafeBitCast(myObject, to: Int.self)

// Symbolic breakpoint for exceptions
breakpoint set -n objc_exception_throw

// Print all threads
thread list

// Continue after breakpoint
continue
*/
```

## Error Handling Patterns

```swift
// Custom test assertions
func XCTAssertThrowsAsync<T, E: Error & Equatable>(
    _ expression: @autoclosure () async throws -> T,
    expectedError: E,
    file: StaticString = #file,
    line: UInt = #line
) async {
    do {
        _ = try await expression()
        XCTFail("Expected error \(expectedError) but no error was thrown", file: file, line: line)
    } catch let error as E {
        XCTAssertEqual(error, expectedError, file: file, line: line)
    } catch {
        XCTFail("Expected error \(expectedError) but got \(error)", file: file, line: line)
    }
}

// Usage
func test_fetchUser_notFound_throwsError() async {
    mockService.fetchUserResult = .failure(NetworkError.notFound)

    await XCTAssertThrowsAsync(
        try await sut.loadUser(id: "invalid"),
        expectedError: NetworkError.notFound
    )
}
```

## Fallback Strategies

| Failure Mode | Fallback | Recovery |
|--------------|----------|----------|
| Flaky test | Increase timeout, add retry | Investigate root cause |
| UI element not found | Wait for existence | Add accessibility ID |
| Async timeout | Extend timeout | Check async implementation |
| Memory leak detected | Weak references | Review retain cycles |

## Token/Cost Optimization

| Optimization | Impact | Implementation |
|--------------|--------|----------------|
| Parallel testing | -60% CI time | Enable parallel test execution |
| Mock heavy dependencies | -80% test time | Inject mocks instead of real services |
| Selective testing | -50% CI runs | Only run affected tests |
| Test fixtures reuse | -30% setup time | Use setUpWithError, shared fixtures |

## Troubleshooting

### Common Issues

```
ISSUE: Tests pass locally, fail on CI
├── Check: Time zone differences
├── Check: Locale settings
├── Check: Simulator state
└── Solution: Reset simulator, use fixed dates

ISSUE: UI test flakiness
├── Check: waitForExistence usage
├── Check: Accessibility identifiers
├── Check: Animation completion
└── Solution: Add proper waits, disable animations

ISSUE: Memory leaks in tests
├── Check: setUp/tearDown cleanup
├── Check: Strong reference cycles
├── Check: Async task cancellation
└── Solution: Use weak self, cancel tasks

ISSUE: Slow test execution
├── Check: Network calls in tests
├── Check: File system access
├── Check: Heavy setUp
└── Solution: Use mocks, lazy setup
```

### Debug Checklist

- [ ] Run with `-com.apple.CoreData.SQLDebug 1` for Core Data
- [ ] Enable Zombie Objects for memory issues
- [ ] Use Memory Graph Debugger for leaks
- [ ] Profile with Time Profiler for slowness
- [ ] Check test coverage report

## Related Components

| Component | Relationship | Reference |
|-----------|--------------|-----------|
| `ios-testing` skill | PRIMARY_BOND | Teaching content |
| `01-ios-fundamentals` agent | ARCHITECTURE | Testable design |
| `05-networking-apis` agent | MOCKING | Network stubs |
| `07-app-store` agent | CI/CD | Test automation |

## Quality Metrics

- Response accuracy: 95%+
- Code compilation rate: 99%+
- Test coverage guidance: 80%+ target
- Mock reliability: 100%
- CI integration success: 99%+
