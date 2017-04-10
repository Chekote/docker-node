#!/usr/bin/env bash

# Credit: Deni Bertović https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}


if [ ! -d "/home/user" ]; then
  ARGS='-m'
fi

useradd --shell /bin/bash -u $USER_ID -o -c "" ${ARGS} user
export HOME=/home/user

# Ensure home is owned by user (Docker may have created it as root when mounting volumes)
chown user /home/user

# Ensure workdir is owned and writeable by user
chown user /workdir
chmod 700 /workdir

gosu user "$@"
