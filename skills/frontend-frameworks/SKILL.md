---
name: frontend-frameworks
description: Modern frontend framework development including React, Vue, Angular, and Next.js. Learn component architecture, state management, routing, performance optimization, and production-ready patterns.
sasmp_version: "1.3.0"
bonded_agent: 01-ai-ml-specialist
bond_type: PRIMARY_BOND
---

# Frontend Frameworks

Build scalable, performant web applications with modern frameworks.

## Quick Start with React

```jsx
// Functional component with hooks
function Counter() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log('Component mounted or count changed:', count);
  }, [count]);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

## Core Concepts

### Component Architecture
```jsx
// Reusable component with props
function UserCard({ name, email, isActive }) {
  return (
    <div className={`card ${isActive ? 'active' : ''}`}>
      <h2>{name}</h2>
      <p>{email}</p>
    </div>
  );
}

// Usage
<UserCard name="John" email="john@example.com" isActive={true} />
```

### State Management

**Option 1: Local State (useState)**
```jsx
const [user, setUser] = useState({ name: '', email: '' });
```

**Option 2: Global State (Zustand - Recommended)**
```javascript
import create from 'zustand';

const useStore = create((set) => ({
  user: null,
  setUser: (user) => set({ user }),
}));
```

**Option 3: Context API (Built-in)**
```jsx
const UserContext = createContext();

function App() {
  const [user, setUser] = useState(null);
  return (
    <UserContext.Provider value={{ user, setUser }}>
      <Child />
    </UserContext.Provider>
  );
}
```

### Routing

```jsx
// Using React Router
import { BrowserRouter, Routes, Route } from 'react-router-dom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/users/:id" element={<UserDetail />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </BrowserRouter>
  );
}
```

## Performance Optimization

### Code Splitting & Lazy Loading
```jsx
import { lazy, Suspense } from 'react';

const UserPage = lazy(() => import('./pages/UserPage'));

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <UserPage />
    </Suspense>
  );
}
```

### Memoization
```jsx
// Prevent unnecessary re-renders
const UserCard = memo(function UserCard({ user }) {
  return <div>{user.name}</div>;
});

// useCallback for functions
const handleClick = useCallback(() => {
  console.log('Clicked');
}, []);

// useMemo for expensive computations
const expensiveValue = useMemo(() => {
  return items.filter(item => item.active).sort();
}, [items]);
```

## Testing Patterns

```jsx
// React Testing Library (Best Practice)
import { render, screen } from '@testing-library/react';

test('Counter increments', () => {
  render(<Counter />);
  const button = screen.getByRole('button');

  fireEvent.click(button);

  expect(screen.getByText('Count: 1')).toBeInTheDocument();
});
```

## Framework Comparison

| Framework | Strengths | When to Use |
|-----------|-----------|------------|
| **React** | Large ecosystem, JSX, community | Complex apps, teams, startups |
| **Vue** | Gentle learning curve, flexible | Quick projects, smaller apps |
| **Angular** | Complete framework, TypeScript | Enterprise, large teams |
| **Next.js** | SSR/SSG, full-stack | SEO-critical, full-stack |

## Production Checklist

- [ ] TypeScript for type safety
- [ ] Comprehensive test coverage (>80%)
- [ ] Accessibility (WCAG compliance)
- [ ] Performance monitoring (Core Web Vitals)
- [ ] Error boundaries and error handling
- [ ] State management strategy
- [ ] SEO optimization
- [ ] Mobile responsiveness

## Modern Best Practices

1. **Functional Components**: Avoid class components
2. **Hooks**: Use for all side effects and state
3. **TypeScript**: Essential for production apps
4. **Testing**: Unit + Integration + E2E
5. **Error Boundaries**: Catch rendering errors
6. **Code Splitting**: Lazy load routes and components
7. **Optimization**: Profile with React DevTools

## Common Patterns

### Custom Hooks
```jsx
function useUserData(userId) {
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetch(`/api/users/${userId}`)
      .then(r => r.json())
      .then(setUser);
  }, [userId]);

  return user;
}
```

### Higher-Order Components
```jsx
const withAuth = (Component) => {
  return (props) => {
    const user = useUser();
    return user ? <Component {...props} /> : <Login />;
  };
};
```

---

**Master these concepts and you'll build world-class web applications!**
