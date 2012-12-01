#!/bin/bash
#
# Commandline utility that pings a url until a 200 response is achieved ...
# or it gets tired and quits (where "gets tired" is defined as trying 20 times,
# pausing 4 seconds in between each try).
#
# Usage:
#
#   $ ./pinger [url]
#
# - If a 200 status is encountered, script exits 0 and prints a success message
# - If a 301 status is encountered, script exits 1 and prints a notice to supply
#   the new url
# - Otherwise the script sleeps for 4 seconds and retries
#
# exit status of 1 and message of "failed" is returned if script is not able to
# get a 200 response from the supplied URL after 20 tries.

set -e

function usage {
  echo "Usage: $0 [url]"
}

if [ $# != 1 ] ; then
  echo "Error: must pass a url to ping."
  usage
  exit 1
elif [ "$1" == "-h" ] ; then
  usage
  exit 0
elif [ "$1" == "-v" ] ; then
  echo "version 1.0"
  exit 0
fi

for (( i=0; i < 20; i++ )) ; do
  http_header_response=$(curl -Is $1 | head -n1)
  if echo $http_header_response | grep -q "200 OK" ; then
    echo "[$(date)] $1 responded with '200 OK' status after $((i + 1)) tries"
    exit 0
  elif echo $http_header_response | grep -q "301 Moved Permanently" ; then
    echo "permanently moved - supply new url"
    exit 1
  else
    sleep 4
  fi
done

echo "failed"
exit 1
