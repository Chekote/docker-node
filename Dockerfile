FROM node:5.6.0

VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/bin/bash", "-c"]
