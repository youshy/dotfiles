plugins=(git osx)

alias ga='git add'
alias gaa='git add --all'
alias gs='git status'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gp='git push'
alias gl='git pull'
alias mygit='cd ~/Desktop/git/'
alias mywork='cd ~/Desktop/work/'

mkcd () {
  mkdir "$1"
  cd "$1"
}

setgit() {
	DIR=${PWD}
	echo ${DIR}
	cp /Users/arturkondas/Desktop/git/shell-playground/github-setup.sh ${DIR}
	sh github-setup.sh
	rm -rf github-setup.sh
}

regit() {
	git config user.name youshy
	git config user.email devilyoushy@gmail.com
}

export NVM_DIR="/Users/arturkondas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)🍕"
  fi
}

eval $(thefuck --alias)
