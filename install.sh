#!/bin/bash

# Parar em caso de erro
set -e

# Cria a pasta de wallpapers
mkdir -p ~/Imagens/wallpapers

# Criação dos symlinks
ln -sf ~/dotfiles/alacritty ~/.config/alacritty
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/polybar ~/.config/polybar
ln -sf ~/dotfiles/dunst ~/.config/dunst
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/sxhkd ~/.config/sxhkd
ln -sf ~/dotfiles/bspwm ~/.config/bspwm
ln -sf ~/dotfiles/picom ~/.config/picom
ln -sf ~/dotfiles/feh ~/.config/feh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/wallpapers ~/Imagens/wallpapers

echo "Symlinks criados com sucesso!"

