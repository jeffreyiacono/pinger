#!/bin/bash

function usage {
  echo "Error: must pass a url to ping."
  echo "Usage: $0 [url]"
}

if [ $# != 1 ]; then
  usage
  exit 1
fi

for (( i=0; i < 20; i++ )); do
  if curl -Is $1 | head -n1 | grep -q "200 OK"; then
    echo "[$(date)] $1 responded with '200 OK' status after $i tries"
    exit 0
  else
    sleep 4
  fi
done

echo "FAILED"
exit 1
