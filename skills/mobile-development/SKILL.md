---
name: mobile-development
description: Mobile app development for iOS and Android including native development with Swift and Kotlin, cross-platform with Flutter, and mobile best practices.
---

# Mobile Development

Build native and cross-platform mobile applications.

## iOS Development with Swift

```swift
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(count)")
                .font(.largeTitle)

            Button(action: { count += 1 }) {
                Text("Increment")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
```

## Android Development with Kotlin

```kotlin
class MainActivity : AppCompatActivity() {
    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val button: Button = findViewById(R.id.incrementButton)
        val textView: TextView = findViewById(R.id.countText)

        button.setOnClickListener {
            count++
            textView.text = "Count: $count"
        }
    }
}
```

## Cross-Platform with Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $count', style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () => setState(() => count++),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Mobile-Specific Challenges

### State Management
```swift
// Swift: Combine
@Published var items: [Item] = []

// Kotlin: ViewModel
class ItemViewModel : ViewModel() {
    private val _items = MutableLiveData<List<Item>>()
    val items: LiveData<List<Item>> = _items
}

// Flutter: Provider
final itemProvider = FutureProvider((ref) async {
  return await repository.fetchItems();
});
```

### Networking

```swift
// iOS: Codable + URLSession
let url = URL(string: "https://api.example.com/users/1")!
let data = try await URLSession.shared.data(from: url).0
let user = try JSONDecoder().decode(User.self, from: data)
```

```kotlin
// Android: Retrofit
interface ApiService {
    @GET("users/{id}")
    suspend fun getUser(@Path("id") id: String): User
}

val user = apiService.getUser("1")
```

```dart
// Flutter: http package
final response = await http.get(Uri.parse('https://api.example.com/users/1'));
final user = User.fromJson(jsonDecode(response.body));
```

## Navigation

```swift
// SwiftUI Navigation
@State private var navigationPath = NavigationPath()

NavigationStack(path: $navigationPath) {
    VStack {
        NavigationLink(value: "details") {
            Text("Go to Details")
        }
    }
    .navigationDestination(for: String.self) { value in
        if value == "details" {
            DetailsView()
        }
    }
}
```

```kotlin
// Jetpack Navigation
@Composable
fun Navigation() {
    val navController = rememberNavController()
    NavHost(navController, "home") {
        composable("home") { HomeScreen(navController) }
        composable("details") { DetailsScreen() }
    }
}
```

## Performance Optimization

### Image Loading
```swift
// iOS: AsyncImage
AsyncImage(url: URL(string: imageUrl)) { phase in
    switch phase {
    case .success(let image):
        image.resizable()
    case .loading:
        ProgressView()
    case .empty, .failure:
        Image(systemName: "photo")
    @unknown default:
        EmptyView()
    }
}
```

### Memory Management
```swift
// Swift: Avoid retain cycles with [weak self]
DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
    self?.updateUI()
}
```

```kotlin
// Kotlin: Use ViewModel to avoid memory leaks
override fun onCleared() {
    super.onCleared()
    // Cleanup
}
```

## Testing

```swift
// iOS XCTest
func testIncrement() {
    let viewModel = CounterViewModel()
    viewModel.increment()
    XCTAssertEqual(viewModel.count, 1)
}
```

```kotlin
// Android JUnit
@Test
fun testIncrement() {
    val viewModel = CounterViewModel()
    viewModel.increment()
    assertEquals(1, viewModel.count.value)
}
```

```dart
// Flutter test
test('Counter increments', () {
  final counter = Counter();
  counter.increment();
  expect(counter.value, 1);
});
```

## Platform Comparison

| Aspect | iOS (Swift) | Android (Kotlin) | Flutter |
|--------|------------|-----------------|---------|
| **Performance** | Excellent | Excellent | Very Good |
| **Learning Curve** | Moderate | Moderate | Easy |
| **Ecosystem** | Mature | Mature | Growing |
| **Code Reuse** | Limited | Limited | Excellent |
| **Time to Market** | Medium | Medium | Fast |

---

**Mobile is where users spend most of their time. Build excellent mobile experiences!**
