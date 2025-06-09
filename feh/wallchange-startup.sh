#!/usr/bin/env bash

# 1️⃣ Escolhe um wallpaper aleatório
WALLPAPER=$(find ~/dotfiles/wallpapers -type f | shuf -n1)

# 2️⃣ Define o wallpaper com o feh
feh --bg-fill "$WALLPAPER"

# 3️⃣ Atualiza as cores com o pywal
wal -i "$WALLPAPER"
