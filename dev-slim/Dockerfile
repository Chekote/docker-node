# chekote/node:{node version}-dev-alpine
FROM chekote/node:latest-slim

# install gosu
RUN set -eux; \
    #
    apt-get update; \
    apt-get install -y --no-install-recommends --no-install-suggests g++ git make python3; \
    #
    # Cleanup
    apt-get remove -y; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;
