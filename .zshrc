# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ga='git add'
alias gaa='git add --all'
alias gs='git status'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gp='git push'
alias gl='git pull'
alias gcr='git add README.md && git commit -m "Update README.md"'
alias mygit='cd ~/Desktop/git/'
alias work='cd ~/Desktop/work/'
alias mygo='cd ~/go/src'
alias dt='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias lywe='cd ~/Desktop/LyweMusic'

alias l='ls -la'
alias ..='cd ..'
alias ...='cd ../'

alias readmes='find . -type d -exec touch {}/README.md \;'

alias l='ls -latr'

mkcd () {
  mkdir "$1"
  cd "$1"
}

forgot() {
  ~/Desktop/git/forgot/forgotten "$1"
}

gprune() {
  git fetch --prune
  git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

# Edit line in vim with ctrl/cmd -e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Go setup
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

eval $(thefuck --alias)

export VISUAL=vim
export EDITOR="$VISUAL"
