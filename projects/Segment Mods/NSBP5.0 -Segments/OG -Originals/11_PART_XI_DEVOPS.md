# PART XI: DEVOPS & DEPLOYMENT

---

## 50. CI/CD PIPELINE ARCHITECTURE

> "If it's not automated, it's broken."

### 50.1 Pipeline Philosophy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      CI/CD PIPELINE PHILOSOPHY                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  CONTINUOUS INTEGRATION (CI)                                                 │
│  ───────────────────────────────────────────────────────────────────────    │
│  Automatically build and test every code change.                           │
│  Catch problems early, when they're cheap to fix.                          │
│                                                                              │
│  Every commit should:                                                        │
│  □ Compile/build successfully                                               │
│  □ Pass all automated tests                                                 │
│  □ Meet code quality standards                                               │
│  □ Have no security vulnerabilities                                         │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  CONTINUOUS DELIVERY (CD)                                                    │
│  ───────────────────────────────────────────────────────────────────────    │
│  Keep code always in a deployable state.                                   │
│  Deploy to production at any time with one button.                         │
│                                                                              │
│  Requirements:                                                               │
│  □ Automated deployment pipeline                                             │
│  □ Environment parity (staging ≈ production)                                │
│  □ Feature flags for incomplete features                                    │
│  □ Rollback capability                                                       │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  CONTINUOUS DEPLOYMENT (CD+)                                                 │
│  ───────────────────────────────────────────────────────────────────────    │
│  Automatically deploy every passing commit to production.                   │
│  No manual intervention required.                                            │
│                                                                              │
│  Prerequisites:                                                              │
│  □ Comprehensive automated testing                                           │
│  □ Robust monitoring and alerting                                            │
│  □ Automatic rollback on failures                                            │
│  □ Team confidence in automation                                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 50.2 Pipeline Stages

```
PIPELINE STAGES
─────────────────────────────────────────────────────────────────────────────

┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐
│  COMMIT │──►│  BUILD  │──►│  TEST   │──►│ DEPLOY  │──►│ VERIFY  │
│         │   │         │   │         │   │         │   │         │
│ • Push  │   │ • Install│  │ • Unit  │   │ • Stage │   │ • Smoke │
│ • PR    │   │ • Compile│  │ • Int.  │   │ • Prod  │   │ • Health│
│         │   │ • Lint   │   │ • E2E   │   │         │   │ • Perf  │
└─────────┘   └─────────┘   └─────────┘   └─────────┘   └─────────┘
     │             │             │             │             │
     │   < 1 min   │   < 5 min   │   < 10 min  │   < 5 min   │
     └─────────────┴─────────────┴─────────────┴─────────────┘

─────────────────────────────────────────────────────────────────────────────

STAGE 1: COMMIT CHECKS (< 1 minute)
─────────────────────────────────────────────────────────────────────────────
Purpose: Immediate feedback on code quality
Runs: On every push and PR

Steps:
□ Lint check (ESLint, Prettier)
□ Type check (TypeScript)
□ Commit message format
□ Branch naming convention


STAGE 2: BUILD (< 5 minutes)
─────────────────────────────────────────────────────────────────────────────
Purpose: Verify code compiles and bundles
Runs: On every push to main branches

Steps:
□ Install dependencies
□ Compile/transpile code
□ Build production bundle
□ Generate source maps
□ Build Docker image (if applicable)


STAGE 3: TEST (< 10 minutes)
─────────────────────────────────────────────────────────────────────────────
Purpose: Verify code correctness
Runs: On every push, required for merge

Steps:
□ Unit tests
□ Integration tests
□ Coverage check
□ Security scan (npm audit, Snyk)
□ E2E tests (on main/staging)


STAGE 4: DEPLOY (< 5 minutes)
─────────────────────────────────────────────────────────────────────────────
Purpose: Ship code to environment
Runs: On merge to main (staging), on release (production)

Steps:
□ Deploy to target environment
□ Run database migrations
□ Update environment variables
□ Clear caches (if needed)
□ Update CDN


STAGE 5: VERIFY (< 5 minutes)
─────────────────────────────────────────────────────────────────────────────
Purpose: Confirm deployment success
Runs: After every deployment

Steps:
□ Health checks
□ Smoke tests
□ Performance baseline
□ Error rate monitoring
□ Rollback if failed
```

### 50.3 GitHub Actions Configuration

```
GITHUB ACTIONS CONFIGURATION
─────────────────────────────────────────────────────────────────────────────

COMPLETE CI/CD WORKFLOW:
```yaml
# .github/workflows/ci-cd.yml

name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

env:
  NODE_VERSION: '20'
  
jobs:
  # ─────────────────────────────────────────────────────────────────
  # Stage 1: Quick Checks
  # ─────────────────────────────────────────────────────────────────
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      
      - run: npm ci
      - run: npm run lint
      - run: npm run typecheck

  # ─────────────────────────────────────────────────────────────────
  # Stage 2: Build
  # ─────────────────────────────────────────────────────────────────
  build:
    needs: lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      
      - run: npm ci
      - run: npm run build
      
      - uses: actions/upload-artifact@v4
        with:
          name: build-output
          path: .next/
          retention-days: 1

  # ─────────────────────────────────────────────────────────────────
  # Stage 3: Test
  # ─────────────────────────────────────────────────────────────────
  test-unit:
    needs: lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      
      - run: npm ci
      - run: npm run test:unit -- --coverage
      
      - uses: codecov/codecov-action@v4
        with:
          token: ${{ secrets.CODECOV_TOKEN }}

  test-integration:
    needs: build
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
    steps:
      - uses: actions/checkout@v4
      
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      
      - run: npm ci
      - run: npm run db:migrate
        env:
          DATABASE_URL: postgres://postgres:postgres@localhost:5432/test
      - run: npm run test:integration
        env:
          DATABASE_URL: postgres://postgres:postgres@localhost:5432/test

  test-e2e:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'
      
      - run: npm ci
      - run: npx playwright install --with-deps
      
      - uses: actions/download-artifact@v4
        with:
          name: build-output
          path: .next/
      
      - run: npm run test:e2e
      
      - uses: actions/upload-artifact@v4
        if: failure()
        with:
          name: playwright-report
          path: playwright-report/

  # ─────────────────────────────────────────────────────────────────
  # Stage 4: Deploy
  # ─────────────────────────────────────────────────────────────────
  deploy-staging:
    needs: [test-unit, test-integration, test-e2e]
    if: github.ref == 'refs/heads/develop'
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/checkout@v4
      
      - name: Deploy to Staging
        run: |
          # Deploy command here (Vercel, Railway, etc.)
          echo "Deploying to staging..."

  deploy-production:
    needs: [test-unit, test-integration, test-e2e]
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      
      - name: Deploy to Production
        run: |
          # Deploy command here
          echo "Deploying to production..."
      
      - name: Notify on Success
        if: success()
        run: |
          # Slack/Discord notification
          echo "Deployment successful!"
```
```

---

## 51. ENVIRONMENT MANAGEMENT

### 51.1 Environment Strategy

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       ENVIRONMENT STRATEGY                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ENVIRONMENT TYPES:                                                          │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ LOCAL (Development)                                                  │    │
│  │                                                                      │    │
│  │ Purpose: Individual developer work                                   │    │
│  │ Data: Seed data, local database                                      │    │
│  │ Access: Developer only                                               │    │
│  │ Deployment: Manual (npm run dev)                                     │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                              │                                               │
│                              ▼                                               │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ STAGING (Pre-Production)                                             │    │
│  │                                                                      │    │
│  │ Purpose: Testing before production                                   │    │
│  │ Data: Anonymized production data or realistic test data             │    │
│  │ Access: Team members                                                 │    │
│  │ Deployment: Automatic on develop branch                              │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                              │                                               │
│                              ▼                                               │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ PRODUCTION                                                           │    │
│  │                                                                      │    │
│  │ Purpose: Real users, real data                                       │    │
│  │ Data: Production data (protected)                                    │    │
│  │ Access: End users                                                    │    │
│  │ Deployment: Manual approval or auto on main                          │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  ENVIRONMENT PARITY PRINCIPLE:                                               │
│  Staging should be as close to production as possible.                      │
│  "Works on staging" should mean "works in production."                      │
│                                                                              │
│  Same:                                                                       │
│  • Operating system                                                          │
│  • Runtime version                                                           │
│  • Database version                                                          │
│  • Infrastructure architecture                                               │
│                                                                              │
│  Different:                                                                  │
│  • Scale (staging can be smaller)                                           │
│  • Data (staging uses anonymized/test data)                                 │
│  • Domain (staging.example.com vs example.com)                              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 51.2 Environment Configuration

```
ENVIRONMENT CONFIGURATION
─────────────────────────────────────────────────────────────────────────────

CONFIGURATION HIERARCHY:
─────────────────────────────────────────────────────────────────────────────
1. Default values (code)
2. Shared configuration (.env.example)
3. Environment-specific (.env.production)
4. Local overrides (.env.local)
5. Runtime environment variables

Priority: Higher number wins


FILE STRUCTURE:
─────────────────────────────────────────────────────────────────────────────
project/
├── .env.example          # Template, committed
├── .env.local            # Local overrides, NOT committed
├── .env.development      # Dev defaults, optional commit
├── .env.test             # Test environment, committed
├── .env.production       # Production template, secrets via platform
└── .env                   # Active environment, NOT committed


EXAMPLE CONFIGURATION:
─────────────────────────────────────────────────────────────────────────────
```bash
# .env.example (committed - template)
# Copy to .env.local and fill in values

# App
NODE_ENV=development
APP_URL=http://localhost:3000

# Database
DATABASE_URL=postgres://user:pass@localhost:5432/myapp

# Auth
JWT_SECRET=your-secret-here-min-32-chars
SESSION_SECRET=another-secret-here

# External Services
STRIPE_SECRET_KEY=sk_test_...
SENDGRID_API_KEY=SG...

# Feature Flags
ENABLE_NEW_DASHBOARD=false
```

```typescript
// src/config/env.ts
import { z } from 'zod';

const envSchema = z.object({
  // App
  NODE_ENV: z.enum(['development', 'test', 'production']),
  APP_URL: z.string().url(),
  
  // Database
  DATABASE_URL: z.string().url(),
  
  // Auth
  JWT_SECRET: z.string().min(32),
  SESSION_SECRET: z.string().min(32),
  
  // External Services
  STRIPE_SECRET_KEY: z.string().startsWith('sk_'),
  SENDGRID_API_KEY: z.string().optional(),
  
  // Feature Flags
  ENABLE_NEW_DASHBOARD: z.coerce.boolean().default(false),
});

export const env = envSchema.parse(process.env);
export type Env = z.infer<typeof envSchema>;
```
```

### 51.3 Feature Flags

```
FEATURE FLAGS
─────────────────────────────────────────────────────────────────────────────

PURPOSE:
─────────────────────────────────────────────────────────────────────────────
• Deploy code without releasing features
• Gradual rollouts (1% → 10% → 50% → 100%)
• A/B testing
• Kill switch for problematic features
• Environment-specific features


IMPLEMENTATION:
─────────────────────────────────────────────────────────────────────────────
```typescript
// Simple environment-based flags
const features = {
  newDashboard: process.env.ENABLE_NEW_DASHBOARD === 'true',
  betaFeatures: process.env.NODE_ENV !== 'production',
  debugMode: process.env.DEBUG === 'true',
};

// Usage
if (features.newDashboard) {
  return <NewDashboard />;
}
return <OldDashboard />;
```

```typescript
// More sophisticated feature flag system
interface FeatureFlag {
  name: string;
  enabled: boolean;
  rolloutPercentage?: number;
  allowedUsers?: string[];
  environments?: string[];
}

const flags: FeatureFlag[] = [
  {
    name: 'new-checkout',
    enabled: true,
    rolloutPercentage: 25, // 25% of users
  },
  {
    name: 'admin-dashboard-v2',
    enabled: true,
    allowedUsers: ['admin@company.com'],
  },
  {
    name: 'experimental-ai',
    enabled: true,
    environments: ['development', 'staging'],
  },
];

function isFeatureEnabled(
  flagName: string,
  context: { userId?: string; env: string }
): boolean {
  const flag = flags.find(f => f.name === flagName);
  
  if (!flag || !flag.enabled) return false;
  
  // Environment check
  if (flag.environments && !flag.environments.includes(context.env)) {
    return false;
  }
  
  // User allowlist
  if (flag.allowedUsers && context.userId) {
    return flag.allowedUsers.includes(context.userId);
  }
  
  // Percentage rollout
  if (flag.rolloutPercentage && context.userId) {
    const hash = simpleHash(context.userId + flagName);
    return (hash % 100) < flag.rolloutPercentage;
  }
  
  return true;
}
```
```

---

## 52. MONITORING & OBSERVABILITY

### 52.1 Observability Pillars

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      OBSERVABILITY PILLARS                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                           LOGS                                       │    │
│  │                    "What happened?"                                  │    │
│  │                                                                      │    │
│  │  • Discrete events with context                                      │    │
│  │  • Structured format (JSON)                                          │    │
│  │  • Levels: debug, info, warn, error                                 │    │
│  │  • Searchable and filterable                                         │    │
│  │                                                                      │    │
│  │  Tools: Datadog, Papertrail, LogDNA, CloudWatch                     │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                          METRICS                                     │    │
│  │                    "How much/many?"                                  │    │
│  │                                                                      │    │
│  │  • Numeric measurements over time                                    │    │
│  │  • Aggregatable (sum, avg, percentiles)                             │    │
│  │  • Alertable (threshold-based)                                       │    │
│  │  • Dashboard-friendly                                                │    │
│  │                                                                      │    │
│  │  Tools: Prometheus, Grafana, Datadog, CloudWatch                    │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │                          TRACES                                      │    │
│  │                    "What path did it take?"                          │    │
│  │                                                                      │    │
│  │  • Request flow across services                                      │    │
│  │  • Timing breakdown per operation                                    │    │
│  │  • Correlation IDs link related events                              │    │
│  │  • Bottleneck identification                                         │    │
│  │                                                                      │    │
│  │  Tools: Jaeger, Zipkin, Datadog APM, New Relic                      │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  COMBINED: Full picture of system behavior                                  │
│  Trace → find slow request → check logs → see metrics spike               │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 52.2 Logging Standards

```
LOGGING STANDARDS
─────────────────────────────────────────────────────────────────────────────

LOG LEVELS:
─────────────────────────────────────────────────────────────────────────────
ERROR   | Something failed, action needed
WARN    | Something unexpected, but handled
INFO    | Normal operations, business events
DEBUG   | Detailed debugging information

Production: INFO and above
Development: DEBUG and above


STRUCTURED LOGGING:
─────────────────────────────────────────────────────────────────────────────
```typescript
import pino from 'pino';

const logger = pino({
  level: process.env.LOG_LEVEL || 'info',
  formatters: {
    level: (label) => ({ level: label }),
  },
  base: {
    service: 'my-app',
    env: process.env.NODE_ENV,
  },
});

// Good: Structured log
logger.info({
  event: 'order_created',
  orderId: order.id,
  userId: user.id,
  total: order.total,
  items: order.items.length,
}, 'Order created successfully');

// Output:
// {
//   "level": "info",
//   "time": 1704067200000,
//   "service": "my-app",
//   "env": "production",
//   "event": "order_created",
//   "orderId": "ord_123",
//   "userId": "usr_456",
//   "total": 99.99,
//   "items": 3,
//   "msg": "Order created successfully"
// }

// Bad: Unstructured log
console.log(`Order ${order.id} created for user ${user.id} with total ${order.total}`);
```

LOGGING BEST PRACTICES:
─────────────────────────────────────────────────────────────────────────────
□ Use structured format (JSON)
□ Include correlation/request ID
□ Log at appropriate level
□ Include relevant context
□ Don't log sensitive data (passwords, tokens, PII)
□ Use consistent field names
□ Include timestamps
□ Log both success and failure


REQUEST LOGGING MIDDLEWARE:
─────────────────────────────────────────────────────────────────────────────
```typescript
function requestLogger(req: Request, res: Response, next: NextFunction) {
  const start = Date.now();
  const requestId = req.headers['x-request-id'] || uuidv4();
  
  // Attach to request for use in handlers
  req.requestId = requestId;
  
  res.on('finish', () => {
    const duration = Date.now() - start;
    
    logger.info({
      event: 'http_request',
      requestId,
      method: req.method,
      path: req.path,
      statusCode: res.statusCode,
      duration,
      userAgent: req.headers['user-agent'],
      userId: req.user?.id,
    });
  });
  
  next();
}
```
```

### 52.3 Alerting Strategy

```
ALERTING STRATEGY
─────────────────────────────────────────────────────────────────────────────

ALERT LEVELS:
─────────────────────────────────────────────────────────────────────────────
CRITICAL | Immediate action required    | Page on-call
HIGH     | Action needed soon           | Page during hours, notify off-hours
MEDIUM   | Action needed                | Notify, review next business day
LOW      | Informational                | Log, review weekly


ESSENTIAL ALERTS:
─────────────────────────────────────────────────────────────────────────────
CRITICAL:
□ Application down (health check fails)
□ Database unreachable
□ Error rate > 10%
□ Response time > 5 seconds
□ Security breach detected

HIGH:
□ Error rate > 5%
□ Response time > 2 seconds
□ Disk space < 10%
□ Memory usage > 90%
□ Failed deployments

MEDIUM:
□ Elevated error rate (> 1%)
□ Slow response times (> 1 second)
□ Certificate expiring (< 14 days)
□ Dependency deprecation warnings

LOW:
□ Unusual traffic patterns
□ Non-critical job failures
□ Cache hit rate drops


ALERT FATIGUE PREVENTION:
─────────────────────────────────────────────────────────────────────────────
□ Only alert on actionable issues
□ Include runbook link in alert
□ Set appropriate thresholds (not too sensitive)
□ Group related alerts
□ Implement alert deduplication
□ Review and tune regularly
□ Every alert should wake you up? If not, downgrade it


EXAMPLE ALERT CONFIGURATION:
─────────────────────────────────────────────────────────────────────────────
```yaml
# Datadog-style alert definition
alerts:
  - name: High Error Rate
    query: sum(last_5m):sum:http.errors{service:my-app} / sum:http.requests{service:my-app} > 0.05
    message: |
      Error rate is {{value}}% (threshold: 5%)
      
      Runbook: https://wiki.example.com/runbooks/high-error-rate
      Dashboard: https://dashboard.example.com/my-app
    notify:
      - "@slack-oncall"
      - "@pagerduty-high"
    
  - name: Application Health Check
    query: http.health_check{service:my-app} == 0
    message: |
      Health check failing for my-app
      
      Runbook: https://wiki.example.com/runbooks/app-down
    notify:
      - "@pagerduty-critical"
```
```

---

## 53. DEPLOYMENT STRATEGIES

### 53.1 Deployment Methods

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       DEPLOYMENT STRATEGIES                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ROLLING DEPLOYMENT                                                          │
│  ───────────────────────────────────────────────────────────────────────    │
│  Gradually replace old instances with new.                                  │
│                                                                              │
│  Before:  [v1] [v1] [v1] [v1]                                               │
│  During:  [v2] [v1] [v1] [v1] → [v2] [v2] [v1] [v1] → ...                  │
│  After:   [v2] [v2] [v2] [v2]                                               │
│                                                                              │
│  ✓ Zero downtime                                                             │
│  ✓ Gradual rollout                                                           │
│  ✗ Mixed versions during deploy                                             │
│  ✗ Rollback takes time                                                       │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  BLUE-GREEN DEPLOYMENT                                                       │
│  ───────────────────────────────────────────────────────────────────────    │
│  Two identical environments, switch traffic instantly.                      │
│                                                                              │
│  Blue (active):  [v1] [v1] [v1] [v1]  ◄── Traffic                           │
│  Green (idle):   [v2] [v2] [v2] [v2]                                        │
│                                                                              │
│  After switch:                                                               │
│  Blue (idle):    [v1] [v1] [v1] [v1]                                        │
│  Green (active): [v2] [v2] [v2] [v2]  ◄── Traffic                           │
│                                                                              │
│  ✓ Instant switch                                                            │
│  ✓ Easy rollback (switch back)                                              │
│  ✗ Requires double infrastructure                                           │
│  ✗ Database migrations tricky                                               │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  CANARY DEPLOYMENT                                                           │
│  ───────────────────────────────────────────────────────────────────────    │
│  Route small percentage of traffic to new version.                          │
│                                                                              │
│  [v1] [v1] [v1] [v1] [v1] [v1] [v1] [v1] [v1] [v2]                          │
│   90% traffic ────────────────────────────►  10%                            │
│                                                                              │
│  If healthy: gradually increase v2 percentage                               │
│  If problems: route all traffic back to v1                                  │
│                                                                              │
│  ✓ Low risk (only affects small %)                                         │
│  ✓ Real production testing                                                   │
│  ✗ More complex routing                                                      │
│  ✗ Need good metrics to compare                                             │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 53.2 Rollback Procedures

```
ROLLBACK PROCEDURES
─────────────────────────────────────────────────────────────────────────────

WHEN TO ROLLBACK:
─────────────────────────────────────────────────────────────────────────────
□ Error rate spikes above threshold
□ Response times degrade significantly
□ Critical functionality broken
□ Security vulnerability discovered
□ Data corruption detected

DECISION THRESHOLD:
If you're debating whether to rollback → rollback
It's easier to fix and redeploy than to debug in production


ROLLBACK CHECKLIST:
─────────────────────────────────────────────────────────────────────────────
□ 1. Confirm the issue is deployment-related
□ 2. Notify team of rollback decision
□ 3. Execute rollback command
□ 4. Verify rollback successful (health checks)
□ 5. Monitor metrics return to baseline
□ 6. Document incident
□ 7. Investigate root cause


ROLLBACK COMMANDS:
─────────────────────────────────────────────────────────────────────────────
```bash
# Vercel
vercel rollback

# Kubernetes
kubectl rollout undo deployment/my-app

# AWS ECS
aws ecs update-service --service my-service --task-definition my-app:previous

# Docker Compose
docker-compose up -d --no-deps my-app  # With previous image tag

# Database (if migration failed)
npm run db:rollback
```

PREVENTING ROLLBACK ISSUES:
─────────────────────────────────────────────────────────────────────────────
□ Keep deployments small (easier to identify problems)
□ Database migrations must be backward compatible
□ Feature flags for new functionality
□ Keep previous version running briefly
□ Test rollback procedure regularly
□ Automate rollback triggers
```

### 53.3 Database Migration Strategy

```
DATABASE MIGRATION STRATEGY
─────────────────────────────────────────────────────────────────────────────

ZERO-DOWNTIME MIGRATION RULES:
─────────────────────────────────────────────────────────────────────────────

RULE 1: ADDITIVE CHANGES ONLY
─────────────────────────────────────────────────────────────────────────────
Safe: Add column, add table, add index
Unsafe: Remove column, rename column, change type

For unsafe changes, use multi-step approach:
1. Add new column (deploy)
2. Migrate data, update code to use new column (deploy)
3. Remove old column (deploy after verification)


RULE 2: BACKWARD COMPATIBLE
─────────────────────────────────────────────────────────────────────────────
Old code must work with new schema.
New code must work with old schema.

This enables:
• Rolling deployments (mixed versions)
• Easy rollback (code rollback without DB rollback)


RULE 3: SEPARATE DEPLOY AND MIGRATE
─────────────────────────────────────────────────────────────────────────────
Don't run migrations as part of deployment.
Migrations should be a separate, controlled step.

```yaml
# CI/CD pipeline
deploy:
  steps:
    - name: Deploy new code
      run: deploy-to-production
    
    - name: Run migrations (manual approval)
      run: npm run db:migrate
      requires: manual-approval
```


EXAMPLE: RENAMING A COLUMN
─────────────────────────────────────────────────────────────────────────────
Goal: Rename `userName` to `displayName`

Step 1: Add new column (Migration 1)
```sql
ALTER TABLE users ADD COLUMN display_name VARCHAR(255);
```

Step 2: Deploy code that writes to both columns
```typescript
user.displayName = value;
user.userName = value; // Keep both in sync
```

Step 3: Backfill data (Migration 2)
```sql
UPDATE users SET display_name = user_name WHERE display_name IS NULL;
```

Step 4: Deploy code that reads from new column only
```typescript
const name = user.displayName;
```

Step 5: Remove old column (Migration 3)
```sql
ALTER TABLE users DROP COLUMN user_name;
```
```

---

## PART XI SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     PART XI: DEVOPS & DEPLOYMENT                             │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  CI/CD PIPELINE:                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Commit Checks (< 1 min): Lint, typecheck                                │
│  • Build (< 5 min): Compile, bundle                                        │
│  • Test (< 10 min): Unit, integration, E2E                                 │
│  • Deploy (< 5 min): Push to environment                                   │
│  • Verify (< 5 min): Health checks, smoke tests                            │
│                                                                              │
│  ENVIRONMENT MANAGEMENT:                                                     │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Local → Staging → Production                                             │
│  • Environment parity (staging ≈ production)                                │
│  • Secrets in environment variables / secrets manager                       │
│  • Feature flags for gradual rollout                                        │
│                                                                              │
│  MONITORING & OBSERVABILITY:                                                 │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Three pillars: Logs, Metrics, Traces                                    │
│  • Structured logging (JSON)                                                 │
│  • Actionable alerts only                                                    │
│  • Include runbook links in alerts                                           │
│                                                                              │
│  DEPLOYMENT STRATEGIES:                                                      │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Rolling: Gradual replacement                                              │
│  • Blue-Green: Instant switch, easy rollback                                │
│  • Canary: Small % first, then expand                                       │
│  • If debating rollback → rollback                                          │
│                                                                              │
│  DATABASE MIGRATIONS:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Additive changes only                                                     │
│  • Backward compatible                                                       │
│  • Multi-step for breaking changes                                           │
│  • Separate from deployment                                                  │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
