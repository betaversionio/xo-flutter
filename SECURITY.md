# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 0.1.x   | ✅ |

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Report via:

1. **GitHub Security Advisory** (preferred) — Security tab → "Report a vulnerability"
2. **Email** — security@betaversion.io with subject line `[SECURITY] xo-flutter`

### What to include

- Type of vulnerability
- Affected file(s) and location (tag / branch / commit)
- Steps to reproduce
- Proof-of-concept or exploit code if available
- Suggested fix if you have one

### Response timeline

| Severity | Fix target |
|----------|-----------|
| Critical | 1–7 days |
| High | 7–30 days |
| Medium | 30–90 days |
| Low | Best effort |

We will confirm receipt within 48 hours and credit you in the release notes unless you prefer to stay anonymous.

## Generated code

xo-flutter generates starter code. Users are responsible for the security of apps built from it. Key things to review before shipping:

- Replace placeholder `.env` values with real secrets via a secret manager — never commit them
- The generated `DioClient` logs full requests in debug mode (`kDebugMode`) — verify this is disabled in release builds
- The generated `FlutterSecureStorage` uses default Android/iOS keystore options — harden for your threat model
- Firebase credentials (`google-services.json` / `GoogleService-Info.plist`) should be gitignored in production repos

## Contact

security@betaversion.io
