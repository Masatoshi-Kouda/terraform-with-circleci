#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

diff_file=$(git --no-pager diff --name-only "origin/master..HEAD" "terraform/$PROJECT_NAME")
if [ -n "$diff_file" ]; then
    cd terraform/$PROJECT_NAME
    terraform fmt -diff=true -check=true
else
    echo "Skip terraform fmt"
fi
