## BACKUP MYSQL MARIADB FROM SSH 
```
ssh <user_ssh_staging>@<ip_staging> \
  "MYSQL_PWD='<pass_db_staging>' mysqldump -u <user_db_staging> --single-transaction --routines --triggers --events <nama_db_staging> | gzip -c" \
  > ~/backup.sql.gz

gzip -dc ~/staging.sql.gz | docker exec -i -e MYSQL_PWD='<pass_db_lokal>' <nama_container_mariadb> \
  mariadb -u <user_db_lokal> <nama_db_lokal>
```

## COMMAND MYSQL DOCKER
```
docker exec -i -e MYSQL_PWD='<pass_db_lokal>' <nama_container_mariadb> \
  mariadb -u <user_db_lokal> -e "CREATE DATABASE IF NOT EXISTS <nama_db_lokal> CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

docker exec -i -e <nama_container> \
  mariadb -u <user_db_lokal> -e "SHOW DATABASES;"
```
