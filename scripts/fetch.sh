#!/bin/bash

kitty --class fastfetch-popup -o allow_remote_control=yes -e sh -c "fastfetch; read -n 1"
