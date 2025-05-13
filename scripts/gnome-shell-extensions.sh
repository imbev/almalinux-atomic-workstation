#!/usr/bin/env bash

set -euo pipefail

dnf install -y \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-blur-my-shell \
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
enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com', 'background-logo@fedorahosted.org', 'blur-my-shell@aunetx', 'dash-to-dock@micxgx.gmail.com', 'ding@rastersoft.com']
favorite-apps=['firefox.desktop', 'org.gnome.Software.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop']
EOF

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.fedorahosted.background-logo-extension.workstation.gschema.override
[org.fedorahosted.background-logo-extension]
logo-position='bottom-right'
EOF

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.gnome.shell.extensions.dash-to-dock.workstation.gschema.override
[org.gnome.shell.extensions.dash-to-dock]
custom-theme-shrink=true
dock-fixed=true
dock-position='LEFT'
extend-height=true
running-indicator-style='DOTS'
EOF

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.gnome.shell.extensions.blur-my-shell.dash-to-dock.workstation.gschema.override
[org.gnome.shell.extensions.blur-my-shell.dash-to-dock]
pipeline='pipeline_default'
static-blur=false
EOF

cat << EOF >> /usr/share/glib-2.0/schemas/10_org.gnome.shell.extensions.blur-my-shell.panel.workstation.gschema.override
[org.gnome.shell.extensions.blur-my-shell.panel]
static-blur=false
EOF

glib-compile-schemas \
    /usr/share/glib-2.0/schemas/
