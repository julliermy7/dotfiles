#!/usr/bin/env bash

# Carrega as cores do pywal
source "${HOME}/.cache/wal/colors.sh"

# Atualiza as cores no dunstrc
sed -i -E "s/^(background\s*=\s*\").*(\")/\1${color0}\2/" ~/.config/dunst/dunstrc
sed -i -E "s/^(foreground\s*=\s*\").*(\")/\1${color7}\2/" ~/.config/dunst/dunstrc
sed -i -E "s/^(frame_color\s*=\s*\").*(\")/\1${color1}\2/" ~/.config/dunst/dunstrc


# Reinicia o dunst para aplicar as mudanças
pkill dunst && dunst &

