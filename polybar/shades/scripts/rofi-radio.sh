#!/bin/sh

# Caminho para o tema do Rofi
theme="$HOME/dotfiles/polybar/shades/scripts/rofi/rofi-radio.rasi"

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
    printf "1. Lofi Girl\n"
    printf "2. Chillhop\n"
    printf "3. Jazz Lofi Radio\n"
    printf "4. The Bootleg Boy\n"
    printf "5. Radio Spinner\n"
}

get_choice() {
    # auto-detect and use wofi for Wayland and rofi for X11
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        choice=$(menu | wofi --show dmenu)
    elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
        choice=$(menu | rofi -dmenu -p "lofi radio ☕️" -theme "$theme")
    else
        echo "Unsupported session type: $XDG_SESSION_TYPE"
        exit 1
    fi
    echo "$choice"
}

main() {
    choice=$(get_choice)

    case "$choice" in
        "1. Lofi Girl")
            notification "Lofi Girl ☕️🎶"
            URL="https://www.youtube.com/watch?v=jfKfPfyJRdk"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        "2. Chillhop")
            notification "Chillhop ☕️🎶"
            URL="https://www.youtube.com/watch?v=5yx6BWlEVcY"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        "3. Jazz Lofi Radio")
            notification "jazz lofi radio ☕️🎶"
            URL="https://www.youtube.com/watch?v=HuFYqnbVbzY"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        "4. The Bootleg Boy")
            notification "The Bootleg Boy ☕️🎶"
            URL="https://www.youtube.com/watch?v=A_hmrykwR7g"
            ADDITIONAL_ARGS="--volume=60"
            ;;
        "5. Radio Spinner")
            notification "Radio Spinner ☕️🎶"
            URL="https://live.radiospinner.com/lofi-hip-hop-64"
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
