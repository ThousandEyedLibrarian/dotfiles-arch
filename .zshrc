# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# Set powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# List of plugins used
plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Your custom functions (same as macOS)
function pipx_inject_requirements () {
    pipx runpip $1 install -r $2
}

# gt functions (same as your macOS config)
function gt() {
    if [ $# -eq 0 ]; then
        echo "Usage: gt <directory_name>"
        echo "Example: gt Documents"
        return 1
    fi

    local search_term="$1"
    local result=$(fd --type d --max-results 1 "$search_term" 2>/dev/null)
    
    if [ -z "$result" ]; then
        echo "No directory found matching: $search_term"
        return 1
    fi
    
    echo "Navigating to: $result"
    cd "$result" || {
        echo "Failed to navigate to: $result"
        return 1
    }
    
    pwd
}

# Linux-specific aliases (modified from your macOS ones)
alias  l='ls -lh'
alias ls='ls -1 --color=auto'
alias ll='ls -lha --color=auto'
alias ld='ls -lhd */ --color=auto'
alias nv="nvim"
alias gs='git status -sb'
alias gcc='git checkout'
alias gcm='git checkout master'
alias gaa='git add --all'
alias gc='git commit -m $2'
alias gca='git commit -a'
alias push='git push'
alias gpo='git push origin'
alias pull='git pull'
alias clone='git clone'
alias stash='git stash'
alias pop='git stash pop'
alias ga='git add'
alias gb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gm='git merge'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias x="exit"  # Simple exit for Linux
alias config='/usr/bin/git --git-dir=$HOME/dotfiles-arch/ --work-tree=$HOME'
alias search='fzf --preview="bat --color=always {}"'
alias mkdir='mkdir -p'

# Linux clipboard aliases (using xclip)
alias c="xclip -selection clipboard"
alias v="xclip -o -selection clipboard"

# Environment variables
export PATH="$PATH:$HOME/.local/bin"
export GPG_TTY=$(tty)


# Source p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
