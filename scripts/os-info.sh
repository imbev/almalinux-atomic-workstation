#!/usr/bin/env bash

set -euo pipefail

cat << EOF >> /usr/lib/os-release
VARIANT="Atomic Workstation"
VARIANT_ID=atomic-workstation
EOF
