#!/bin/bash
SETTINGS_PATH="/etc/dconf/db/system-wide.d"
FILE_NAME="00_gnome_shell_settings"

SETTINGS=$(cat <<EOF
[org/gnome/desktop/app-folders/folders/Utilities]
apps=['org.gnome.Boxes.desktop', 'org.gnome.Evince.desktop', 'org.gnome.Loupe.desktop', 'org.gnome.baobab.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.Console.desktop', 'yelp.desktop', 'nm-connection-editor.desktop', 'im-config.desktop', 'software-properties-gtk.desktop', 'org.gnome.DiskUtility.desktop']

[org/gnome/desktop/calendar]
 show-weekdate=true

[org/gnome/desktop/datetime]
automatic-timezone=true

[org/gnome/desktop/interface]
cursor-theme='Bibata-Modern-Amber'
icon-theme='MoreWaita'
clock-show-seconds=true
clock-show-weekday=true
enable-hot-corners=false
font-antialiasing='rgba'
font-hinting='full'
show-battery-percentage=false
font-name='Cantarell 11'
monospace-font-name='FiraCode Nerd Font 11'

[org/gnome/desktop/peripherals/touchpad]
tap-to-click=true
two-finger-scrolling-enabled=true

[org/gnome/desktop/peripherals/mouse]
natural-scroll=true

[org/gnome/desktop/peripherals/keyboard]
numlock-state=true

[org/gnome/desktop/wm/preferences]
action-double-click-titlebar='none'
button-layout='appmenu:minimize,maximize,close'

[org/gnome/mutter]
center-new-windows=true
edge-tiling=true

[org/gnome/nautilus/icon-view]
default-zoom-level='small'

[org/gnome/nautilus/preferences]
show-hidden-files=true

[org/gnome/shell]
favorite-apps=['google-chrome.desktop', 'code.desktop', 'org.gnome.Console.desktop', 'org.gnome.Nautilus.desktop']
app-picker-layout=[{'org.gnome.Software.desktop': <{'position': <0>}>, 'com.mattjakeman.ExtensionManager.desktop': <{'position': <1>}>,'org.gnome.tweaks.desktop': <{'position': <2>}>,'org.gnome.Settings.desktop': <{'position': <3>}>,'Utilities': <{'position': <4>}>,'io.missioncenter.MissionCenter.desktop': <{'position': <5>}>,'steam.desktop': <{'position': <6>}>,'minecraft-launcher.desktop': <{'position': <7>}>}]

[org/gnome/shell/weather]
automatic-location=true

[org/gnome/software]
enable-repos-dialog=false
show-ratings=true
packaging-format-preference=['flatpak', 'deb']

[org/gnome/system/location]
enabled=true

[org/gtk/settings/file-chooser]
sort-directories-first=true
show-hidden=true
sort-order='ascending'
sort-column='name'
type-format='category'

[org/gtk/gtk4/settings/file-chooser]
sort-directories-first=true
show-hidden=true
sort-order='ascending'
sort-column='name'
type-format='category'
EOF
)

sudo mkdir -p "$PATH"

echo "$SETTINGS" | sudo tee "$SETTINGS_PATH/$FILE_NAME"

sudo dconf update