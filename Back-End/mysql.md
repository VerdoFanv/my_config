## BACKUP MYSQL MARIADB FROM SSH 
```
ssh USER@IP \
  "MYSQL_PWD='pass' mysqldump -u root --single-transaction --routines --triggers --events db_name | gzip -c" \
  > backup.sql.gz

gzip -dc staging.sql.gz | docker exec -i -e MYSQL_PWD='root' nama_container_mariadb \
  mysql -u root nama_db_lokal
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
DROP DATABASE IF EXISTS nama_database;
```

## COMMAND MYSQL DOCKER
```
docker exec -it <nama_container> mysql -u root -p
```

## FIX TIMESTAMP AT DOCKER
```
command: --explicit-defaults-for-timestamp=1
docker compose up -d mysql
docker exec -i -e MYSQL_PWD='root' serbasepeda-express-mysql-1 \
  mysql -u root -e "SHOW VARIABLES LIKE 'explicit_defaults_for_timestamp';"

docker exec -i -e MYSQL_PWD='root' serbasepeda-express-mysql-1 \
  mysql -u root -e "UPDATE ss_v3_prod._prisma_migrations SET rolled_back_at = NOW(3) WHERE migration_name = '20261021042617_flash_sale' AND finished_at IS NULL;"
docker restart serbasepeda-express-api-1
docker logs -f serbasepeda-express-api-1
```

