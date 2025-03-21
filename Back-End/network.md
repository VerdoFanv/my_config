# TCP/IP
## layer
- Application (client & server request response)
- Transport (data segmentation, HTTP, SMTP, FTP, dll)
- Network (data segment to package base on IP address)
- Data Link (package segment to frame base on MAC address)
- Physical (send & received data)

## How DNS Works (DNS Resolution)
- check browser cache for saved IP
- call recursive DNS in cache
- request root dns and request to TLD
- recursive dns call authoritative name server to get information
- save ip to cache in recursive dns
- browser get the ip & send request via that IP

## DNS record
- A Record (IP address from a domain)
- AAAA Record (IPv6 for a domain)
- CNAME Record (navigate a domain or subdomain to another one)
- MX Record (navigate email to mail server)
- NS Record (Authoritative name server information)

## Security
- DNSSEC (add digital signature to every DNS resolution)
- Proxy (Forward & Reverse proxy, change requested IP address with proxy server IP)
- Rate Limit (limit time for request)
- Firewall (guard in/out for network)