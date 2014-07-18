#!/bin/sh -x

if docker inspect pgsql01 >/dev/null 2>&1 ; then
    docker stop pgsql01
    docker rm pgsql01
fi

docker build -t enakai/pgsql:ver1.0 ./
mkdir -p /root/mydata
docker run -itd -v /root/mydata:/var/lib/pgsql -p 5432:5432 \
    --name pgsql01 enakai/pgsql:ver1.0
