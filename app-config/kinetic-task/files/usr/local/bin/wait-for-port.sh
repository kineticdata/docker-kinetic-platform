#!/usr/bin/env bash
set -e

host="$1"; shift
port="$1"; shift
cmd="$@"

sleep 5

until nc -z "$host" "$port"; do
  >&2 echo "Port $host:$port is unavailable - sleeping"
  sleep 1
done

>&2 echo "Port $host:$port is available! Resuming execution."
exec $cmd