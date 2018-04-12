# redis-unstable-docker
This repository contains the Dockerfile to build a Docker image for Redis Server (unstable) running on Ubuntu.  Currently this build is required for streams API support.

## Building the Docker Image
#### To build the image, simply clone the repository and use the command:
docker build . -t redis-unstable

## Getting the image from Docker Hub
An image as of (4-12-18) is also hosted on Docker Hub.  To pull the image, use the command:
docker pull gubanotorious/redis-unstable

#### To start the container (redis-server):
docker run --name redis-unstable -p 6379:6379 gubanotorious/redis-unstable

#### To use redis-cli in the container:
docker exec -it redis-unstable /redis-unstable/src/redis-cli
