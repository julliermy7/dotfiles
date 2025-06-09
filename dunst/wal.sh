#!/bin/sh

# Symlink dunst config
ln -sf ~/.cache/wal/dunstrc ~/dotfiles/dunst/dunstrc

# Restart dunst with the new color scheme
pkill dunst
dunst &
