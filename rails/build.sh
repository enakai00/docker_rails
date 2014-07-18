#!/bin/sh -x

docker build -t enakai/rails:stage1 stage1
docker run -it --link pgsql01:db --name rails_stage1 enakai/rails:stage1
docker commit rails_stage1 enakai/rails:stage1
docker rm rails_stage1

docker build -t enakai/rails:ver1.0 stage2
docker rmi enakai/rails:stage1
