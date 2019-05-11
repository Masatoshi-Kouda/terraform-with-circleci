#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

mkdir -p $HOME/$ENVIRONMENT_DIRECTORY
echo $GCP_CREDENTIALS | base64 -d > $HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json"

cd terraform/$PROJECT_NAME/gcp/$ENVIRONMENT_DIRECTORY
terraform apply tfplan | tfnotify --config ../../../../tfnotify/slack.yaml apply --message "terraform/$PROJECT_NAME/gcp/$ENVIRONMENT_DIRECTORY"
