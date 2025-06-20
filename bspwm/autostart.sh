#!/usr/bin/env bash

# Comandos para o X11
set b off

if ! xrandr | grep -q "1920x1080_60.00"; then
    xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode eDP-1 "1920x1080_60.00"
fi

# Aplica a resolução
xrandr --output eDP-1 --mode "1920x1080_60.00"

# Wallpaper e pywal
WALL="$HOME/dotfiles/wallpapers/estético/paint.png"
feh --bg-fill "$WALL"
wal -i "$WALL"

# Notificações
killall dunst
dunst &

# Cava
~/dotfiles/cava/pywal.sh &

# PywalFox
pywalfox update

# Polybar
xrdb -merge ~/.Xresources
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
