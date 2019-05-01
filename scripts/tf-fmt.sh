#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

terraform fmt -diff=true -check=true
