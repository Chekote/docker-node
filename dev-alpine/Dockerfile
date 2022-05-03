# chekote/node:latest-dev-alpine
# chekote/node:{node version}-dev-alpine
FROM chekote/node:latest-alpine

RUN set -euxo pipefail; \
    #
    # Upgrade all packages \
    apk update; \
    apk upgrade; \
	#
	apk add --no-cache g++ git make openssh python3; \
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
