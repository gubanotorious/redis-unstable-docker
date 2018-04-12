# Set the base image
FROM ubuntu

# Dockerfile author / maintainer 
MAINTAINER Name gubanotorious@gmail.com

# Update application repository list and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y wget && apt-get install -y apt-utils && apt-get install -y gcc && apt-get install -y make && apt-get install -y make-guile

# Get the unstable build, uncompress, and build
RUN wget -O unstable.tar.gz https://github.com/antirez/redis/archive/unstable.tar.gz && tar xzf ./unstable.tar.gz && rm ./unstable.tar.gz && cd redis-unstable && cd deps && make hiredis jemalloc linenoise lua
RUN cd /redis-unstable && make install

# Expose default port
EXPOSE 6379

# Set the default command
ENTRYPOINT ["/redis-unstable/src/redis-server","--protected-mode no","--appendonly yes","--tcp-backlog 128"]