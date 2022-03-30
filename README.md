# .dotfiles

Nothing special, you know...

## TMUX on iTerm2 startup

`tmux ls && read tmux_session && tmux attach -t ${tmux_session:-default} || tmux new -s ${tmux_session:-default}`

## Neovim

Neovim goes to `~/.config/nvim/init.vim`
