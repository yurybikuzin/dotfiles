ln ~/dotfiles/tmux/conf ~/.tmux.conf
ln ~/dotfiles/tmux/conf.linux ~/.tmux.conf.linux
ln ~/dotfiles/tmux/conf.osx ~/.tmux.conf.osx
ln ~/dotfiles/tmux/conf.cygwin ~/.tmux.conf.cygwin

ln ~/dotfiles/vimrc ~/.vimrc
ln ~/dotfiles/vim ~/.vim

# shellcheck disable=SC2016
echo 'source $HOME/dotfiles/bash_profile' >> ~/.bash_profile

