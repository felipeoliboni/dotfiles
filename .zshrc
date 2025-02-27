# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export DOCKER_BUILDKIT=1

ZSH_THEME="gozilla"

plugins=(
    git
    archlinux
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r

# fastfetch. Will be disabled if above colorscript was chosen to install
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/folders in terminal
alias ls='eza --icons'
alias la='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias notas='code ~/blackhole/notas --disable-gpu'
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

export PATH
export GTK_IM_MODULE=xim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Created by `pipx` on 2025-01-30 12:58:21
export PATH="$PATH:/home/felipe/.local/bin"
