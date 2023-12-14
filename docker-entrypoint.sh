#!/bin/sh
set -e

mkdir -p /reeve/src
cd /reeve/src

git clone --filter=tree:0 "$GIT_REPOSITORY" .
git checkout ${GIT_COMMIT:-HEAD}
git remote | while read remote; do
  git remote rm $remote
done

exec "$@"
