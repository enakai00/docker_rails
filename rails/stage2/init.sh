#!/bin/sh

cd /root/rails/dengonban
rails s -e production -p 80 -d

while [[ true ]];do
    /bin/bash
done
