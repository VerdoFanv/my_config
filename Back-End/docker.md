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
```
