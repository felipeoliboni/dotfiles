export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud"

plugins=(
    git
    archlinux
    kubectl
    kitty
    zsh-interactive-cd
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias pacman='sudo pacman'
alias code='code --new-window --wait'

alias cam='
if ! lsmod | grep -q v4l2loopback; then
  sudo modprobe v4l2loopback card_label="Webcam"
fi

scrcpy --video-source=camera --camera-size=1920x1080 --camera-fps=30 --no-audio --v4l2-sink=/dev/video0 --no-playback
'



source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


