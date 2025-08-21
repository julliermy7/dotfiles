#!/bin/bash

# Inicia aplicativos
vesktop &
disown
kdeconnectd &
disown
kdeconnect-indicator &
disown

# Configura MPD
mpc crossfade 7

# Reinicia o mpd-discord-rpc somente se estiver ativo
if systemctl --user is-active --quiet mpd-discord-rpc; then
  systemctl --user restart mpd-discord-rpc
fi

# Aguarda conexão com a internet antes de montar o Drive
until ping -c1 google.com &>/dev/null; do
  sleep 1
done

# Monta o Google Drive usando rclone
rclone mount Drive: ~/Drive \
  --vfs-cache-mode writes \
  --allow-other \
  --daemon
