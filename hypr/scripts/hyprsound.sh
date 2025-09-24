#!/bin/bash

SOUND_WORKSPACE_CHANGE="$HOME/.config/hypr/sound/change_workspace.wav"
SOUND_WINDOW_OPEN="$HOME/.config/hypr/sound/add.wav"
SOUND_WINDOW_CLOSE="$HOME/.config/hypr/sound/remove.wav"
SOUND_FULLSCREEN_ENTER="$HOME/.config/hypr/sound/fullscreen.wav"
SOUND_FLOATING_TOGGLE="$HOME/.config/hypr/sound/float.wav"
SOUND_TILE_RESIZE="$HOME/.config/hypr/sound/tile.wav"

SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

# Função para tocar o som em segundo plano
play_sound() {
    paplay "$1" &
}

# Ouve o socket do Hyprland para eventos
socat - UNIX-CONNECT:$SOCKET_PATH | while read line; do
    case "$line" in
        "workspacev2"*)
            play_sound "$SOUND_WORKSPACE_CHANGE"
            ;;
        "openwindow"*)
            play_sound "$SOUND_WINDOW_OPEN"
            ;;
        "closewindow"*)
            play_sound "$SOUND_WINDOW_CLOSE"
            ;;
        "fullscreen"*)
            play_sound "$SOUND_FULLSCREEN_ENTER"
           ;;
        "changefloatingmode "*1)
            play_sound "$SOUND_FLOATING_TOGGLE"
            ;;
        "resizeactive"*)
            play_sound "$SOUND_TILE_RESIZE"
            ;; 
    esac
done
