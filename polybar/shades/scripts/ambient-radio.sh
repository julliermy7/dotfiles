#!/bin/sh

# Caminho para o tema do Rofi
theme="$HOME/dotfiles/polybar/shades/scripts/rofi/radio.rasi"

# add more args here according to preference
ARGS="--no-video"

notification(){
    # notify the user of the current stream being played
    # change the icon to whatever you want. make sure your notification server 
    # supports it and already configured.
    notify-send "Playing now: " "$@" --icon=media-tape --app-name rofi-radio
}

# number of the stream as per the $choice variable
# name of the stream
# additional tag to filter similar type of streams

menu(){
    printf "1. dark ambient\n"
    printf "2. forgotten dreams\n"
    printf "3. 2am.\n"
}

get_choice() {
    # auto-detect and use wofi for Wayland and rofi for X11
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        choice=$(menu | wofi --show dmenu)
    elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
        choice=$(menu | rofi -dmenu -p "ambient radio." -theme "$theme")
    else
        echo "Unsupported session type: $XDG_SESSION_TYPE"
        exit 1
    fi
    echo "$choice"
}

main() {
    choice=$(get_choice)

    case "$choice" in
        "1. dark ambient")
            notification "dark ambient 🎶"
            URL="https://www.youtube.com/watch?v=S_MOd40zlYU"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        "2. forgotten dreams")
            notification "forgotten dreams🎶"
            URL="https://www.youtube.com/watch?v=O5p2ZX7UU9w"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        "3. 2am.")
            notification "forgotten dreams🎶"
            URL="https://www.youtube.com/watch?v=xDih5SwFs_c"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac

    # run mpv with args and selected url
    # added title arg to make sure the pkill command kills only this instance of mpv
    mpv $ARGS --title="radio-mpv" $URL $ADDITIONAL_ARGS
}

# kill any existing instance of script before starting a new one
pkill -f radio-mpv || main
