#!/bin/bash

IMAGE=quay.io/cory_johannsen/boozelogger-db:latest
CONTAINER=boozelogger-db

if [ -z "$DOCKER_HOST" ]
then
    DOCKER_HOST=127.0.0.1:2375
fi

echo "Starting boozelogger-db service on docker host $DOCKER_HOST"

docker -H $DOCKER_HOST stop $CONTAINER
docker -H $DOCKER_HOST rm $CONTAINER
# docker run --name boozelogger-db -e POSTGRES_PASSWORD=boozelogger $IMAGE $1
docker run --name boozelogger-db -e POSTGRES_PASSWORD=boozelogger -d $IMAGE $1
