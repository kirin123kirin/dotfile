export PYTHONPATH=/usr/local/bin
export XDG_CONFIG_HOME=~/Dropbox/dotfiles
export XDG_CACHE_HOME=~/.cache
export XDG_RUNTIME_DIR=/usr/local/share/nvim/runtime
export EDITOR=vim
export LANG="ja_JP.UTF-8"

alias py2='sudo unlink /usr/bin/python;sudo ln -s /usr/bin/python2 /usr/bin/python'
alias py3='sudo unlink /usr/bin/python;sudo ln -s /usr/bin/python3 /usr/bin/python'
alias dropbox='python2.6 ~/bin/dropbox.py'

alias du="du -h"
alias df="df -h"

# Improve od for hexdump
alias od='od -Ax -tx1z'
alias hexdump='hexdump -C'

alias vim='DISPLAY=none nvim'