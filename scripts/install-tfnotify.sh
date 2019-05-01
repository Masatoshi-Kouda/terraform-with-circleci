#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

wget https://github.com/mercari/tfnotify/releases/download/v0.3.0/tfnotify_v0.3.0_linux_amd64.tar.gz
tar -xzf tfnotify_v0.3.0_linux_amd64.tar.gz
mv tfnotify_v0.3.0_linux_amd64/tfnotify /usr/bin/
