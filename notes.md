# Front End

## Performance

- Lazy load image & using webp
- Dynamic import
- Audit library
- SSR/SSG
- 3rd Script lazy loading
- Caching query (Apollo graphql/Tansatck query/SWR,Vue query)
- Optimize font load

## Security

- prevent XSS (Cross-Site Scripting) with not dangerouslySetInnerHTML or using DOMPurify
- save acc token to httponly cookie not localstorage/session
- careful for .env public prefix
- SCRF (Cross-Site Request Forgery) prevent with set this to cookie (SameSite=Lax / SameSite=Strict)
- For eksternal link to open new tab can be add some (rel="noopener noreferrer")

# Back END

## Security

- ORM / Non concated query SQL
- CORS with helmet
- Validation by ZOD/JOI
- using TLS 1.3/1.2
- OAuth2 for login system
- Short Lived JWT & Refresh token rotation
- Access always check user id / roles
- private network for database & API Gateway
- Secret manager (AWS Secret Manager / GCP Secret Manager)
- Automated Security Scanner di CI/CD (SonarQube, Snyk, atau GitHub Dependabot)
- WAF & Rate Limiting (Cloudflare / AWS WAF)
- PII Masking & Audit Log (Hide sensitive data for log)
- mTLS (microservice)

## Performance

- Rate Limiter (Redis)
- Optimize database query
- Caching by Redis
- Nginx / Reverse Proxy
- Search indexing (meilisearch/elasticsearch)
