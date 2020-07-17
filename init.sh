#!/usr/bin/env bash

ln -s ~/dotfiles/tmux/conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim

# shellcheck disable=SC2016
echo 'source $HOME/dotfiles/bash_profile' >> ~/.bash_profile

