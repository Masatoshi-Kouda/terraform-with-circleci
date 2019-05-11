#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

mkdir -p $HOME/$ENVIRONMENT_DIRECTORY
echo $GCP_CREDENTIALS | base64 -d > $HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json"

diff_file=$(git --no-pager diff --name-only "origin/master..HEAD" "terraform/$PROJECT_NAME")
release_branch=$(git symbolic-ref --short HEAD | grep -E "^release/$PROJECT_NAME" || true)
if [ -n "$diff_file" ] || [ -n "$release_branch" ]; then
    cd terraform/$PROJECT_NAME/gcp/$ENVIRONMENT_DIRECTORY
    terraform plan -out=tfplan ../ | tfnotify --config ../../../../tfnotify/github.yaml plan --message "terraform/$PROJECT_NAME/gcp/$ENVIRONMENT_DIRECTORY"
else
    echo "Skip terraform plan"
fi
