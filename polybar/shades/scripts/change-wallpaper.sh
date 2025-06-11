#!/bin/bash

theme="$HOME/dotfiles/polybar/shades/scripts/rofi/change-wallpaper.rasi"
wallpaper_dir="$HOME/dotfiles/wallpapers"

while true; do
    wallpapers_list=$(find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec basename {} \;)
    selected=$(echo "$wallpapers_list" | rofi -dmenu -p "Escolha um wallpaper:" -theme "$theme")

    # Se o usuário cancelar ou não escolher nada, sai do loop
    if [[ -z "$selected" ]]; then
        break
    fi

    selected_file="$wallpaper_dir/$selected"
    sxiv "$selected_file"

    apply=$(echo -e "Sim\nNão" | rofi -dmenu -p "Aplicar wallpaper?" -theme "$theme")

    if [[ "$apply" == "Sim" ]]; then
        feh --bg-fill "$selected_file"
        wal -i "$selected_file"
        killall dunst
        dunst &
        pywalfox update
        betterlockscreen -u "$selected_file" --fx blur
        echo "Wallpaper aplicado."
        break
    elif [[ "$apply" == "Não" ]]; then
        # volta para o início do loop para escolher outro wallpaper
        continue
    else
        # Se cancelar ou escolher outra coisa, sai do loop
        break
    fi
done

