#!/bin/bash

# Variables
SELECTED_WALLPAPER=$1
WALLPAPER_DIR="$HOME/wallpapers"
PYWAL_SUBLIME_SCRIPT="$HOME/.local/bin/pywal_sublime.py"

# Ensure the wallpaper exists
if [ ! -f "$WALLPAPER_DIR/$SELECTED_WALLPAPER.jpg" ]; then
  echo "Error: Wallpaper not found: $SELECTED_WALLPAPER"
  exit 1
fi

# Apply pywal colors
wal -i "$WALLPAPER_DIR/$SELECTED_WALLPAPER.jpg" || {
  echo "Error: pywal failed"
  exit 1
}

# Apply Pywal colors to Sublime Text
python3 "$PYWAL_SUBLIME_SCRIPT" || {
  echo "Warning: pywal_sublime failed"
}

# Zathura color change
zathura-pywal &

# Telegram
wal-telegram &

# Chromium theme
~/dotfiles/wal/scripts/pywalium/generate.sh

# Tema Firefox
pywalfox update

# Tema GTK
oomox-cli -o "pywal-gtk" ~/.cache/wal/colors-oomox
gsettings set org.gnome.desktop.interface gtk-theme "pywal-gtk"

# Reload eww
killall eww || echo "Warning: No eww process found"
eww open-many open bar notifications # it was side-bar before

# Restart hyprpaper
killall hyprpaper || echo "Warning: No hyprpaper process found"
hyprpaper &
