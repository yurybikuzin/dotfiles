# ADD following line to ~/.bash_profile:
# source $HOME/dotfiles/bash_profile

alias tmux='tmux -u'
TERM=screen-256color
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
set -o vi
export EDITOR=vim
