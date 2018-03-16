#!/usr/bin/env bash
set -e

host="$1"; shift
port="$1"; shift
cmd="$@"

sleep 5

until ! nc -z "$host" "$port"; do
  >&2 echo "Port $host:$port is open - sleeping"
  sleep 3
done

>&2 echo "Port $host:$port is closed! Resuming execution."
exec $cmd