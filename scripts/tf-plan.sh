#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

mkdir -p $HOME/$ENVIRONMENT_DIRECTORY
echo $GCP_CREDENTIALS | base64 -d > $HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/$ENVIRONMENT_DIRECTORY/gcp_credentials.json"

cd gmail/terraform/gcp/pubsub/$ENVIRONMENT_DIRECTORY
terraform plan ../ | tfnotify --config ../../../../../tfnotify.yaml plan --message "#### $ENVIRONMENT_DIRECTORY"
