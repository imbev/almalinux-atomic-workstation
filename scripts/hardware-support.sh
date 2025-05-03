#!/usr/bin/env bash

set -euo pipefail

dnf install -y \
    nss-mdns

mkdir -p \
     /etc/udev/rules.d

curl -L \
    -o /etc/udev/rules.d/60-steam-input.rules \
    https://raw.githubusercontent.com/ValveSoftware/steam-devices/ec44e8b46cfca9e8f7aea66bf9ec980c565c8259/60-steam-input.rules

curl -L \
    -o /etc/udev/rules.d/60-steam-vr.rules \
    https://raw.githubusercontent.com/ValveSoftware/steam-devices/0c468922a38e8145c025f3f7cdf11c1b8c666f9d/60-steam-vr.rules
