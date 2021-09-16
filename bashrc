
export TERM=screen-256color
set -o vi
export EDITOR=vim
# https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc/830343#830343
setxkbmap -option caps:escape
export PATH=$PATH:~/.local/bin

# https://reinhard.codes/2015/06/24/disabling-the-thinkpad-trackpoint-in-ubuntu/
# xinput disable "TPPS/2 Elan TrackPoint"
