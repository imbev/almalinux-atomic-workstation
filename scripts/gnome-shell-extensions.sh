#!/usr/bin/env bash

set -euo pipefail

dnf install -y \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock

curl -L \
    -o ding.zip \
    https://extensions.gnome.org/extension-data/dingrastersoft.com.v76.shell-extension.zip

unzip \
    ding.zip \
    -d ding@rastersoft.com

chmod a+r \
    ding@rastersoft.com/metadata.json

mv -f \
    ding@rastersoft.com/schemas/* \
    /usr/share/glib-2.0/schemas/

mv \
    ding@rastersoft.com \
    /usr/share/gnome-shell/extensions/

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.gnome.desktop.shell.workstation.gschema.override
[org.gnome.shell]
enabled-extensions=['background-logo@fedorahosted.org', 'appindicatorsupport@rgcjonas.gmail.com', 'ding@rastersoft.com', 'window-list@gnome-shell-extensions.gcampax.github.com', 'blur-my-shell@aunetx']
EOF

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.fedorahosted.background-logo-extension.workstation.gschema.override
[org.fedorahosted.background-logo-extension]
logo-position='bottom-right'
EOF

glib-compile-schemas \
    /usr/share/glib-2.0/schemas/
