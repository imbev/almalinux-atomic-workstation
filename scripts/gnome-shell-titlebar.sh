#!/usr/bin/env bash

set -euo pipefail

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.gnome.desktop.wm.preferences.workstation.gschema.override
[org.gnome.desktop.wm.preferences]
button-layout='appmenu:minimize,maximize,close'
EOF

glib-compile-schemas \
    /usr/share/glib-2.0/schemas/
