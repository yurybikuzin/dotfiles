#!/usr/bin/env bash

if [[ -e ~/.tmux.conf ]]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -s ~/dotfiles/tmux/conf ~/.tmux.conf

if [[ -e ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/dotfiles/vimrc ~/.vimrc

if [[ -e ~/.vim ]]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s ~/dotfiles/vim ~/.vim

if [[ -e ~/.alacritty.yml ]]; then
    mv ~/.alacritty.yml ~/.alacritty.yml.bak
fi
ln -s ~/dotfiles/alacritty.yml ~/.alacritty.yml

# shellcheck disable=SC2016
# echo 'source $HOME/dotfiles/bash_profile' >> ~/.bash_profile

target=~/.bash_profile
exactLine='source $HOME/dotfiles/bash_profile'
grep -qxF "$exactLine" "$target" || echo "$exactLine" >> "$target"

