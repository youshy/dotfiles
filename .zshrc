plugins=(git osx)

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
alias du='cd ~/Downloads'

alias pg_start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pg_stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pg_clean='rm /usr/local/var/postgres/postmaster.pid'

alias l='ls -la'
alias .='cd ..'
alias ..='cd ...'
alias ...='cd ....'

alias getme='pwd | pbcopy'

alias idea='open -a "`ls -dt /Applications/IntelliJ\ IDEA*|head -1`"'

alias da='docker ps --all'

alias matrix='sh /Users/arturkondas/Desktop/git/playground/gomatrix.sh'

alias redis='~/Downloads/redis-5.0.7/src/redis-server'

alias ip='curl ifconfig.me'

alias readmes='find . -type d -exec touch {}/README.md \;'

mkcd () {
  mkdir "$1"
  cd "$1"
}

# Set below depending on your OS/GOPATH

gu() {
  /Users/arturkondas/go/src/github.com/gitutil/gitutil "$1" "$2" "$3"
}

# Only if proper setup of Ruby and Python. Install mdless first

mark() {
	cat README.md | mdless
}

wiki () {
  /Users/arturkondas/go/src/github.com/wiki/wiki "$1"
}

nju () {
  /Users/arturkondas/go/src/github.com/nju/nju "$1" "$2"
}

export NVM_DIR="/Users/arturkondas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)🍕"
  fi
}

# Edit line in vim with ctrl/cmd -e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

eval $(thefuck --alias)
