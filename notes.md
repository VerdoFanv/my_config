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

Sembunyikan IP Asli & Kunci Edge: Taruh server di balik WAF/CDN (seperti Cloudflare) dan batasi port 80/443 agar hanya menerima trafik dari IP Edge tersebut.

Firewall Default-Deny & SSH Ketat: Tutup semua port kecuali yang diperlukan, wajibkan SSH key (tanpa login password/root), dan pastikan port database/Redis (3306, 6379) tidak pernah terekspos ke 0.0.0.0 (waspada bypass iptables Docker).

TLS Modern & Hardening Reverse Proxy: Paksa HTTPS (TLS 1.2/1.3 + HSTS), pasang rate limit, batasi ukuran body request, aktifkan timeout anti-Slowloris, timpa header X-Forwarded-*, dan matikan identitas versi server (server_tokens off).

Isolasi Jaringan Internal & Least-Privilege DB: Taruh database/cache di jaringan internal Docker tanpa akses internet (internal: true) dan hubungkan aplikasi memakai user database non-root dengan hak akses minimum.

Runtime Container Terkunci: Jalankan aplikasi sebagai user non-root, aktifkan read-only filesystem, cabut Linux capabilities (cap_drop: [ALL]), dan batasi kuota RAM/CPU agar tidak memicu OOM crash pada host.

Amankan Header & Cache Response Keluar: Pasang security headers (X-Content-Type-Options: nosniff, frame-ancestors 'none', Referrer-Policy), paksa Cache-Control: no-store, private untuk endpoint privat, dan tampilkan halaman error generik (tanpa stack trace).

## Performance

- Rate Limiter (Redis)
- Optimize database query
- Caching by Redis
- Nginx / Reverse Proxy
- Search indexing (meilisearch/elasticsearch)

## CHECK SSL URL
```
curl -vI https://domain.com 2>&1 | grep -A 6 "Server certificate"
```
