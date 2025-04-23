#!/usr/bin/env bash

set -euo pipefail

dnf install -y \
    firewall-config

sed -i \
    's,DefaultZone=public,DefaultZone=Workstation,g' \
    /etc/firewalld/firewalld.conf
