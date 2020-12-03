#!/bin/sh
clear
export TZ=Asia/Hong_Kong
docker rm -f sleepy_jigglypuff
docker run -p 1314:1314 \
           -dt \
           --name=sleepy_jigglypuff \
           --memory=4g \
           festvox:latest \
           /bin/bash
