#! /usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <title>"
  exit 1
fi

ROOT=$(git rev-parse --show-toplevel)
CURDATE=$(date +"%Y-%m-%d")
TITLE=$(echo "${@:1}" | sed 's/ /-/g')
touch ${ROOT}/_stories/${CURDATE}-${TITLE}.md
