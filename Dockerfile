FROM docker:18.04.0-ce

ARG COMPOSE_VERSION=1.23.2

RUN apk add --no-cache py-pip \
    && pip install "docker-compose==${COMPOSE_VERSION}"
