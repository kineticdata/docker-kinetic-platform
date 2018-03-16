#!/usr/bin/env bash
set -e

cmd="$@"

sleep 5

until ! nc -z "configuration" "8181"; do
  >&2 echo "Port configuration:8181 is open - sleeping"
  sleep 3
done
until nc -z "request-ce" "8080"; do
  >&2 echo "Port request-ce:8080 is closed - sleeping"
  sleep 3
done
until nc -z "task" "8080"; do
  >&2 echo "Port task:8080 is closed - sleeping"
  sleep 3
done
until nc -z "bridgehub" "8080"; do
  >&2 echo "Port bridgehub:8080 is closed - sleeping"
  sleep 3
done
until nc -z "filehub" "8080"; do
  >&2 echo "Port filehub:8080 is closed - sleeping"
  sleep 3
done

>&2 echo "Applications are ready! Resuming execution."
exec $cmd