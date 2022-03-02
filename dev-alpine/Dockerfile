# chekote/node:{node version}-dev-alpine
FROM chekote/node:latest-alpine

# install gosu
RUN set -eux; \
	#
	apk add --no-cache g++ git make openssh python3; \
    #
    # Add github.com to known hosts
    mkdir /home/node/.ssh; \
    ssh-keyscan -t rsa github.com >> /home/node/.ssh/known_hosts; \
    chown -R node:node /home/node/.ssh; \
