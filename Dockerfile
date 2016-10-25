# chekote/node
FROM node:slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/bash", "-c"]
