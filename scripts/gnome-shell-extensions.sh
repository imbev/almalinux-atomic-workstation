#!/usr/bin/env bash

set -euo pipefail

dnf install -y \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-desktop-icons

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.gnome.desktop.shell.workstation.gschema.override
[org.gnome.shell]
enabled-extensions=['background-logo@fedorahosted.org', 'appindicatorsupport@rgcjonas.gmail.com', 'ding@rastersoft.com', 'window-list@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'blur-my-shell@aunetx']
EOF

glib-compile-schemas \
    /usr/share/glib-2.0/schemas/
