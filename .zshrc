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
alias cam='sudo modprobe v4l2loopback exclusive_caps=1 card_label="Virtual Webcam" && scrcpy --video-source=camera --no-audio --camera-facing=back --v4l2-sink=/dev/video0 --no-playback --camera-fps=60 --orientation=90'
alias code='code --new-window --wait'


source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


export PATH=$PATH:/home/felipe/.spicetify

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/felipe/google-cloud-sdk/path.zsh.inc' ]; then . '/home/felipe/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/felipe/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/felipe/google-cloud-sdk/completion.zsh.inc'; fi
