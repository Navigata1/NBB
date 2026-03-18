# PART IX: TESTING & VERIFICATION FRAMEWORK

---

## 42. TESTING PHILOSOPHY

> "Tests are not overhead—they are the only proof that your code works."

### 42.1 The Testing Pyramid

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         THE TESTING PYRAMID                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                              ╱╲                                              │
│                             ╱  ╲                                             │
│                            ╱ E2E╲                 Few, Slow, Expensive       │
│                           ╱──────╲                                           │
│                          ╱        ╲                                          │
│                         ╱Integration╲            Some, Medium                │
│                        ╱────────────╲                                        │
│                       ╱              ╲                                       │
│                      ╱      Unit      ╲          Many, Fast, Cheap          │
│                     ╱──────────────────╲                                     │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  DISTRIBUTION GUIDE:                                                         │
│                                                                              │
│  UNIT TESTS (70% of tests)                                                   │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Test individual functions/components in isolation                        │
│  • Mock external dependencies                                                │
│  • Fast execution (< 10ms per test)                                         │
│  • Run on every save/commit                                                  │
│                                                                              │
│  INTEGRATION TESTS (20% of tests)                                            │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Test component interactions                                               │
│  • Test API endpoints with real database                                    │
│  • Medium execution time (< 1s per test)                                    │
│  • Run before every merge                                                    │
│                                                                              │
│  E2E TESTS (10% of tests)                                                    │
│  ───────────────────────────────────────────────────────────────────────    │
│  • Test critical user flows                                                  │
│  • Real browser, real backend                                                │
│  • Slow execution (seconds to minutes)                                      │
│  • Run before deployment                                                     │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 42.2 Testing Principles

```
TESTING PRINCIPLES
─────────────────────────────────────────────────────────────────────────────

PRINCIPLE 1: TEST BEHAVIOR, NOT IMPLEMENTATION
─────────────────────────────────────────────────────────────────────────────
BAD: Testing that a specific function is called
GOOD: Testing that the expected outcome occurs

// Bad: Testing implementation
expect(mockDb.query).toHaveBeenCalledWith('SELECT * FROM users');

// Good: Testing behavior
const users = await getUsers();
expect(users).toHaveLength(3);
expect(users[0].name).toBe('John');


PRINCIPLE 2: ONE ASSERTION FOCUS PER TEST
─────────────────────────────────────────────────────────────────────────────
Each test should verify one specific behavior.
Multiple assertions are fine if they verify the same behavior.

// Bad: Testing multiple behaviors
it('should handle user creation', () => {
  // Testing validation, creation, and email all in one
});

// Good: Separate tests for each behavior
it('should reject invalid email format', () => { ... });
it('should create user with valid data', () => { ... });
it('should send welcome email after creation', () => { ... });


PRINCIPLE 3: TESTS SHOULD BE INDEPENDENT
─────────────────────────────────────────────────────────────────────────────
Tests should not depend on each other.
Each test should set up its own state.

// Bad: Depending on previous test
it('should create user', () => { ... });
it('should update the created user', () => { /* depends on above */ });

// Good: Independent tests
it('should update user', () => {
  const user = await createTestUser(); // Set up own state
  await updateUser(user.id, { name: 'New Name' });
  // Assert...
});


PRINCIPLE 4: TESTS SHOULD BE DETERMINISTIC
─────────────────────────────────────────────────────────────────────────────
Same test should always produce same result.
Avoid: Random data, time-dependent logic, external services.

// Bad: Non-deterministic
it('should expire after 24 hours', () => {
  const token = createToken();
  // This test will fail differently at different times
});

// Good: Deterministic with time control
it('should expire after 24 hours', () => {
  jest.useFakeTimers();
  const token = createToken();
  jest.advanceTimersByTime(24 * 60 * 60 * 1000);
  expect(isTokenExpired(token)).toBe(true);
});


PRINCIPLE 5: TESTS ARE DOCUMENTATION
─────────────────────────────────────────────────────────────────────────────
Test names should describe the expected behavior.
Reading tests should explain how the system works.

// Bad: Unclear test names
it('test1', () => { ... });
it('should work', () => { ... });

// Good: Descriptive test names
it('should return 404 when user does not exist', () => { ... });
it('should hash password before storing', () => { ... });
it('should send email notification on successful order', () => { ... });
```

### 42.3 What to Test

```
WHAT TO TEST
─────────────────────────────────────────────────────────────────────────────

ALWAYS TEST:
─────────────────────────────────────────────────────────────────────────────
✓ Business logic
  • Core algorithms and calculations
  • State transitions
  • Decision trees

✓ API contracts
  • Request validation
  • Response format
  • Error handling
  • Status codes

✓ Data transformations
  • Input parsing
  • Output formatting
  • Mapping functions

✓ Edge cases
  • Empty inputs
  • Null/undefined handling
  • Boundary values
  • Error conditions

✓ Security-critical code
  • Authentication flows
  • Authorization checks
  • Input sanitization
  • Encryption/hashing


CONSIDER TESTING:
─────────────────────────────────────────────────────────────────────────────
○ UI components
  • Complex interactive components
  • Conditional rendering
  • State-dependent displays

○ Integration points
  • Database operations
  • External API calls
  • File operations


SKIP TESTING (Usually):
─────────────────────────────────────────────────────────────────────────────
✗ Third-party library internals
  • They have their own tests

✗ Simple getters/setters
  • Unless they have logic

✗ Framework boilerplate
  • Configuration files
  • Simple wiring code

✗ Styling
  • Visual regression tests instead
```

---

## 43. TEST COVERAGE STRATEGIES

### 43.1 Coverage Thresholds

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       COVERAGE THRESHOLDS                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  Coverage metrics are INDICATORS, not GOALS.                                │
│  High coverage with bad tests is worse than low coverage with good tests.  │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  RECOMMENDED THRESHOLDS:                                                     │
│                                                                              │
│  CODE AREA               │ MINIMUM    │ TARGET     │ NOTES                  │
│  ────────────────────────┼────────────┼────────────┼─────────────────────── │
│  Business logic          │ 80%        │ 95%+       │ Critical, must test    │
│  API endpoints           │ 80%        │ 90%+       │ Contract matters       │
│  Utility functions       │ 90%        │ 100%       │ Pure, easy to test     │
│  UI components           │ 60%        │ 80%        │ Focus on complex ones  │
│  Integration code        │ 70%        │ 85%        │ Error paths important  │
│  Overall project         │ 70%        │ 80%+       │ Balanced goal          │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  COVERAGE TYPES:                                                             │
│                                                                              │
│  LINE COVERAGE                                                               │
│  Percentage of code lines executed by tests                                 │
│  Useful but can be gamed                                                    │
│                                                                              │
│  BRANCH COVERAGE                                                             │
│  Percentage of if/else branches taken                                       │
│  Better indicator of thoroughness                                            │
│                                                                              │
│  FUNCTION COVERAGE                                                           │
│  Percentage of functions called                                              │
│  Quick overview of what's tested                                            │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 43.2 Coverage Configuration

```
COVERAGE CONFIGURATION
─────────────────────────────────────────────────────────────────────────────

JEST CONFIGURATION:
```javascript
// jest.config.js
module.exports = {
  collectCoverageFrom: [
    'src/**/*.{js,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/**/*.stories.{js,ts,tsx}',
    '!src/**/*.test.{js,ts,tsx}',
    '!src/**/index.{js,ts}', // Re-export files
  ],
  coverageThreshold: {
    global: {
      branches: 70,
      functions: 70,
      lines: 70,
      statements: 70,
    },
    // Stricter thresholds for critical paths
    './src/features/auth/**/*.ts': {
      branches: 90,
      functions: 90,
      lines: 90,
    },
    './src/lib/api/**/*.ts': {
      branches: 85,
      functions: 85,
      lines: 85,
    },
  },
};
```

VITEST CONFIGURATION:
```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    coverage: {
      provider: 'v8',
      reporter: ['text', 'html', 'lcov'],
      exclude: [
        'node_modules',
        'dist',
        '**/*.d.ts',
        '**/*.test.{js,ts,tsx}',
        '**/index.{js,ts}',
      ],
      thresholds: {
        lines: 70,
        functions: 70,
        branches: 70,
        statements: 70,
      },
    },
  },
});
```
```

### 43.3 Coverage Anti-Patterns

```
COVERAGE ANTI-PATTERNS
─────────────────────────────────────────────────────────────────────────────

ANTI-PATTERN 1: COVERAGE GAMING
─────────────────────────────────────────────────────────────────────────────
Writing tests that execute code but don't verify behavior.

// Bad: Executes code but tests nothing
it('should run without error', () => {
  processData(testData);
  // No assertions!
});

// Good: Actually verifies behavior
it('should transform data correctly', () => {
  const result = processData(testData);
  expect(result.count).toBe(5);
  expect(result.status).toBe('complete');
});


ANTI-PATTERN 2: TESTING THE MOCK
─────────────────────────────────────────────────────────────────────────────
Setting up mocks and then testing the mock behavior.

// Bad: Testing the mock, not the code
const mockFetch = jest.fn().mockResolvedValue({ data: [] });
it('should call fetch', async () => {
  await getData();
  expect(mockFetch).toHaveBeenCalled(); // Only tests mock setup
});

// Good: Testing actual behavior
it('should return parsed data', async () => {
  mockFetch.mockResolvedValue({ data: [{ id: 1 }] });
  const result = await getData();
  expect(result[0].id).toBe(1);
});


ANTI-PATTERN 3: IGNORING EDGE CASES
─────────────────────────────────────────────────────────────────────────────
High coverage on happy paths but missing error cases.

// Incomplete: Only happy path
it('should get user', async () => {
  const user = await getUser(1);
  expect(user.name).toBe('John');
});

// Complete: Including edge cases
it('should get user', async () => { ... });
it('should throw when user not found', async () => { ... });
it('should handle network errors', async () => { ... });
it('should handle malformed response', async () => { ... });


ANTI-PATTERN 4: SNAPSHOT ABUSE
─────────────────────────────────────────────────────────────────────────────
Using snapshots for everything without understanding them.

// Bad: Snapshot of complex object (hard to review changes)
it('should return user data', () => {
  expect(getUserData()).toMatchSnapshot();
});

// Good: Explicit assertions for behavior, snapshots for stable structures
it('should return correct user fields', () => {
  const user = getUserData();
  expect(user.id).toBeDefined();
  expect(user.email).toContain('@');
});

it('should match API schema', () => {
  expect(getApiSchema()).toMatchSnapshot(); // Stable, reviewed carefully
});
```

---

## 44. TESTING PATTERNS BY LAYER

### 44.1 Unit Testing Patterns

```
UNIT TESTING PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN: ARRANGE-ACT-ASSERT (AAA)
─────────────────────────────────────────────────────────────────────────────
```typescript
it('should calculate order total with discount', () => {
  // Arrange: Set up test data and dependencies
  const items = [
    { price: 100, quantity: 2 },
    { price: 50, quantity: 1 },
  ];
  const discount = 0.1; // 10%

  // Act: Execute the code under test
  const total = calculateOrderTotal(items, discount);

  // Assert: Verify the expected outcome
  expect(total).toBe(225); // (200 + 50) * 0.9
});
```

PATTERN: TABLE-DRIVEN TESTS
─────────────────────────────────────────────────────────────────────────────
```typescript
describe('formatCurrency', () => {
  const testCases = [
    { input: 0, expected: '$0.00' },
    { input: 100, expected: '$100.00' },
    { input: 1234.56, expected: '$1,234.56' },
    { input: -50, expected: '-$50.00' },
    { input: 0.1, expected: '$0.10' },
  ];

  test.each(testCases)(
    'formats $input as $expected',
    ({ input, expected }) => {
      expect(formatCurrency(input)).toBe(expected);
    }
  );
});
```

PATTERN: TESTING ASYNC CODE
─────────────────────────────────────────────────────────────────────────────
```typescript
// Using async/await
it('should fetch user data', async () => {
  const user = await fetchUser(1);
  expect(user.name).toBe('John');
});

// Testing rejected promises
it('should throw on network error', async () => {
  mockFetch.mockRejectedValue(new Error('Network error'));
  
  await expect(fetchUser(1)).rejects.toThrow('Network error');
});

// Testing with timers
it('should retry after delay', async () => {
  jest.useFakeTimers();
  
  const promise = fetchWithRetry();
  
  jest.advanceTimersByTime(1000);
  
  const result = await promise;
  expect(result).toBeDefined();
});
```

PATTERN: TESTING HOOKS
─────────────────────────────────────────────────────────────────────────────
```typescript
import { renderHook, act } from '@testing-library/react';

describe('useCounter', () => {
  it('should increment counter', () => {
    const { result } = renderHook(() => useCounter());

    act(() => {
      result.current.increment();
    });

    expect(result.current.count).toBe(1);
  });

  it('should handle async updates', async () => {
    const { result } = renderHook(() => useAsyncData());

    expect(result.current.loading).toBe(true);

    await waitFor(() => {
      expect(result.current.loading).toBe(false);
    });

    expect(result.current.data).toBeDefined();
  });
});
```
```

### 44.2 Integration Testing Patterns

```
INTEGRATION TESTING PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN: API ENDPOINT TESTING
─────────────────────────────────────────────────────────────────────────────
```typescript
import { createServer } from '../server';
import { db } from '../db';

describe('POST /api/users', () => {
  let app;

  beforeAll(async () => {
    app = await createServer();
  });

  beforeEach(async () => {
    await db.clear(); // Clean state for each test
  });

  afterAll(async () => {
    await db.close();
  });

  it('should create user with valid data', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({
        email: 'test@example.com',
        name: 'Test User',
        password: 'securePassword123',
      });

    expect(response.status).toBe(201);
    expect(response.body.data.email).toBe('test@example.com');
    expect(response.body.data.password).toBeUndefined(); // Not exposed
    
    // Verify in database
    const dbUser = await db.users.findByEmail('test@example.com');
    expect(dbUser).toBeDefined();
  });

  it('should return 422 for invalid email', async () => {
    const response = await request(app)
      .post('/api/users')
      .send({
        email: 'not-an-email',
        name: 'Test User',
        password: 'securePassword123',
      });

    expect(response.status).toBe(422);
    expect(response.body.error.details[0].field).toBe('email');
  });
});
```

PATTERN: DATABASE INTEGRATION
─────────────────────────────────────────────────────────────────────────────
```typescript
describe('UserRepository', () => {
  let repo: UserRepository;
  let testDb: TestDatabase;

  beforeAll(async () => {
    testDb = await TestDatabase.create();
    repo = new UserRepository(testDb.connection);
  });

  beforeEach(async () => {
    await testDb.reset(); // Clean and reseed
  });

  afterAll(async () => {
    await testDb.destroy();
  });

  it('should find user by email', async () => {
    // Seed data
    await testDb.seed('users', [
      { id: '1', email: 'john@example.com', name: 'John' },
    ]);

    const user = await repo.findByEmail('john@example.com');

    expect(user).toBeDefined();
    expect(user?.name).toBe('John');
  });

  it('should handle concurrent updates', async () => {
    await testDb.seed('users', [
      { id: '1', email: 'john@example.com', balance: 100 },
    ]);

    // Simulate concurrent updates
    await Promise.all([
      repo.updateBalance('1', -30),
      repo.updateBalance('1', -30),
    ]);

    const user = await repo.findById('1');
    expect(user?.balance).toBe(40); // Both deductions applied
  });
});
```
```

### 44.3 E2E Testing Patterns

```
E2E TESTING PATTERNS
─────────────────────────────────────────────────────────────────────────────

PATTERN: USER FLOW TESTING (Playwright)
─────────────────────────────────────────────────────────────────────────────
```typescript
import { test, expect } from '@playwright/test';

test.describe('User Authentication Flow', () => {
  test('should complete signup and login', async ({ page }) => {
    // Navigate to signup
    await page.goto('/signup');

    // Fill signup form
    await page.fill('[data-testid="email-input"]', 'test@example.com');
    await page.fill('[data-testid="password-input"]', 'SecurePass123!');
    await page.fill('[data-testid="name-input"]', 'Test User');

    // Submit and wait for navigation
    await page.click('[data-testid="signup-button"]');
    await page.waitForURL('/dashboard');

    // Verify logged in state
    await expect(page.locator('[data-testid="user-menu"]')).toBeVisible();
    await expect(page.locator('[data-testid="user-name"]')).toHaveText('Test User');

    // Logout
    await page.click('[data-testid="user-menu"]');
    await page.click('[data-testid="logout-button"]');
    await page.waitForURL('/');

    // Login again
    await page.goto('/login');
    await page.fill('[data-testid="email-input"]', 'test@example.com');
    await page.fill('[data-testid="password-input"]', 'SecurePass123!');
    await page.click('[data-testid="login-button"]');
    await page.waitForURL('/dashboard');

    // Verify same user
    await expect(page.locator('[data-testid="user-name"]')).toHaveText('Test User');
  });
});
```

PATTERN: VISUAL REGRESSION TESTING
─────────────────────────────────────────────────────────────────────────────
```typescript
import { test, expect } from '@playwright/test';

test.describe('Visual Regression', () => {
  test('dashboard matches snapshot', async ({ page }) => {
    await page.goto('/dashboard');
    await page.waitForLoadState('networkidle');

    // Full page screenshot
    await expect(page).toHaveScreenshot('dashboard.png', {
      fullPage: true,
      maxDiffPixels: 100, // Allow minor differences
    });
  });

  test('components match snapshots', async ({ page }) => {
    await page.goto('/components');

    // Individual component screenshots
    const button = page.locator('[data-testid="primary-button"]');
    await expect(button).toHaveScreenshot('primary-button.png');

    const card = page.locator('[data-testid="user-card"]');
    await expect(card).toHaveScreenshot('user-card.png');
  });
});
```

PATTERN: ACCESSIBILITY TESTING
─────────────────────────────────────────────────────────────────────────────
```typescript
import { test, expect } from '@playwright/test';
import AxeBuilder from '@axe-core/playwright';

test.describe('Accessibility', () => {
  test('should have no accessibility violations', async ({ page }) => {
    await page.goto('/');

    const results = await new AxeBuilder({ page })
      .withTags(['wcag2a', 'wcag2aa'])
      .analyze();

    expect(results.violations).toEqual([]);
  });

  test('should be keyboard navigable', async ({ page }) => {
    await page.goto('/');

    // Tab through interactive elements
    await page.keyboard.press('Tab');
    await expect(page.locator(':focus')).toHaveAttribute('data-testid', 'nav-home');

    await page.keyboard.press('Tab');
    await expect(page.locator(':focus')).toHaveAttribute('data-testid', 'nav-about');

    // Activate with keyboard
    await page.keyboard.press('Enter');
    await page.waitForURL('/about');
  });
});
```
```

---

## 45. TEST INFRASTRUCTURE

### 45.1 Test Organization

```
TEST ORGANIZATION
─────────────────────────────────────────────────────────────────────────────

APPROACH 1: CO-LOCATED TESTS (Recommended for components)
─────────────────────────────────────────────────────────────────────────────
src/
├── features/
│   └── auth/
│       ├── components/
│       │   ├── LoginForm.tsx
│       │   ├── LoginForm.test.tsx      # Co-located
│       │   └── LoginForm.stories.tsx   # Storybook
│       └── hooks/
│           ├── useAuth.ts
│           └── useAuth.test.ts         # Co-located

Benefits:
• Easy to find tests
• Tests update with component
• Clear ownership


APPROACH 2: SEPARATE TEST DIRECTORY (Recommended for integration/E2E)
─────────────────────────────────────────────────────────────────────────────
project/
├── src/
│   └── ...
├── tests/
│   ├── unit/                # Mirror of src/ structure
│   │   └── features/
│   │       └── auth/
│   ├── integration/         # API and service tests
│   │   ├── api/
│   │   │   ├── users.test.ts
│   │   │   └── orders.test.ts
│   │   └── services/
│   └── e2e/                 # End-to-end tests
│       ├── auth.spec.ts
│       ├── checkout.spec.ts
│       └── fixtures/
└── ...

Benefits:
• Clear separation by test type
• Different configs per type
• E2E can run independently


HYBRID APPROACH (Recommended overall):
─────────────────────────────────────────────────────────────────────────────
• Unit tests: Co-located with source
• Integration tests: tests/integration/
• E2E tests: tests/e2e/
• Shared fixtures: tests/fixtures/
• Test utilities: tests/utils/
```

### 45.2 Test Utilities and Fixtures

```
TEST UTILITIES AND FIXTURES
─────────────────────────────────────────────────────────────────────────────

FIXTURE FACTORY PATTERN:
─────────────────────────────────────────────────────────────────────────────
```typescript
// tests/fixtures/factories.ts

import { faker } from '@faker-js/faker';

export function createUser(overrides: Partial<User> = {}): User {
  return {
    id: faker.string.uuid(),
    email: faker.internet.email(),
    name: faker.person.fullName(),
    createdAt: new Date(),
    ...overrides,
  };
}

export function createOrder(overrides: Partial<Order> = {}): Order {
  return {
    id: faker.string.uuid(),
    userId: faker.string.uuid(),
    items: [],
    total: 0,
    status: 'pending',
    createdAt: new Date(),
    ...overrides,
  };
}

// Usage in tests
it('should calculate order total', () => {
  const order = createOrder({
    items: [
      { productId: '1', price: 100, quantity: 2 },
      { productId: '2', price: 50, quantity: 1 },
    ],
  });
  
  const total = calculateTotal(order);
  expect(total).toBe(250);
});
```

CUSTOM RENDER PATTERN (React):
─────────────────────────────────────────────────────────────────────────────
```typescript
// tests/utils/render.tsx

import { render, RenderOptions } from '@testing-library/react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { AuthProvider } from '@/features/auth';

interface CustomRenderOptions extends RenderOptions {
  user?: User;
  queryClient?: QueryClient;
}

export function customRender(
  ui: React.ReactElement,
  options: CustomRenderOptions = {}
) {
  const {
    user,
    queryClient = new QueryClient({
      defaultOptions: {
        queries: { retry: false },
      },
    }),
    ...renderOptions
  } = options;

  function Wrapper({ children }: { children: React.ReactNode }) {
    return (
      <QueryClientProvider client={queryClient}>
        <AuthProvider initialUser={user}>
          {children}
        </AuthProvider>
      </QueryClientProvider>
    );
  }

  return {
    ...render(ui, { wrapper: Wrapper, ...renderOptions }),
    queryClient,
  };
}

// Re-export everything
export * from '@testing-library/react';
export { customRender as render };
```

MOCK SERVICE WORKER SETUP:
─────────────────────────────────────────────────────────────────────────────
```typescript
// tests/mocks/handlers.ts

import { http, HttpResponse } from 'msw';

export const handlers = [
  http.get('/api/users/:id', ({ params }) => {
    return HttpResponse.json({
      data: {
        id: params.id,
        name: 'Test User',
        email: 'test@example.com',
      },
    });
  }),

  http.post('/api/users', async ({ request }) => {
    const body = await request.json();
    return HttpResponse.json(
      { data: { id: '123', ...body } },
      { status: 201 }
    );
  }),

  http.get('/api/users/:id', ({ params }) => {
    if (params.id === 'not-found') {
      return HttpResponse.json(
        { error: { code: 'NOT_FOUND' } },
        { status: 404 }
      );
    }
    // Default response
  }),
];

// tests/mocks/server.ts
import { setupServer } from 'msw/node';
import { handlers } from './handlers';

export const server = setupServer(...handlers);
```
```

### 45.3 CI Test Configuration

```
CI TEST CONFIGURATION
─────────────────────────────────────────────────────────────────────────────

GITHUB ACTIONS WORKFLOW:
─────────────────────────────────────────────────────────────────────────────
```yaml
# .github/workflows/test.yml

name: Test

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - run: npm ci
      - run: npm run test:unit -- --coverage
      
      - uses: codecov/codecov-action@v3
        with:
          files: ./coverage/lcov.info

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: postgres
        ports:
          - 5432:5432
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - run: npm ci
      - run: npm run db:migrate
        env:
          DATABASE_URL: postgres://postgres:postgres@localhost:5432/test
      - run: npm run test:integration
        env:
          DATABASE_URL: postgres://postgres:postgres@localhost:5432/test

  e2e-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - run: npm ci
      - run: npx playwright install --with-deps
      - run: npm run build
      - run: npm run test:e2e
      
      - uses: actions/upload-artifact@v3
        if: failure()
        with:
          name: playwright-report
          path: playwright-report/
```

NPM SCRIPTS CONFIGURATION:
─────────────────────────────────────────────────────────────────────────────
```json
{
  "scripts": {
    "test": "npm run test:unit && npm run test:integration",
    "test:unit": "vitest run",
    "test:unit:watch": "vitest",
    "test:unit:coverage": "vitest run --coverage",
    "test:integration": "vitest run --config vitest.integration.config.ts",
    "test:e2e": "playwright test",
    "test:e2e:ui": "playwright test --ui",
    "test:e2e:debug": "playwright test --debug"
  }
}
```
```

---

## PART IX SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                PART IX: TESTING & VERIFICATION FRAMEWORK                     │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  TESTING PYRAMID:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Unit (70%): Fast, isolated, many                                         │
│  • Integration (20%): Component interactions                                │
│  • E2E (10%): Critical user flows                                           │
│                                                                              │
│  TESTING PRINCIPLES:                                                         │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Test behavior, not implementation                                        │
│  • One assertion focus per test                                              │
│  • Tests should be independent                                               │
│  • Tests should be deterministic                                             │
│  • Tests are documentation                                                   │
│                                                                              │
│  COVERAGE THRESHOLDS:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Business logic: 80-95%                                                    │
│  • API endpoints: 80-90%                                                     │
│  • Utilities: 90-100%                                                        │
│  • UI components: 60-80%                                                     │
│  • Overall: 70-80%                                                           │
│  • Coverage is indicator, not goal                                           │
│                                                                              │
│  TESTING PATTERNS:                                                           │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Arrange-Act-Assert (AAA)                                                  │
│  • Table-driven tests                                                        │
│  • Fixture factories                                                         │
│  • Custom render utilities                                                   │
│  • Mock Service Worker                                                       │
│                                                                              │
│  TEST ORGANIZATION:                                                          │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Unit: Co-located with source                                              │
│  • Integration: tests/integration/                                           │
│  • E2E: tests/e2e/                                                          │
│  • Shared: tests/fixtures/, tests/utils/                                    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
