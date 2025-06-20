#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/dotfiles/polybar/shades"

# Terminate already running bar instances
pkill -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &
