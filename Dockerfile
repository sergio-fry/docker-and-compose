FROM ubuntu:14.04

# Install curl so we can get the other binaries
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

# Install specific verison of docker-engine
RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
RUN cat /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get purge lxc-docker
RUN apt-cache policy docker-engine
RUN apt-get install -y docker-engine=1.12.1-0~trusty
RUN service docker start
RUN apt-get clean && rm -rf /var/lib/apt/lists

# Install specific version of docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Verify installation
RUN docker -v
RUN docker-compose -v
