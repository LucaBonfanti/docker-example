#!/usr/bin/env bash

dotnet publish -c Release -o out

# costruisce e lancia in locale
docker build -t docker-example .
docker run -p 8080:80 -it --rm docker-example

# login https://hub.docker.com and push image 
docker login
docker tag docker-example:latest lucabonfanti/docker_example:dotnet
docker push lucabonfanti/docker_example:dotnet

# reload from docker.hub 
docker push lucabonfanti/docker_example:dotnet
docker run -p 8080:80 -it --rm docker-example
curl http://localhost:8080 
