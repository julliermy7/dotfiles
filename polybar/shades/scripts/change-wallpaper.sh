#!/bin/bash

# Temas
theme="$HOME/dotfiles/polybar/shades/scripts/rofi/change-wallpaper.rasi"
confirm_theme="$HOME/dotfiles/polybar/shades/scripts/rofi/confirm-wallpaper.rasi"

# Diretório base dos wallpapers
base_dir="$HOME/dotfiles/wallpapers"

# Função para selecionar wallpapers com "voltar"
select_wallpaper() {
    local dir="$1"
    local last_index=1  # índice 1 por causa do item " Voltar" em 0

    while true; do
        # Gera lista de wallpapers
        mapfile -t wallpapers < <(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec basename {} \; | sort)
        menu_list=("  Voltar" "${wallpapers[@]}")

        selected=$(printf "%s\n" "${menu_list[@]}" | rofi -dmenu -p "Escolha um wallpaper:" -theme "$theme" -selected-row "$last_index")
        [[ -z "$selected" ]] && return

        if [[ "$selected" == "  Voltar" ]]; then
            return
        fi

        # Atualiza índice para lembrar última seleção
        for i in "${!menu_list[@]}"; do
            [[ "${menu_list[$i]}" == "$selected" ]] && last_index="$i" && break
        done

        selected_file="$dir/$selected"

        # Preview temporário
        feh --title "PreviewWallpaper" --zoom fill "$selected_file" &
        feh_pid=$!
        sleep 1

        apply=$(echo -e "Sim\nNão" | rofi -dmenu -p "Aplicar wallpaper?" -theme "$confirm_theme")
        kill "$feh_pid"

        if [[ "$apply" == "Sim" ]]; then
            feh --bg-fill "$selected_file"
            wal -i "$selected_file"
            killall dunst
            dunst &
            pywalfox update
            betterlockscreen -u "$selected_file" --fx blur
            pkill -f musnify-mpd
            sleep 1
            musnify-mpd &
        fi
    done
}

# Menu de categorias com loop
while true; do
    mapfile -t categories < <(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)
    category_menu=$(printf "%s\n" "${categories[@]}" && echo "  Sair")

    selected_category=$(echo "$category_menu" | rofi -dmenu -p "Escolha a categoria:" -theme "$theme")
    [[ -z "$selected_category" || "$selected_category" == "  Sair" ]] && exit

    category_path="$base_dir/$selected_category"
    [[ -d "$category_path" ]] && select_wallpaper "$category_path"
done

