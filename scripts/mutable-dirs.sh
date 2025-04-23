#!/usr/bin/env bash

set -euo pipefail

mv /opt /var/
ln -s /var/opt /opt

mv /usr/local /var/usrlocal
ln -s /var/usrlocal /usr/local
