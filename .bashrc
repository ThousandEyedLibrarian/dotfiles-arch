# Omarchy default configuration
source ~/.local/share/omarchy/default/bash/rc

# --- Personal Customizations ---

# Editor
alias nv="nvim"

# eza aliases (supplements omarchy defaults)
alias lt='eza --icons --tree --level=2'
alias lsa='eza --icons -a'
alias lta='eza --icons --tree --level=2 -a'

# fzf with bat preview
alias search='fzf --preview="bat --color=always {}"'

# Navigation shortcuts
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Clipboard (xclip)
alias c="xclip"
alias v="xclip -o"
alias cs="xclip -selection clipboard"
alias vs="xclip -selection clipboard -o"

# Utilities
alias mkdir='mkdir -p'
alias x='exit'
alias sync-brain="cd ~/Sync/SecondBrain ; git pull ; git add . ; git commit -am 'Automated update.' ; git push ; cd -"

# Dotfiles bare repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles-arch/ --work-tree=$HOME'

# Environment variables
export PATH="$PATH:$HOME/.local/bin"

# Rust/Cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
