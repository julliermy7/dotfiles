#!/bin/bash

# Pacotes necessários via pacman
echo "Instalando pacotes via pacman..."
sudo pacman -Syu --noconfirm # Atualiza a lista de pacotes
sudo pacman -S --noconfirm git flatpak github-cli pamixer firefox brightnessctl playerctl ncspot rofi hyprlock hypridle hyprpaper yazi neovim bottom networkmanager mpd rustup inter-font zsh imagemagick rmpc acpi zathura swaync pavucontrol

# ❗ NOVA SEÇÃO: Configuração do Flatpak
# ------------------------------------
echo "Configurando Flatpak e instalando Oomox..."

# Adiciona o repositório Flathub
echo "Adicionando o repositório Flathub..."
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instala o aplicativo Oomox
echo "Instalando com.github.themix_project.Oomox via Flatpak..."
flatpak install flathub com.github.themix_project.Oomox -y

# Criaçao dos links simbolicos

# backup do hypr e do kitty
mv ~/.config/hypr ~/.config/hypr.bak
mv ~/.config/kitty ~/.config/kitty.bak
mv ~/.cache/wal ~/.cache/wal.bak

cp -r ~/dotfiles/.icons ~/.icons

ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/swaync ~/.config/swaync
ln -sf ~/dotfiles/rofi ~/.config/rofi
ln -sf ~/dotfiles/fontconfig ~/.config/fontconfig
ln -sf ~/dotfiles/rmpc ~/.config/rmpc
ln -sf ~/dotfiles/cava ~/.config/cava
ln -sf ~/dotfiles/eww ~/.config/eww
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/wallpapers ~/wallpapers
ln -sf ~/dotfiles/scripts ~/scripts
ln -sf ~/dotfiles/yay ~/.config/yay
ln -sf ~/dotfiles/yazi ~/.config/yazi
ln -sf ~/dotfiles/dunst ~/.config/dunst
ln -sf ~/dotfiles/zathura ~/.config/zathura
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.cache/wal ~/.cache/

# Instalar yay (AUR helper)
echo "Instalando yay (AUR helper)..."
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Instalar pacotes via yay
echo "Instalando pacotes via yay..."
yay -S --noconfirm fastfetch cmatrix cava python-pywal ttf-iosevka otf-hermit-nerd gvfs dbus libdbusmenu-glib libdbusmenu-gtk3 gtk-layer-shell zoxide eza fzf thefuck jq socat nvm btop hyprshot bluez bluez-utils bluez-obex bluetuith python-gobject

# Instalar Powerlevel10k para zsh
echo "Configurando Powerlevel10k..."
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Eww installation
cd $HOME
curl --proto '=https' -- tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
sudo cp ./eww /usr/local/bin/


# Configuração do Network Manager
echo "Configurando Network Manager e Bluetooth..."
sudo systemctl disable systemd-resolved
sudo systemctl disable systemd-networkd
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Mudar o shell padrão para zsh
echo "Mudando o shell padrão para zsh..."
chsh -s /usr/bin/zsh

# Reboot
echo "Instalação completa. O sistema irá reiniciar agora."
sudo reboot
