# DOCKER
## INSTALL
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## COMMAND
```
docker compose up --build -d
docker compose up -d

docker compose down
docker compose down -v
docker compose logs -f <service_name>

docker ps -a
docker logs -f <container_name>
docker exec -it

docker stop <container_name>
docker start <container_name>
docker restart <container_name>

docker system prune
docker stats
docker volume ls

docker compose exec -T <service_name> sh -c 'cd /app && tar czf - uploads' > uploads.tgz
```

## DB BACKUP
```
docker compose exec -T postgres sh -c 'pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' > db-backup.sql
cat db-backup.sql | docker compose exec -T postgres sh -c 'psql -U "$POSTGRES_USER" "$POSTGRES_DB"'

docker compose exec -T mysql sh -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"' > db-backup.sql
cat db-backup.sql | docker compose exec -T mysql sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE"'

docker compose exec -T mongo sh -c 'mongodump --archive --gzip' > db-backup.archive.gz
docker compose exec -T mongo sh -c 'mongodump -u "$MONGO_INITDB_ROOT_USERNAME" -p "$MONGO_INITDB_ROOT_PASSWORD" --authenticationDatabase admin --archive --gzip' > db-backup.archive.gz
cat db-backup.archive.gz | docker compose exec -T mongo sh -c 'mongorestore --archive --gzip'
```
