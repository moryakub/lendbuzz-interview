#!/bin/sh

export DOCKER_USERNAME=morya994@gmail.com
export DOCKER_PASSWORD=$(cat jfrog_token.txt)
docker login morya994.jfrog.io
docker pull morya994.jfrog.io/docker/lendbuzz_ex:latest
docker rm -f postgres lendbuzz_ex &>/dev/null && echo 'Removed old containers'
docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=lendbuzz_ex -d postgres
docker run -d -p 3000:3000 --name lendbuzz_ex -e DB_USER=postgres -e DB_HOST=host.docker.internal -e DB_NAME=postgres -e DB_PASS=lendbuzz_ex morya994.jfrog.io/docker/lendbuzz_ex:latest