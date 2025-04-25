#!/usr/bin/env bash

set -euo pipefail

cat << EOF > /usr/lib/bootc/kargs.d/quiet.toml
kargs = ["quiet"]
EOF