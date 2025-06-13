#!/usr/bin/env bash

# Wallpaper e pywal
WALL="$HOME/dotfiles/wallpapers/anime/anime6.jpg"
feh --bg-fill "$WALL"
wal -i "$WALL"
source "$HOME/.cache/wal/colors.sh"

# Notificações
killall dunst
dunst &

# PywalFox
pywalfox update

# Polybar
bash "$HOME/.config/polybar/launch.sh" --shades

# Teclado
pgrep -x sxhkd > /dev/null || sxhkd &

# Compositor
picom &

# Tela de bloqueio
betterlockscreen -u "$WALL" --fx blur

# Cores zathura
zathura-pywal

# Música
pgrep -x mpd > /dev/null || mpd --no-daemon &
pgrep -x mpdscribble > /dev/null || mpdscribble &

# Cursor
xsetroot -cursor_name left_ptr &
