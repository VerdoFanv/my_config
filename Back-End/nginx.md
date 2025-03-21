# NGINX

## install nginx
```
sudo apt update
sudo apt-get install nginx -y
sudo systemctl status nginx
sudo systemctl restart nginx
```

- running on port 80

## config reverse proxy, limit access & subdomain
```
sudo nano /etc/nginx/sites-available/default

add this code to location /
proxy_pass http://host:port;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host $host;
proxy_cache_bypass $http_upgrade;
```

## add this code in first new line (limit for 2 second)
```
limit_req_zone $binary_remote_addr zone=one:10m rate=30r/m;

and add this to location /
limit_req zone=one;
```

### change dns & ssl
```
sudo apt-get update
sudo apt-get install python3-certbot-nginx -y
sudo certbot --nginx -d <yourdomain.com> -d <www.yourdomain.com>

rename server_name to hostname.tld www.hostname.tld
```