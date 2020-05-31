#!/bin/sh

set -e

# Get dependencies
mix deps.get

# Wait for Postgres to become available
until pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER; do
  echo "$(date) Waiting for database to start"
  sleep 2
done

echo "\nPostgres is available: continuing with database setup..."

# Potentially Set up the database
mix ecto.create
mix ecto.migrate

echo "\n Launching Phoenix web server..."
# Start the phoenix web server
mix phx.server