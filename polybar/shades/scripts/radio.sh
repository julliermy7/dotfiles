#!/bin/sh

# Caminho para o tema do Rofi
theme="$HOME/dotfiles/polybar/shades/scripts/rofi/radio.rasi"

menu(){
    printf "1. lofi\n"
    printf "2. ambient\n"
    printf "3. frutiger aero\n"
}

get_choice() {
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        choice=$(menu | wofi --show dmenu)
    elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
        choice=$(menu | rofi -dmenu -p "radio ☕️" -theme "$theme")
    else
        echo "Unsupported session type: $XDG_SESSION_TYPE"
        exit 1
    fi
    echo "$choice"
}

main() {
    choice=$(get_choice)

    case "$choice" in
        "1. lofi")
            $HOME/dotfiles/polybar/shades/scripts/rofi-radio.sh
            ;;
        "2. ambient")
            $HOME/dotfiles/polybar/shades/scripts/ambient-radio.sh
            ;;
        "3. frutiger aero")
            $HOME/dotfiles/polybar/shades/scripts/frutiger-aero-radio.sh
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac
}

main

