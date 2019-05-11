#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

mkdir -p $HOME/$ENVIRONMENT_DIRECTORY
echo $GCP_CREDENTIALS | base64 -d > $HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json"

diff_file=$(git --no-pager diff --name-only "origin/master..HEAD" "terraform/$PROJECT_NAME")
if [ -n "$diff_file" ]; then
    cd terraform/$PROJECT_NAME/gcp/$ENVIRONMENT_DIRECTORY
    terraform validate ../
else
    echo "Skip terraform validate"
fi
