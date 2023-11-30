#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

script/wait-for-it.sh database:5432

bundle check || bundle install

exec "$@"
