#!/usr/bin/env bash

_prepare_for_ln() {
    local target=$1
    if [[ -e "$target" ]]; then
        if [[ -L "$target" ]]; then
            rm "$target"
        else
            mv "$target" "$target.bak"
        fi
    fi
}
target=~/.tmux.conf
_prepare_for_ln "$target"
ln -s ~/dotfiles/tmux/conf "$target"

target=~/.vimrc
_prepare_for_ln "$target"
# ln -s ~/dotfiles/vimrc "$target"
#
target=~/.vim
_prepare_for_ln "$target"
# ln -s ~/dotfiles/vim "$target"

target=~/.alacritty.yml
_prepare_for_ln "$target"
ln -s ~/dotfiles/alacritty.yml "$target"

target=~/.config/nvim/init.vim
_prepare_for_ln "$target"
ln -s ~/dotfiles/nvim/init.vim "$target"

target=~/.local/bin/fd
_prepare_for_ln "$target"
ln -s "$(which fdfind)" "$target"

target=~/.local/bin/rust-analyzer
_prepare_for_ln "$target"
ln -s ~/dotfiles/rust-analyzer "$target"

target=~/.local/bin/vim
_prepare_for_ln "$target"
ln -s ~/dotfiles/nvim/bin/nvim "$target"

target=~/.local/share/nvim/site
_prepare_for_ln "$target"
ln -s ~/dotfiles/nvim/site "$target"

target=~/.config/nvim/plugged
_prepare_for_ln "$target"
# ln -s ~/dotfiles/nvim/plugged "$target"

_add_once() {
    local target="$1"
    local exactLine="$2"
    if [[ ! -e "$target" ]]; then
        touch "$target"
        echo "touched '$target'"
    fi
    grep -qxF "$exactLine" "$target" || echo "$exactLine" >> "$target"
}
_add_once ~/.bash_profile 'source $HOME/dotfiles/bash_profile'
_add_once ~/.bashrc 'source $HOME/dotfiles/bashrc'

