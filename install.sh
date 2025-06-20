#!/bin/bash

# Parar em caso de erro
set -e

echo "Instalando aplicativos e dependências..."

# Atualização do sistema e instalação de apps
sudo dnf upgrade -y
sudo dnf install -y alacritty neovim polybar dunst cava fastfetch sxhkd bspwm picom mpd ncmpcpp feh zsh python3-pip ImageMagick procps-ng

sudo pip3 install pywal

echo "Instalação concluida com sucesso."

echo "Criando os symlinks..."

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
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/dotfiles/wallpapers ~/Imagens/wallpapers
ln -sf ~/dotfiles/gtk-3.0 ~/.config/gtk-3.0
ln -sf ~/dotfiles/cava ~/.config/cava

echo "Symlinks criados com sucesso!"

echo "Dotfiles instalado com sucesso."
