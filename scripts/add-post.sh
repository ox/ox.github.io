#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <title>"
  exit 1
fi

# Get directory of this script (https://stackoverflow.com/a/246128)
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

ROOT=$(dirname $DIR)
CURDATE=$(date +"%Y-%m-%d")
TITLE=$(echo "${@:1}" | sed 's/ /-/g')
NEW_POST=${ROOT}/_posts/${CURDATE}-${TITLE}.md
cat > $NEW_POST <<EOT
---
layout: post
title: ""
tags: []
---


EOT
echo $NEW_POST
