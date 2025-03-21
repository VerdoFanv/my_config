# DOCKER
// config file
Dockerfile

// download docker for ubuntu
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

// commands
docker build -t <imagename> . --> create image
docker run -d -p 5000:5000 <imagename> --> run image
docker ps --> show images
docker images --> show  images
docker image rm <imagename|id> --> remove images
docker container stop <id> --> stop container
docker container rm <id> --> remove container
docker container ls -a