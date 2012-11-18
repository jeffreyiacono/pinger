#!/bin/bash

function usage {
  echo "Usage: $0 [url]"
}

if [ $# != 1 ]; then
  echo "Error: must pass a url to ping."
  usage
  exit 1
elif [ $1 == '-h' ]; then
  usage
  exit 0
elif [ $1 == '-v' ]; then
  echo "version 1.0"
  exit 0
fi

for (( i=0; i < 20; i++ )); do
  http_header_response=$(curl -Is $1 | head -n1)
  if echo $http_header_response | grep -q "200 OK"; then
    echo "[$(date)] $1 responded with '200 OK' status after $((i + 1)) tries"
    exit 0
  elif echo $http_header_response | grep -q "301 Moved Permanently"; then
    echo "permanently moved - supply new url"
    exit 1
  else
    sleep 4
  fi
done

echo "failed"
exit 1
