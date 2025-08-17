# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/eww/target/release:$PATH"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export WINEDDLOVERRIDES="d2d1=disabled"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# source /share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

[[ -f ~/.cache/wal/colors.sh ]] && source ~/.cache/wal/colors.sh

# use FZF
eval "$(fzf --zsh)"
# use the fuck
eval "$(thefuck --alias fuck)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls="eza --color=always --long --git --no-permissions --icons=always"
alias speed="speedtest-cli"
alias y="yazi"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Remove qualquer alias anterior chamado 'spot'
unalias spot 2>/dev/null

# Função para baixar com spotdl
spot() {
  local BASE_DIR=~/Músicas/music/artists/
  local SONG="$1"
  local ARTIST="$2"
  mkdir -p "$BASE_DIR/$ARTIST"
  spotdl "${SONG} ${ARTIST}" --bitrate 320k --output "$BASE_DIR/$ARTIST"
}

# Função para baixar com yt-dlp
yt() {
  local BASE_DIR=~/Músicas/music/artists/
  local URL="$1"
  local ARTIST="$2"
  mkdir -p "$BASE_DIR/$ARTIST"
  yt-dlp --embed-metadata --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 \
         -o "$BASE_DIR/$ARTIST/%(title)s.%(ext)s" "$URL"
}

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# change cd to Z using zoxide
eval "$(zoxide init zsh)"

# run neofetch on launch
# neofetch

eval $(thefuck --alias)
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/nvm/init-nvm.sh

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export EDITOR=nvim

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export PATH=/home/julliermy/.local/bin:/eww/target/release:/usr/lib/jvm/java-11-openjdk/bin:/home/julliermy/miniconda3/bin:/home/julliermy/.config/composer/vendor/bin:/home/julliermy/ncspot/target/debug:/home/julliermy/development/flutter/bin:/home/julliermy/.local/share/solana/install/releases/stable-6b04e8811190f74ebcd1c95c50fa724c11066dfe/solana-release/bin:/home/julliermy/eww/target/release:/home/julliermy/.cargo/bin:/usr/lib/jvm/java-11-openjdk/bin:/home/julliermy/miniconda3/bin:/home/julliermy/.config/composer/vendor/bin:/home/julliermy/ncspot/target/debug:/home/julliermy/development/flutter/bin:/home/julliermy/.local/share/solana/install/releases/stable-6b04e8811190f74ebcd1c95c50fa724c11066dfe/solana-release/bin:/home/julliermy/eww/target/release:/home/julliermy/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/julliermy/Android/cmdline-tools/latest/bin:/home/julliermy/Android/emulator:/home/julliermy/Android/platform-tools:/opt/spark/bin:/opt/spark/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:/home/julliermy/Android/cmdline-tools/latest/bin:/home/julliermy/Android/emulator:/home/julliermy/Android/platform-tools:/opt/spark/bin:/opt/spark/sbin:/home/julliermy/Android/Sdk/tools:/home/julliermy/Android/Sdk/platform-tools:/home/julliermy/Android/Sdk/emulator:/home/julliermy/Android/Sdk/cmdline-tools/latest/bin

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# pnpm
export PNPM_HOME="/home/julliermy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
