#!/bin/bash

# Inicia aplicativos
kdeconnect-indicator & disown

# Configura MPD
mpc crossfade 7

# Aguarda conexão com a internet antes de montar o Drive
until ping -c1 google.com &>/dev/null; do
  sleep 1
done

# Monta o Google Drive usando rclone
rclone mount Drive: ~/Drive \
  --vfs-cache-mode writes \
  --allow-other \
  --daemon
