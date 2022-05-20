# chekote/node:latest-dev-slim
# chekote/node:{node version}-dev-slim
FROM chekote/node:latest-slim

RUN set -eux; \
    #
    # Upgrade all packages
    apt-get update; \
    apt-get upgrade -y; \
    #
    # Node Dependencies
    apt-get install -y --no-install-recommends --no-install-suggests g++ git make python3; \
    #
    # Cleanup
    apt-get remove -y; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    #
    # Add github.com to known hosts
    mkdir /home/node/.ssh; \
    ssh-keyscan -t rsa github.com >> /home/node/.ssh/known_hosts; \
    chown -R node:node /home/node/.ssh; \
    #
    # Make sure the rest works
    g++ --version; \
    git --version; \
    make --version; \
    python3 --version;
