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
ln -s ~/dotfiles/vimrc "$target"

target=~/.vim
_prepare_for_ln "$target"
ln -s ~/dotfiles/vim "$target"

target=~/.alacritty.yml
_prepare_for_ln "$target"
ln -s ~/dotfiles/alacritty.yml ~/.alacritty.yml

_add_once() {
    local target="$1"
    local exactLine="$2"
    if [[ ! -e "$target" ]]; then
        touch "$target"
    fi
    grep -qxF "$exactLine" "$target" || echo "$exactLine" >> "$target"
}
_add_once ~/.bash_profile 'source $HOME/dotfiles/bash_profile'
_add_once ~/.bashrc 'source $HOME/dotfiles/bashrc'

