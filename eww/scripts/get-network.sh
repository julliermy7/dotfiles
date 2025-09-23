#!/bin/bash

# Pega o nome do Wi-Fi se a interface wireless estiver ativa
SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="sim"{print $2}')

# Pega o nome da conexão ethernet se a interface estiver ativa
ETHERNET_NAME=$(nmcli -t -f NAME,TYPE connection show --active | grep ethernet | awk '{print $1}')

if [[ -n "$SSID" ]]; then
  # Se o SSID não estiver vazio, significa que estamos conectados via Wi-Fi
  echo "$SSID"
elif [[ -n "$ETHERNET_NAME" ]]; then
  # Se o nome da ethernet não estiver vazio, estamos conectados por cabo
  echo "$ETHERNET_NAME"
else
  # Se ambos estiverem vazios, não há conexão de internet ativa
  echo "None"
fi
