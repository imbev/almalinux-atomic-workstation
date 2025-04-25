#!/usr/bin/env bash

set -euo pipefail

dnf install -y \
    @"Development Tools" \
    distrobox
