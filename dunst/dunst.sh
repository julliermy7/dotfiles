#!/usr/bin/env bash

# Carrega as cores do pywal
source "${HOME}/.cache/wal/colors.sh"

# Atualiza as cores no dunstrc
sed -i "s/background = \".*\"/background = \"${color0}\"/" ~/.config/dunst/dunstrc
sed -i "s/foreground = \".*\"/foreground = \"${color7}\"/" ~/.config/dunst/dunstrc
sed -i "s/frame_color = \".*\"/frame_color = \"${color1}\"/" ~/.config/dunst/dunstrc

# Reinicia o dunst para aplicar as mudanças
pkill dunst && dunst &

