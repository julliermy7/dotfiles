#!/bin/bash

# Temas
theme="$HOME/dotfiles/polybar/shades/scripts/rofi/change-wallpaper.rasi"
confirm_theme="$HOME/dotfiles/polybar/shades/scripts/rofi/confirm-wallpaper.rasi"

# Diretório base dos wallpapers
wallpaper_base="$HOME/dotfiles/wallpapers"

# Menu de categorias
select_category() {
    category=$(ls "$wallpaper_base" | rofi -dmenu -p "Escolha a categoria:" -theme "$theme")
    [[ -z "$category" ]] && exit
    wallpaper_dir="$wallpaper_base/$category"

    [[ ! -d "$wallpaper_dir" ]] && {
        notify-send "Categoria inválida" "O diretório não existe: $wallpaper_dir"
        exit 1
    }

    select_wallpaper "$wallpaper_dir"
}

# Menu de seleção de wallpapers + voltar (em loop)
select_wallpaper() {
    local dir="$1"
    local last_selected=""

    while true; do
        # Lista todos os arquivos de wallpaper
        wallpapers_list=$(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec basename {} \; | sort)

        if [[ -n "$last_selected" ]]; then
            # Remove o item selecionado anteriormente da lista
            wallpapers_list=$(echo "$wallpapers_list" | grep -vFx "$last_selected")
            # Insere o item anterior no topo após "Voltar"
            menu_list=$(echo -e "  Voltar\n$last_selected\n$wallpapers_list")
        else
            menu_list=$(echo -e "  Voltar\n$wallpapers_list")
        fi

        # Mostra o menu com rofi
        selected=$(echo "$menu_list" | rofi -dmenu -p "Escolha um wallpaper:" -theme "$theme")

        if [[ -z "$selected" ]]; then
            exit
        elif [[ "$selected" == "  Voltar" ]]; then
            select_category
            return
        fi

        last_selected="$selected"
        selected_file="$dir/$selected"

        # Mostra preview
        feh --title preview-wallpaper --zoom fill "$selected_file" &
        sleep 0.3

        # Confirmação
        apply=$(echo -e "Sim\nNão" | rofi -dmenu -p "Aplicar wallpaper?" -theme "$confirm_theme")
        pkill -f "feh.*preview-wallpaper"

        if [[ "$apply" == "Sim" ]]; then
            feh --bg-fill "$selected_file"
            wal -i "$selected_file"
            killall dunst
            dunst &
            pywalfox update
            betterlockscreen -u "$selected_file" --fx blur
            break
        fi
        # Se “Não”, volta para o loop mantendo $last_selected no topo
    done
}


# Inicia pelo menu de categorias
select_category

