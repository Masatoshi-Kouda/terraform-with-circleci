#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

tfnotify_version="v0.3.0"

wget https://github.com/mercari/tfnotify/releases/download/$tfnotify_version/tfnotify_${tfnotify_version}_linux_amd64.tar.gz
tar -xzf tfnotify_${tfnotify_version}_linux_amd64.tar.gz
mv tfnotify_${tfnotify_version}_linux_amd64/tfnotify /usr/bin/
rm -f tfnotify_${tfnotify_version}_linux_amd64.tar.gz
