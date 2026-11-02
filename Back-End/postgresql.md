# POSTGRESQL

## install in ubuntu
```
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null
sudo apt update
sudo apt install postgresql postgresql-client -y
sudo systemctl status postgresql

sudo -u postgres psql
ALTER USER postgres PASSWORD 'demoPassword';

nano /etc/postgresql/16/main/postgresql.conf
search |CONNECTION AND AUTHENTICATION| and replace with
listen_addresses = '*'

nano /etc/postgresql/16/main/pg_hba.conf
search line (ipv4 local connections) replace ip to 0.0.0.0/0
sudo ufw allow 5432/tcp
sudo systemctl restart postgresql
```

## error resolve (psql: error: connection to server on socket "/tmp/.s.PGSQL.5432" failed: No such file or directory)
```
rm /opt/homebrew/var/postgresql@16/postmaster.pid
rm /usr/local/var/postgres@16/postmaster.pid
```

## commands
```
psql -U <username> -d <dbname>
grant all privileges on database <db> to <username>;
create user <username> with encrypted password '';
\l --> database list
\d --> table & table structure list
\du --> user list
\dn --> schema list
truncate <table name>; --> delete all table records
drop schema public cascade; --> drop all table in public schema
create schema public authorization postgres; --> create public schema to some user
pg_dump -U <username> -h localhost -d <dbname> -f <file.sql>
psql -U <username> -h localhost -d <dbname> -f <file.sql>
psql -h <hostname> -U <username>
pg_ctl -D "E:\PostgreSQL\12\data" -l logfile start --> start server
alter system set jit=off;
```

## DEBUGING & BENCHMARK
```
EXPLAIN (ANALYZE, BUFFERS, COSTS)
SELECT * FROM "Account" 
WHERE balance > 100000;

SELECT 
  pid,
  now() - query_start AS duration,
  state,
  query,
  wait_event_type,
  wait_event
FROM pg_stat_activity
WHERE state != 'idle' 
  AND pid != pg_backend_pid()
ORDER BY duration DESC;

SELECT 
  schemaname,
  relname AS table_name,
  indexrelname AS index_name,
  idx_scan, -- Berapa kali indeks ini dipakai oleh query
  pg_size_pretty(pg_relation_size(indexrelid)) AS index_size
FROM pg_stat_user_indexes
WHERE idx_scan = 0 -- Belum pernah dipakai sama sekali
ORDER BY pg_relation_size(indexrelid) DESC;

SELECT 
  sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) * 100 AS cache_hit_ratio
FROM pg_statio_user_tables;

SELECT 
  relname AS table_name,
  pg_size_pretty(pg_total_relation_size(relid)) AS total_size, -- Data + Index
  pg_size_pretty(pg_relation_size(relid)) AS data_size,        -- Hanya Data
  pg_size_pretty(pg_indexes_size(relid)) AS index_size         -- Hanya Index
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;
```
