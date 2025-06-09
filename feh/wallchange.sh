#!/usr/bin/env bash

# 1️⃣ Escolhe um wallpaper aleatório
WALLPAPER=$(find ~/Imagens/wallpapers -type f | shuf -n1)

# 2️⃣ Define o wallpaper com o feh
feh --bg-fill "$WALLPAPER"

# 3️⃣ Atualiza as cores com o pywal
wal -i "$WALLPAPER"

# Dunst
killall dunst
dunst &

# PywalFox
pywalfox update

# BetterLockScreen
betterlockscreen -u "$WALLPAPER" --fx blur
