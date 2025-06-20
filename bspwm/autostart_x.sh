#!/usr/bin/env bash

# Comandos para o X11
set b off

if ! xrandr | grep -q "1920x1080_60.00"; then
    xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode eDP-1 "1920x1080_60.00"
fi

# Aplica a resolução
xrandr --output eDP-1 --mode "1920x1080_60.00"

