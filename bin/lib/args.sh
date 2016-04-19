#!/usr/bin/env bash

# (re)add double quotes around arguments
ARGS=''
for i in "$@"; do
    ARGS="$ARGS \"${i//\"/\\\"}\""
done

