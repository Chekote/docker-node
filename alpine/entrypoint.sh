#!/usr/bin/env sh

# Based on: Deni Bertović https://denibertovic.com/posts/handling-permissions-with-docker-volumes/

# Use the LOCAL_USER_ID that was passed in, or fallback to 9001
USER_ID=${LOCAL_USER_ID:-9001}

# Get the username that is associated with the user id (if any)
USER_NAME=`getent passwd | awk -F: '$3 == '${USER_ID}' { print $1 }'`

# Does the user already exist?
if [ "$USER_NAME" == "" ]; then
  # No, Set the id of nobody
  USER_NAME=nobody
  usermod -u $USER_ID $USER_NAME
fi

# Make sure node modules is part of the path.
export PATH="$PATH:./node_modules/.bin"

# Execute the command
gosu ${USER_NAME} "$@"
