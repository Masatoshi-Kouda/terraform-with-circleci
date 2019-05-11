#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

cd terraform/$PROJECT_NAME
terraform fmt -diff=true -check=true
