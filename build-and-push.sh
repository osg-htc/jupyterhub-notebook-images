#!/bin/sh
# Build and push an image.

set -eu

repo="${1%/}"  # remove a trailing slash
tag="${2:-}"
push="${3:-}"
project="${4:-hub.opensciencegrid.org/osg-jupyterhub}"

name="$project/$repo:$tag"

if [ ! -d "$repo" ] || [ -z "$tag" ]; then
  printf '%s\n' "Usage: $0 <dir> <tag> [push-image?] [project]" 1>&2
  exit 1
fi

docker build --no-cache --pull -t "$repo:$tag" "$repo"

if [ -n "$push" ]; then
  docker tag "$repo:$tag" "$name"
  docker push "$name"
  docker image rm "$name"  # clean up the local image list
fi
