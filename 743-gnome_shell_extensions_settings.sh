#!/bin/bash
SETTINGS_PATH="/etc/dconf/db/system-wide.d"
FILE_NAME="01_gnome_shell_extensions_settings"

SETTINGS=$(cat <<EOF
[org/gnome/shell]
enabled-extensions=['BingWallpaper@ineffable-gmail.com', 'onedrive@diegomerida.com', 'dash-to-dock@micxgx.gmail.com', 'appindicatorsupport@rgcjonas.gmail.com', 'tiling-assistant@leleat-on-github', 'caffeine@patapon.info']

[org/gnome/shell/extensions/dash-to-dock]
hot-keys=false
intellihide-mode=['ALL_WINDOWS']
running-indicator-style=['DASHES']
click-action='focus-minimize-or-previews'
dash-max-icon-size=64

[org/gnome/shell/extensions/bingwallpaper]
delete-previous=true
selected-image='current'

[org/gnome/shell/extensions/tiling-assistant]
restore-window=@as []
tile-bottom-half=@as []
tile-topleft-quarter=@as []
tile-topright-quarter=@as []
tile-bottomleft-quarter=@as []
tile-bottomright-quarter=@as []
tile-top-half=@as []
tile-left-half=@as []
tile-right-half=@as []
tile-maximize=@as []
EOF
)

sudo mkdir -p "$PATH"

echo "$SETTINGS" | sudo tee "$SETTINGS_PATH/$FILE_NAME"

sudo dconf update