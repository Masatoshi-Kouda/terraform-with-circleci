#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

cd gmail/terraform/gcp/pubsub/$ENVIRONMENT_DIRECTORY
tfnotify --version
terraform plan ../
