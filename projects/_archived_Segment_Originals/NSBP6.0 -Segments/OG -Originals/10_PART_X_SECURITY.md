# PART X: SECURITY & AUTHENTICATION

---

## 46. SECURITY-FIRST DEVELOPMENT

> "Security is not a feature—it's a requirement."

### 46.1 Security Principles

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      SECURITY-FIRST PRINCIPLES                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  PRINCIPLE 1: DEFENSE IN DEPTH                                               │
│  ───────────────────────────────────────────────────────────────────────    │
│  Multiple layers of security, not just one.                                │
│  If one layer fails, others still protect.                                  │
│                                                                              │
│  Layers:                                                                     │
│  • Network (firewall, WAF)                                                  │
│  • Application (auth, input validation)                                     │
│  • Data (encryption, access control)                                        │
│  • Monitoring (logging, alerting)                                           │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 2: LEAST PRIVILEGE                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│  Grant minimum access needed to perform a function.                         │
│  Remove access when no longer needed.                                       │
│                                                                              │
│  Applications:                                                               │
│  • Database users with limited permissions                                  │
│  • API keys with scoped access                                              │
│  • User roles with specific capabilities                                    │
│  • Service accounts with minimal rights                                     │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 3: NEVER TRUST INPUT                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  All input is potentially malicious.                                        │
│  Validate, sanitize, escape everything.                                     │
│                                                                              │
│  Trust boundaries:                                                           │
│  • User input (forms, URLs, uploads)                                        │
│  • API responses (external services)                                        │
│  • Database content (could be previously compromised)                       │
│  • Environment variables (could be misconfigured)                           │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 4: SECURE BY DEFAULT                                              │
│  ───────────────────────────────────────────────────────────────────────    │
│  Default settings should be secure.                                        │
│  Insecure options require explicit opt-in.                                  │
│                                                                              │
│  Examples:                                                                   │
│  • HTTPS required by default                                                │
│  • Cookies httpOnly and secure by default                                   │
│  • CORS restrictive by default                                              │
│  • Passwords must meet complexity by default                                │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  PRINCIPLE 5: FAIL SECURE                                                    │
│  ───────────────────────────────────────────────────────────────────────    │
│  When something fails, fail to a secure state.                             │
│  Deny by default, allow explicitly.                                         │
│                                                                              │
│  Examples:                                                                   │
│  • If auth check fails → deny access                                        │
│  • If input validation fails → reject request                               │
│  • If service unavailable → show error, don't bypass                        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 46.2 OWASP Top 10 Checklist

```
OWASP TOP 10 PREVENTION CHECKLIST
─────────────────────────────────────────────────────────────────────────────

1. BROKEN ACCESS CONTROL
─────────────────────────────────────────────────────────────────────────────
□ Deny access by default
□ Implement access control checks at every endpoint
□ Validate user ownership of resources
□ Disable directory listing
□ Log access control failures
□ Rate limit API access

2. CRYPTOGRAPHIC FAILURES
─────────────────────────────────────────────────────────────────────────────
□ Identify sensitive data (PII, financial, health)
□ Encrypt sensitive data at rest
□ Use TLS for data in transit
□ Use strong, up-to-date algorithms
□ Never store passwords in plain text
□ Use proper key management

3. INJECTION
─────────────────────────────────────────────────────────────────────────────
□ Use parameterized queries (never string concatenation)
□ Validate and sanitize all input
□ Escape output appropriately
□ Use ORM/prepared statements
□ Limit database permissions

4. INSECURE DESIGN
─────────────────────────────────────────────────────────────────────────────
□ Use threat modeling
□ Secure development lifecycle
□ Library of security patterns
□ Unit and integration tests for security
□ Plausibility checks (rate limits, max values)

5. SECURITY MISCONFIGURATION
─────────────────────────────────────────────────────────────────────────────
□ Minimal platform (remove unused features)
□ Secure defaults everywhere
□ No default credentials
□ Error handling doesn't leak info
□ Security headers configured
□ Regular updates and patches

6. VULNERABLE COMPONENTS
─────────────────────────────────────────────────────────────────────────────
□ Know your dependencies
□ Remove unused dependencies
□ Use only official sources
□ Monitor for vulnerabilities (npm audit, Dependabot)
□ Have update process

7. AUTHENTICATION FAILURES
─────────────────────────────────────────────────────────────────────────────
□ Multi-factor authentication available
□ No default/weak credentials
□ Secure password recovery
□ Session management secure
□ Brute force protection
□ Proper session invalidation on logout

8. SOFTWARE/DATA INTEGRITY FAILURES
─────────────────────────────────────────────────────────────────────────────
□ Verify software integrity (signatures, checksums)
□ Use trusted repositories
□ CI/CD pipeline security
□ Unsigned/unencrypted serialized data validated

9. LOGGING/MONITORING FAILURES
─────────────────────────────────────────────────────────────────────────────
□ Log authentication events
□ Log access control failures
□ Log input validation failures
□ Ensure logs are tamper-proof
□ Alerting for suspicious activity
□ Incident response plan

10. SERVER-SIDE REQUEST FORGERY (SSRF)
─────────────────────────────────────────────────────────────────────────────
□ Validate and sanitize URLs
□ Allowlist permitted domains
□ Disable HTTP redirects if possible
□ Block requests to internal networks
□ Don't send raw responses to clients
```

### 46.3 Security Headers Configuration

```
SECURITY HEADERS CONFIGURATION
─────────────────────────────────────────────────────────────────────────────

ESSENTIAL HEADERS:
```typescript
// Next.js example (next.config.js)
const securityHeaders = [
  {
    key: 'X-DNS-Prefetch-Control',
    value: 'on'
  },
  {
    key: 'Strict-Transport-Security',
    value: 'max-age=63072000; includeSubDomains; preload'
  },
  {
    key: 'X-Frame-Options',
    value: 'SAMEORIGIN'
  },
  {
    key: 'X-Content-Type-Options',
    value: 'nosniff'
  },
  {
    key: 'Referrer-Policy',
    value: 'origin-when-cross-origin'
  },
  {
    key: 'Permissions-Policy',
    value: 'camera=(), microphone=(), geolocation=()'
  },
  {
    key: 'Content-Security-Policy',
    value: `
      default-src 'self';
      script-src 'self' 'unsafe-inline' 'unsafe-eval';
      style-src 'self' 'unsafe-inline';
      img-src 'self' data: https:;
      font-src 'self';
      connect-src 'self' https://api.example.com;
      frame-ancestors 'none';
    `.replace(/\s{2,}/g, ' ').trim()
  }
];

module.exports = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: securityHeaders,
      },
    ];
  },
};
```

HEADER EXPLANATIONS:
─────────────────────────────────────────────────────────────────────────────
Strict-Transport-Security (HSTS)
  Forces HTTPS connections
  
X-Frame-Options
  Prevents clickjacking (being embedded in iframes)
  
X-Content-Type-Options
  Prevents MIME type sniffing
  
Content-Security-Policy (CSP)
  Controls what resources can be loaded
  Prevents XSS attacks
  
Referrer-Policy
  Controls what referrer info is sent
  
Permissions-Policy
  Controls which browser features can be used
```

---

## 47. AUTHENTICATION PATTERNS

### 47.1 Authentication Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                     AUTHENTICATION ARCHITECTURE                              │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  AUTHENTICATION METHODS:                                                     │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ SESSION-BASED                                                        │    │
│  │                                                                      │    │
│  │ User ──login──► Server                                               │    │
│  │                   │                                                  │    │
│  │                   ├── Create session in store                        │    │
│  │                   ├── Set session ID cookie                          │    │
│  │                   │                                                  │    │
│  │ User ◄──cookie────┘                                                  │    │
│  │                                                                      │    │
│  │ BEST FOR: Traditional web apps, server-rendered                     │    │
│  │ PROS: Simple, secure, easy revocation                               │    │
│  │ CONS: Server state, scaling challenges                              │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ TOKEN-BASED (JWT)                                                    │    │
│  │                                                                      │    │
│  │ User ──login──► Server                                               │    │
│  │                   │                                                  │    │
│  │                   ├── Generate signed JWT                            │    │
│  │                   ├── Return token to client                         │    │
│  │                   │                                                  │    │
│  │ User ◄──token─────┘                                                  │    │
│  │   │                                                                  │    │
│  │   └── Stores token (httpOnly cookie or memory)                      │    │
│  │                                                                      │    │
│  │ BEST FOR: SPAs, mobile apps, microservices                          │    │
│  │ PROS: Stateless, scalable, cross-domain                             │    │
│  │ CONS: Can't easily revoke, size overhead                            │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
│  ┌─────────────────────────────────────────────────────────────────────┐    │
│  │ OAUTH 2.0 / OIDC                                                     │    │
│  │                                                                      │    │
│  │ User ──login──► App ──redirect──► Provider (Google, GitHub)         │    │
│  │                                       │                              │    │
│  │                                       ├── User authenticates        │    │
│  │                                       ├── Provider redirects back   │    │
│  │                                       │                              │    │
│  │ User ◄─────────────────────────────────┘                            │    │
│  │                                                                      │    │
│  │ BEST FOR: Social login, enterprise SSO                              │    │
│  │ PROS: No password management, trusted providers                     │    │
│  │ CONS: Dependency on provider, complexity                            │    │
│  └─────────────────────────────────────────────────────────────────────┘    │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 47.2 Password Security

```
PASSWORD SECURITY
─────────────────────────────────────────────────────────────────────────────

PASSWORD REQUIREMENTS:
─────────────────────────────────────────────────────────────────────────────
□ Minimum 12 characters (NIST recommends 8 minimum)
□ Allow up to 128 characters
□ Allow all printable characters
□ Check against common password lists
□ Check against breached password databases
□ Show strength meter
□ Don't require arbitrary complexity rules

PASSWORD HASHING:
─────────────────────────────────────────────────────────────────────────────
```typescript
import { hash, verify } from '@node-rs/argon2';

// Hash password for storage
async function hashPassword(password: string): Promise<string> {
  return hash(password, {
    memoryCost: 19456,  // 19 MiB
    timeCost: 2,        // 2 iterations
    parallelism: 1,     // 1 thread
  });
}

// Verify password against stored hash
async function verifyPassword(
  password: string, 
  storedHash: string
): Promise<boolean> {
  return verify(storedHash, password);
}

// Alternative: bcrypt (widely used)
import bcrypt from 'bcrypt';

const SALT_ROUNDS = 12;

async function hashPasswordBcrypt(password: string): Promise<string> {
  return bcrypt.hash(password, SALT_ROUNDS);
}
```

PASSWORD RESET FLOW:
─────────────────────────────────────────────────────────────────────────────
1. User requests reset with email
2. Generate cryptographically random token
3. Store token hash with expiration (15-60 minutes)
4. Send email with reset link containing token
5. User clicks link, enters new password
6. Verify token, hash new password, invalidate token
7. Invalidate all existing sessions
8. Send confirmation email

```typescript
import { randomBytes, createHash } from 'crypto';

function generateResetToken(): { token: string; hash: string } {
  const token = randomBytes(32).toString('hex');
  const hash = createHash('sha256').update(token).digest('hex');
  return { token, hash };
}

async function createPasswordReset(email: string) {
  const user = await findUserByEmail(email);
  if (!user) return; // Don't reveal if email exists

  const { token, hash } = generateResetToken();
  
  await db.passwordResets.create({
    userId: user.id,
    tokenHash: hash,
    expiresAt: new Date(Date.now() + 60 * 60 * 1000), // 1 hour
  });

  await sendEmail(email, `Reset: ${BASE_URL}/reset?token=${token}`);
}
```
```

### 47.3 JWT Implementation

```
JWT IMPLEMENTATION
─────────────────────────────────────────────────────────────────────────────

JWT STRUCTURE:
─────────────────────────────────────────────────────────────────────────────
Header: Algorithm and token type
{
  "alg": "HS256",
  "typ": "JWT"
}

Payload: Claims (data)
{
  "sub": "user-id-123",        // Subject (user ID)
  "iat": 1704067200,           // Issued at
  "exp": 1704153600,           // Expiration
  "role": "user"               // Custom claims
}

Signature: Verification
HMACSHA256(base64(header) + "." + base64(payload), secret)


JWT BEST PRACTICES:
─────────────────────────────────────────────────────────────────────────────
□ Use short expiration (15 min access, 7 day refresh)
□ Store in httpOnly cookie (not localStorage)
□ Use refresh token rotation
□ Include minimal claims
□ Use strong secret (256+ bits)
□ Consider RS256 for distributed systems


IMPLEMENTATION:
─────────────────────────────────────────────────────────────────────────────
```typescript
import jwt from 'jsonwebtoken';

const ACCESS_SECRET = process.env.JWT_ACCESS_SECRET!;
const REFRESH_SECRET = process.env.JWT_REFRESH_SECRET!;

interface TokenPayload {
  sub: string;
  role: string;
}

function generateAccessToken(user: User): string {
  return jwt.sign(
    { sub: user.id, role: user.role },
    ACCESS_SECRET,
    { expiresIn: '15m' }
  );
}

function generateRefreshToken(user: User): string {
  return jwt.sign(
    { sub: user.id },
    REFRESH_SECRET,
    { expiresIn: '7d' }
  );
}

function verifyAccessToken(token: string): TokenPayload {
  return jwt.verify(token, ACCESS_SECRET) as TokenPayload;
}

// Cookie settings
const cookieOptions = {
  httpOnly: true,
  secure: process.env.NODE_ENV === 'production',
  sameSite: 'lax' as const,
  path: '/',
};

// Set tokens in cookies
res.cookie('accessToken', accessToken, {
  ...cookieOptions,
  maxAge: 15 * 60 * 1000, // 15 minutes
});

res.cookie('refreshToken', refreshToken, {
  ...cookieOptions,
  maxAge: 7 * 24 * 60 * 60 * 1000, // 7 days
  path: '/api/auth/refresh', // Only sent to refresh endpoint
});
```
```

---

## 48. AUTHORIZATION & ACCESS CONTROL

### 48.1 Authorization Models

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       AUTHORIZATION MODELS                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  ROLE-BASED ACCESS CONTROL (RBAC)                                           │
│  ───────────────────────────────────────────────────────────────────────    │
│  Users are assigned roles, roles have permissions.                         │
│                                                                              │
│  User ───► Role ───► Permissions                                            │
│                                                                              │
│  Example:                                                                    │
│  ┌─────────┐     ┌─────────┐     ┌──────────────────┐                       │
│  │  Alice  │────►│  Admin  │────►│ users:read       │                       │
│  └─────────┘     └─────────┘     │ users:write      │                       │
│                                  │ orders:read      │                       │
│  ┌─────────┐     ┌─────────┐     │ orders:write     │                       │
│  │   Bob   │────►│  User   │────►│ settings:manage  │                       │
│  └─────────┘     └─────────┘     └──────────────────┘                       │
│                        │                                                    │
│                        └────►┌──────────────────┐                           │
│                              │ orders:read      │                           │
│                              │ orders:write     │                           │
│                              │ (own only)       │                           │
│                              └──────────────────┘                           │
│                                                                              │
│  BEST FOR: Applications with clear role hierarchies                        │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  ATTRIBUTE-BASED ACCESS CONTROL (ABAC)                                      │
│  ───────────────────────────────────────────────────────────────────────    │
│  Permissions based on attributes of user, resource, and context.           │
│                                                                              │
│  Policy: "Allow if user.department == resource.department                   │
│           AND context.time is business hours"                               │
│                                                                              │
│  BEST FOR: Complex, context-dependent access rules                          │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  RESOURCE-BASED ACCESS CONTROL                                               │
│  ───────────────────────────────────────────────────────────────────────    │
│  Permissions attached directly to resources.                                │
│                                                                              │
│  Resource: Document XYZ                                                      │
│  └── owner: Alice (full access)                                             │
│  └── editors: [Bob, Carol] (read/write)                                     │
│  └── viewers: [Dan, Eve] (read only)                                        │
│                                                                              │
│  BEST FOR: User-generated content, shared resources                        │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 48.2 Authorization Implementation

```
AUTHORIZATION IMPLEMENTATION
─────────────────────────────────────────────────────────────────────────────

ROLE-BASED MIDDLEWARE:
─────────────────────────────────────────────────────────────────────────────
```typescript
// types.ts
type Role = 'admin' | 'manager' | 'user' | 'guest';

type Permission = 
  | 'users:read' | 'users:write' | 'users:delete'
  | 'orders:read' | 'orders:write' | 'orders:delete'
  | 'settings:read' | 'settings:write';

const ROLE_PERMISSIONS: Record<Role, Permission[]> = {
  admin: [
    'users:read', 'users:write', 'users:delete',
    'orders:read', 'orders:write', 'orders:delete',
    'settings:read', 'settings:write',
  ],
  manager: [
    'users:read',
    'orders:read', 'orders:write',
    'settings:read',
  ],
  user: [
    'orders:read', 'orders:write',
  ],
  guest: [
    'orders:read',
  ],
};

// middleware.ts
function hasPermission(role: Role, permission: Permission): boolean {
  return ROLE_PERMISSIONS[role]?.includes(permission) ?? false;
}

function requirePermission(permission: Permission) {
  return (req: Request, res: Response, next: NextFunction) => {
    const user = req.user;
    
    if (!user) {
      return res.status(401).json({ error: 'Unauthorized' });
    }
    
    if (!hasPermission(user.role, permission)) {
      return res.status(403).json({ error: 'Forbidden' });
    }
    
    next();
  };
}

// Usage
app.get('/api/users', requirePermission('users:read'), getUsers);
app.post('/api/users', requirePermission('users:write'), createUser);
app.delete('/api/users/:id', requirePermission('users:delete'), deleteUser);
```

RESOURCE OWNERSHIP CHECK:
─────────────────────────────────────────────────────────────────────────────
```typescript
// Check if user can access a specific resource
async function canAccessOrder(userId: string, orderId: string): Promise<boolean> {
  const order = await db.orders.findById(orderId);
  
  if (!order) return false;
  
  // Owner can always access
  if (order.userId === userId) return true;
  
  // Check if user is admin
  const user = await db.users.findById(userId);
  if (user?.role === 'admin') return true;
  
  // Check if user is assigned to this order
  const assignment = await db.orderAssignments.find({
    orderId,
    userId,
  });
  
  return !!assignment;
}

// Middleware using ownership check
async function requireOrderAccess(req: Request, res: Response, next: NextFunction) {
  const { orderId } = req.params;
  const userId = req.user?.id;
  
  if (!userId) {
    return res.status(401).json({ error: 'Unauthorized' });
  }
  
  const canAccess = await canAccessOrder(userId, orderId);
  
  if (!canAccess) {
    return res.status(403).json({ error: 'Forbidden' });
  }
  
  next();
}
```
```

### 48.3 API Security

```
API SECURITY
─────────────────────────────────────────────────────────────────────────────

RATE LIMITING:
─────────────────────────────────────────────────────────────────────────────
```typescript
import rateLimit from 'express-rate-limit';
import RedisStore from 'rate-limit-redis';
import Redis from 'ioredis';

const redis = new Redis(process.env.REDIS_URL);

// General API rate limit
const apiLimiter = rateLimit({
  store: new RedisStore({
    sendCommand: (...args) => redis.call(...args),
  }),
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // 100 requests per window
  message: { error: 'Too many requests' },
});

// Stricter limit for auth endpoints
const authLimiter = rateLimit({
  store: new RedisStore({
    sendCommand: (...args) => redis.call(...args),
  }),
  windowMs: 60 * 60 * 1000, // 1 hour
  max: 5, // 5 attempts per hour
  message: { error: 'Too many login attempts' },
});

app.use('/api/', apiLimiter);
app.use('/api/auth/login', authLimiter);
```

INPUT VALIDATION:
─────────────────────────────────────────────────────────────────────────────
```typescript
import { z } from 'zod';

// Define schema
const createUserSchema = z.object({
  email: z.string().email(),
  password: z.string().min(12).max(128),
  name: z.string().min(1).max(100),
});

// Validation middleware
function validateBody<T>(schema: z.ZodSchema<T>) {
  return (req: Request, res: Response, next: NextFunction) => {
    const result = schema.safeParse(req.body);
    
    if (!result.success) {
      return res.status(422).json({
        error: 'Validation failed',
        details: result.error.issues,
      });
    }
    
    req.body = result.data;
    next();
  };
}

// Usage
app.post('/api/users', validateBody(createUserSchema), createUser);
```

SQL INJECTION PREVENTION:
─────────────────────────────────────────────────────────────────────────────
```typescript
// BAD: String concatenation (vulnerable)
const query = `SELECT * FROM users WHERE id = '${userId}'`;

// GOOD: Parameterized query
const result = await db.query(
  'SELECT * FROM users WHERE id = $1',
  [userId]
);

// GOOD: Using ORM/Query builder
const user = await db.users.findUnique({
  where: { id: userId },
});
```

XSS PREVENTION:
─────────────────────────────────────────────────────────────────────────────
```typescript
// React automatically escapes content
<div>{userInput}</div> // Safe

// DANGEROUS: dangerouslySetInnerHTML
<div dangerouslySetInnerHTML={{ __html: userInput }} /> // Unsafe!

// If you must use HTML, sanitize it
import DOMPurify from 'dompurify';
<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userInput) }} />
```
```

---

## 49. DATA PROTECTION

### 49.1 Encryption Standards

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       ENCRYPTION STANDARDS                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  DATA AT REST                                                                │
│  ───────────────────────────────────────────────────────────────────────    │
│  Data stored in databases, files, backups.                                  │
│                                                                              │
│  Requirements:                                                               │
│  □ Database encryption (transparent or field-level)                        │
│  □ Backup encryption                                                        │
│  □ File storage encryption                                                  │
│  □ Key management system                                                    │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  DATA IN TRANSIT                                                             │
│  ───────────────────────────────────────────────────────────────────────    │
│  Data moving between systems.                                               │
│                                                                              │
│  Requirements:                                                               │
│  □ TLS 1.3 (or 1.2 minimum)                                                │
│  □ Valid certificates                                                       │
│  □ HSTS enabled                                                             │
│  □ Certificate pinning (mobile apps)                                        │
│                                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                              │
│  FIELD-LEVEL ENCRYPTION                                                      │
│  ───────────────────────────────────────────────────────────────────────    │
│  Encrypt specific sensitive fields.                                        │
│                                                                              │
│  Use for:                                                                    │
│  • Social security numbers                                                   │
│  • Credit card numbers                                                       │
│  • Health information                                                        │
│  • Personal identification                                                   │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 49.2 Encryption Implementation

```
ENCRYPTION IMPLEMENTATION
─────────────────────────────────────────────────────────────────────────────

FIELD-LEVEL ENCRYPTION:
─────────────────────────────────────────────────────────────────────────────
```typescript
import { createCipheriv, createDecipheriv, randomBytes } from 'crypto';

const ALGORITHM = 'aes-256-gcm';
const KEY = Buffer.from(process.env.ENCRYPTION_KEY!, 'hex'); // 32 bytes

interface EncryptedData {
  iv: string;
  data: string;
  tag: string;
}

function encrypt(text: string): EncryptedData {
  const iv = randomBytes(16);
  const cipher = createCipheriv(ALGORITHM, KEY, iv);
  
  let encrypted = cipher.update(text, 'utf8', 'hex');
  encrypted += cipher.final('hex');
  
  return {
    iv: iv.toString('hex'),
    data: encrypted,
    tag: cipher.getAuthTag().toString('hex'),
  };
}

function decrypt(encrypted: EncryptedData): string {
  const decipher = createDecipheriv(
    ALGORITHM,
    KEY,
    Buffer.from(encrypted.iv, 'hex')
  );
  
  decipher.setAuthTag(Buffer.from(encrypted.tag, 'hex'));
  
  let decrypted = decipher.update(encrypted.data, 'hex', 'utf8');
  decrypted += decipher.final('utf8');
  
  return decrypted;
}

// Usage
const ssn = '123-45-6789';
const encrypted = encrypt(ssn);
// Store encrypted.iv, encrypted.data, encrypted.tag

const decrypted = decrypt(encrypted);
// decrypted === '123-45-6789'
```

HASHING (One-Way):
─────────────────────────────────────────────────────────────────────────────
```typescript
import { createHash, timingSafeEqual } from 'crypto';

// For non-password data that needs verification
function hashData(data: string): string {
  return createHash('sha256').update(data).digest('hex');
}

// Timing-safe comparison to prevent timing attacks
function verifyHash(data: string, hash: string): boolean {
  const dataHash = hashData(data);
  return timingSafeEqual(
    Buffer.from(dataHash),
    Buffer.from(hash)
  );
}
```
```

### 49.3 Secrets Management

```
SECRETS MANAGEMENT
─────────────────────────────────────────────────────────────────────────────

RULES:
─────────────────────────────────────────────────────────────────────────────
□ NEVER commit secrets to version control
□ NEVER log secrets
□ NEVER expose secrets in error messages
□ NEVER hardcode secrets in code
□ Use environment variables for configuration
□ Use secrets manager for production

ENVIRONMENT VARIABLES:
─────────────────────────────────────────────────────────────────────────────
```bash
# .env.local (never commit)
DATABASE_URL=postgres://user:pass@localhost:5432/db
JWT_SECRET=your-256-bit-secret
ENCRYPTION_KEY=your-32-byte-hex-key
API_KEY=external-service-api-key
```

```typescript
// Config validation at startup
import { z } from 'zod';

const envSchema = z.object({
  DATABASE_URL: z.string().url(),
  JWT_SECRET: z.string().min(32),
  ENCRYPTION_KEY: z.string().length(64), // 32 bytes in hex
  NODE_ENV: z.enum(['development', 'test', 'production']),
});

const env = envSchema.parse(process.env);
export { env };
```

GITIGNORE REQUIREMENTS:
─────────────────────────────────────────────────────────────────────────────
```gitignore
# Environment files
.env
.env.local
.env.*.local
.env.development
.env.production

# Key files
*.pem
*.key
*.p12

# IDE secrets
.idea/
.vscode/settings.json
```

SECRET ROTATION:
─────────────────────────────────────────────────────────────────────────────
□ Rotate secrets periodically (90 days recommended)
□ Rotate immediately if compromised
□ Support multiple active secrets during rotation
□ Automate rotation where possible
□ Document rotation procedures
```

---

## PART X SUMMARY

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                 PART X: SECURITY & AUTHENTICATION                            │
│                           KEY TAKEAWAYS                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│  SECURITY PRINCIPLES:                                                        │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Defense in depth (multiple layers)                                       │
│  • Least privilege (minimum access)                                          │
│  • Never trust input                                                         │
│  • Secure by default                                                         │
│  • Fail secure                                                               │
│                                                                              │
│  OWASP TOP 10:                                                               │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Broken access control → Deny by default                                  │
│  • Cryptographic failures → Encrypt sensitive data                          │
│  • Injection → Parameterized queries                                        │
│  • Security misconfiguration → Secure defaults                              │
│  • Vulnerable components → Monitor dependencies                              │
│                                                                              │
│  AUTHENTICATION:                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • Session-based for traditional apps                                        │
│  • JWT for SPAs/mobile (httpOnly cookies)                                   │
│  • OAuth for social/enterprise SSO                                          │
│  • Passwords: Argon2 or bcrypt, 12+ characters                              │
│  • Short access tokens, refresh token rotation                              │
│                                                                              │
│  AUTHORIZATION:                                                              │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • RBAC for clear role hierarchies                                          │
│  • Resource ownership checks                                                 │
│  • Check at every endpoint                                                   │
│  • Deny by default                                                           │
│                                                                              │
│  DATA PROTECTION:                                                            │
│  ─────────────────────────────────────────────────────────────────────────  │
│  • TLS for transit, encryption for rest                                     │
│  • Field-level encryption for sensitive data                                │
│  • Never commit secrets to git                                               │
│  • Use environment variables / secrets managers                              │
│  • Rotate secrets regularly                                                  │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---
