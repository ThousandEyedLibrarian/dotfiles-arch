# Omarchy default configuration
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/carter/.lmstudio/bin"
# End of LM Studio CLI section
# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# --- Personal Customizations ---
# Editor
alias nv="nvim"
alias tutor='claude --agent tutor --disallowedTools "Write,Edit,MultiEdit,NotebookEdit" --permission-mode plan'

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
alias xc="xclip"
alias xv="xclip -o"
alias xcs="xclip -selection clipboard"
alias xvs="xclip -selection clipboard -o"

# Utilities
alias mkdir='mkdir -p'
alias x='exit'
alias sync-brain="cd ~/Sync/SecondBrain ; git pull ; git add . ; git commit -am 'Automated update.' ; git push ; cd -"

# Thumbnail generator
gen-thumbnail() {
    (cd /home/carter/Sync/personalCode/gen-thumbnail && .venv/bin/python3 gen_thumbnail.py "$@")
}

# Dotfiles bare repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles-arch/ --work-tree=$HOME'

# Rust/Cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
