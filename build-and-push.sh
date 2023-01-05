#!/bin/sh
# Build and push an image.

set -eu

context="${1:-}"
repo="$(basename -- "$context")"
tag="${2:-}"
push="${3:-}"
project="${4:-hub.opensciencegrid.org/osg-jupyterhub}"

name="$project/$repo:$tag"

if [ ! -d "$context" ] || [ -z "$tag" ]; then
  printf '%s\n' "Usage: $0 <dir> <tag> [push-image?] [project]" 1>&2
  exit 1
fi

docker build --no-cache --pull -t "$repo:$tag" "$context"

if [ -n "$push" ]; then
  docker tag "$repo:$tag" "$name"
  docker push "$name"
  docker image rm "$name"  # clean up the local image list
fi
