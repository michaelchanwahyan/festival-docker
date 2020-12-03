#!/bin/sh
docker build -t festvox:latest ./
docker rmi   -f $(docker images -f "dangling=true" -q)
