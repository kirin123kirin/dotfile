#Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

umask 022
set -o emacs
HISTSIZE=10000

# User specific aliases and functions
. ~/Dropbox/dotfile/profile

