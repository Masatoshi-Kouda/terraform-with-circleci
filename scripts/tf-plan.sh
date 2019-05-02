#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

cd gmail/terraform/gcp/pubsub/$ENVIRONMENT_DIRECTORY
terraform plan ../ | tfnotify --config ../../../../../tfnotify.yaml plan --message "#### $ENVIRONMENT_DIRECTORY"
