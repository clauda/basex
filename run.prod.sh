#!/bin/sh
# Docker entrypoint script.

# exit on error
set -o errexit

bin="/app/bin/basex"
eval "$bin eval \"Basex.Release.migrate\""
echo "starting elixir application now..."
# start the elixir application
exec "$bin" "start"