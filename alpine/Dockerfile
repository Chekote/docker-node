# chekote/node:latest-alpine
# chekote/node:{node version}-alpine
# us.gcr.io/chekote-56995/node:latest-alpine
# us.gcr.io/chekote-56995/node:{node version}-alpine
FROM node:lts-alpine

# install su-exec
RUN set -euxo pipefail; \
	#
	apk add --no-cache shadow su-exec; \
	#
    # verify that the binary works
	su-exec; \
	su-exec nobody true; \
	#
    # Ensure workdir exists
    mkdir /workdir; \
    #
    # Make sure it all works
    node --version; \
    npm --version; \
    yarn --version;

VOLUME ["/workdir"]
WORKDIR /workdir

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
