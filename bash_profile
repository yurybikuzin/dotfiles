# ADD following line to ~/.bashrc
# source $HOME/dotfiles/bashrc

alias tmux='tmux -u'
TERM=screen-256color
set -o vi
export EDITOR=vim

# https://the-bosha.ru/2016/05/30/tmux-avtozapusk-pri-podkliuchenii-po-ssh/
if [[ -z $TMUX && -n $SSH_TTY ]]; then
    me=$(whoami)
    real_tmux=$(command -v tmux)

    if [ -z $real_tmux ]; then
        echo "No tmux installed."
    fi

    export TERM="xterm-256color"

    if $real_tmux has-session -t $me 2>/dev/null; then
        $real_tmux attach-session -t $me
    else
        if [[ -n $SSH_TTY ]]; then
            (tmux new-session -d -s $me && tmux attach-session -t $me)
        fi
    fi
fi
