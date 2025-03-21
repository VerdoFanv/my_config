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