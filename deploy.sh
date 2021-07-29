docker rm -f duo
docker rm -f server nginx
docler rm -f flask-app
docker rmi nginx:alpine gavthetallone/duo:latest
docker network rm duo-network

docker network create duo-network

docker build -t gavthetallone/duo .

docker run -d -p 5500:5500 --network duo-network --name flask-app -e YOUR_NAME=Gavin gavthetallone/duo

docker run -d --network duo-network --mount type=bind,source=$(pwd)/nginx.conf,target=/etc/nginx/nginx.conf -p 80:80 --name nginx nginx:alpine
