#!/bin/bash
docker pull urgi/docker_vre_aio:v3.0
# TAG of the continer is v3.0
# port has to to be uniquely allocated!
docker run -p 2222:22 --name=repet -v $PWD/shared:/home/centos/data:z -d urgi/docker_vre_aio
# verify if running
docker container ls




