#Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

umask 026
set -o emacs
HISTSIZE=10000

# User specific aliases and functions
. ~/Dropbox/dotfiles/profile
#alias nvim='docker run --rm -it sandbox nvim'

