#!/bin/bash

# generating template gtk config files

# generate local gtk config:
cat <<EOF >  ~/.gtkrc-2.0
gtk-theme-name="Industrial"
gtk-icon-theme-name="gnome"
gtk-font-name="Sans 10"
gtk-cursor-theme-name="Adwaita"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintfull"
gtk-xft-rgba="rgb"
gtk-modules="gail:atk-bridge"
EOF

echo "installed gtk2 config"


if [ ! -d ~/.config/gtk-3.0 ]; then
  mkdir -p ~/.config/gtk-3.0
  echo "created ~/.config/gtk-3.0"
fi

cat <<EOF >  ~/.config/gtk-3.0/settings.ini
[Settings]
gtk-theme-name=Industrial
gtk-icon-theme-name=gnome
gtk-font-name=Sans 10
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull

gtk-xft-rgba=rgb
gtk-modules=gail:atk-bridge
EOF

echo "installed gtk3 config"


if [ ! -d ~/.icons/default ]; then
  mkdir -p ~/.icons/default
  echo "created ~/.icons/default"
fi

cat <<EOF > ~/.icons/default/index.theme
echo "[Icon Theme]
Name=Default
Comment=Default
Cursor
Theme
Inherits=Adwaita
EOF

echo "installed cursor theme"

