FROM node:5.7.0-slim

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/bash", "-c"]
