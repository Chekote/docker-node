FROM debian:stretch-slim AS su-exec-builder

RUN  set -eux; \
     #
     apt-get update; \
     apt-get install -y --no-install-recommends ca-certificates curl; \
     #
     curl -o /usr/local/bin/su-exec.c https://raw.githubusercontent.com/ncopa/su-exec/master/su-exec.c; \
     #
     apt-get update; \
     apt-get install -y --no-install-recommends gcc libc-dev; \
     gcc -Wall /usr/local/bin/su-exec.c -o/usr/local/bin/su-exec; \
     chown root:root /usr/local/bin/su-exec; \
     chmod 0755 /usr/local/bin/su-exec;

# chekote/node:latest-slim
# chekote/node:{node version}-slim
FROM node:lts-slim

ENV DEBIAN_FRONTEND noninteractive

COPY --from=su-exec-builder /usr/local/bin/su-exec /usr/local/bin/su-exec

RUN set -eux; \
    #
    # Upgrade all packages
    apt-get update; \
    apt-get upgrade -y; \
    #
    # Node Dependencies
    apt-get install -y --no-install-recommends git ssh; \
    #
    # Cleanup
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /var/cache/apt/*; \
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
