#!/usr/bin/env bash

set -eu
set -o pipefail

TARGET_PROJECTS=("gmail" "youtube")

for project in ${TARGET_PROJECTS[@]}; do
  diff_file=$(git --no-pager diff --name-only "origin/master..HEAD" "$project/terraform")
  if [ -n "$diff_file" ]; then
    echo $project
  fi
done
