## BACKUP MYSQL MARIADB FROM SSH 
```
ssh <user_ssh_staging>@<ip_staging> \
  "MYSQL_PWD='<pass_db_staging>' mysqldump -u <user_db_staging> --single-transaction --routines --triggers --events <nama_db_staging> | gzip -c" \
  > ~/backup.sql.gz

gzip -dc ~/staging.sql.gz | docker exec -i -e MYSQL_PWD='<pass_db_lokal>' <nama_container_mariadb> \
  mariadb -u <user_db_lokal> <nama_db_lokal>
```

## MYSQL COMMAND
```
SHOW DATABASES;
USE nama_database;
SHOW FULL TABLES;
SELECT DATABASE(), USER(), VERSION();
DESCRIBE nama_tabel;
SHOW CREATE TABLE nama_tabel\G
SHOW INDEX FROM nama_tabel;
SELECT * FROM nama_tabel LIMIT 10;
SELECT user, host FROM mysql.user;
SHOW GRANTS;
SHOW FULL PROCESSLIST;

CREATE DATABASE IF NOT EXISTS nama_database CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## COMMAND MYSQL DOCKER
```
docker exec -it <nama_container> mysql -u root -p
```
