#!/bin/bash

# Habilitar o repositório 'extra' no pacman.conf
echo "Habilitando o repositório 'extra' do Arch Linux..."
sudo sed -i '/^#\[extra\]$/,/^Include = \/etc\/pacman.d\/mirrorlist$/s/^#//' /etc/pacman.conf

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

# ------------------------------------

# Diretório de dotfiles. Assumimos que o script está dentro dele.
DOTFILES_DIR=$(pwd)
echo "Diretório de dotfiles: $DOTFILES_DIR"

# Criar links simbólicos para as configurações
echo "Criando links simbólicos para as configurações..."

# Assegura que o diretório ~/.config exista
mkdir -p "$HOME/.config"

# Pastas de configuração que você listou
FOLDERS_TO_LINK=("cava" "dunst" "eww" "fastfetch" "fontconfig" "hypr" "kitty" "nvim" "rmpc" "rofi" "scripts" "swaync" "wal" "yazi" "zathura")

for folder in "${FOLDERS_TO_LINK[@]}"; do
    SOURCE_PATH="$DOTFILES_DIR/$folder"
    DEST_PATH="$HOME/.config/$folder"
    
    # Verifica se a pasta de origem existe
    if [ -d "$SOURCE_PATH" ]; then
        
        # ❗ CORREÇÃO: Remove o diretório de destino se ele existir e NÃO for um link simbólico.
        if [ -d "$DEST_PATH" ] && [ ! -L "$DEST_PATH" ]; then
            echo "Aviso: Removendo pasta de configuração existente $folder..."
            rm -rf "$DEST_PATH"
        fi
        
        # Cria o link simbólico
        ln -sfn "$SOURCE_PATH" "$DEST_PATH"
        echo "Link criado: $DEST_PATH -> $SOURCE_PATH"
    else
        echo "A pasta $SOURCE_PATH não foi encontrada. Pulando..."
    fi
done

# Criar links simbólicos para arquivos no diretório HOME (ex: .zshrc)
echo "Criando links simbólicos para arquivos na pasta HOME..."
FILES_TO_LINK=(".zshrc" ".zshenv" ".p10k.zsh")
for file in "${FILES_TO_LINK[@]}"; do
    SOURCE_PATH="$DOTFILES_DIR/$file"
    DEST_PATH="$HOME/$file"
    if [ -f "$SOURCE_PATH" ]; then
        ln -sfn "$SOURCE_PATH" "$DEST_PATH"
        echo "Link criado: $DEST_PATH -> $SOURCE_PATH"
    else
        echo "O arquivo $SOURCE_PATH não foi encontrado. Pulando..."
    fi
done

# Criar link simbólico para a pasta 'wallpapers' na HOME
echo "Criando link simbólico para a pasta 'wallpapers' na HOME..."
if [ -d "$DOTFILES_DIR/wallpapers" ]; then
    if [ -d "$HOME/wallpapers" ] && [ ! -L "$HOME/wallpapers" ]; then
        echo "Aviso: Removendo pasta ~/wallpapers existente..."
        rm -rf "$HOME/wallpapers"
    fi
    ln -sfn "$DOTFILES_DIR/wallpapers" "$HOME/wallpapers"
    echo "Link criado: $HOME/wallpapers -> $DOTFILES_DIR/wallpapers"
else
    echo "A pasta de wallpapers não foi encontrada. Pulando..."
fi

# Criar link simbólico para os scripts na HOME
echo "Criando link simbólico para a pasta 'scripts' na HOME..."
if [ -d "$DOTFILES_DIR/scripts" ]; then
    if [ -d "$HOME/scripts" ] && [ ! -L "$HOME/scripts" ]; then
        echo "Aviso: Removendo pasta ~/scripts existente..."
        rm -rf "$HOME/scripts"
    fi
    ln -sfn "$DOTFILES_DIR/scripts" "$HOME/scripts"
    echo "Link criado: $HOME/scripts -> $DOTFILES_DIR/scripts"
else
    echo "A pasta de scripts não foi encontrada. Pulando..."
fi

# Criar link simbólico para o cache do wals na HOME
echo "Criando link simbólico para a pasta 'wal' no cache..."
if [ -d "$DOTFILES_DIR/.cache/wal" ]; then
    # O destino precisa ser o diretório do link, não o diretório pai.
    # O link será criado em ~/.cache/wal
    if [ -d "$HOME/.cache/wal" ] && [ ! -L "$HOME/.cache/wal" ]; then
        echo "Aviso: Removendo pasta de cache do pywal existente..."
        rm -rf "$HOME/.cache/wal"
    fi

    ln -sfn "$DOTFILES_DIR/.cache/wal" "$HOME/.cache/wal"
    echo "Link criado: $HOME/.cache/wal -> $DOTFILES_DIR/.cache/wal"

    # Criando o link para a pasta de cache, se realmente for necessário
    # Nota: Geralmente o cache não precisa de link, a pasta do pywal sim.
    # Se você tem configurações do pywal em uma pasta "wal" no seu dotfiles
    # e deseja lincar para ~/.config/wal, o comando é:
    # ln -sfn "$DOTFILES_DIR/wal" "$HOME/.config/wal"

else
    echo "A pasta de cache do pywal não foi encontrada. Pulando a criação do link..."
fi


# Instalar yay (AUR helper)
# ... (Restante do script)

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

# Instalação do Eww
echo "Instalando Eww..."
cd $DOTFILES_DIR/eww
cargo build --release --no-default-features --features=wayland
sudo cp target/release/eww /usr/local/bin/

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
