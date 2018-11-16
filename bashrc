#!/bin/bash
# Oresama Setting
# v0.1
### Ore View ###
_SHELL=$(ps -p $$ | tail -n 1 | sed "s/^.* //g")
if [ $_SHELL = "bash" ];then
    case ${UID} in
    0)
        PS1='\[\033[31m\]${PWD}\$\[\033[0m\] '
        PS2='\[\033[31m\]>\[\033[0m\] '
        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PS1='\[\033[31m\]\u@\h'" ${PS1}"
        ;;
    *)
        PS1='\[\033[37m\]\w:\$\[\033[0m\] '
        PS2='\[\033[37m\]$\[\033[0m\] '
        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PS1='\[\033[36m\]\u@\h'" ${PS1}"
        ;;
    esac
fi

function treesize { # Directory Tree & sort by file size
    du -chx --max-depth=3 $@ | sort -h
}

# thanks. https://qiita.com/kawaz/items/1b61ee2dd4d1acc7cc94
function valid {
  type "$@" > /dev/null 2>&1
}

function isbinary {
  [ $(file --mime-encoding -b "$1") = "binary" ]
}

function iscompress {
  file $1 | grep -qs "compressed data"
}

### vi normalize
if valid gvim; then
    alias vim='gvim -v'
fi
alias vi='vim'

### Ore Environment ###
export TERM=xterm-256color 
export EDITOR=vim
export PROMPT_DIRTRIM=2
export PAGER='less -r'
export LANG=ja_JP.UTF-8
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups		#ignoredups,ignorespace,erasedups
export HISTIGNORE=cd:ls:ll:la:lla:pwd:vi:vim:exit	#you can use wild cart(*,?)
export TIMEFORMAT='real: %Rs  user: %Us  system: %Ss'
if [ $_SHELL = "bash" -o $_SHELL = "zsh" ];then
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
fi

BIN=$HOME/bin:$HOME/.local/bin:$HOME/usr/bin:$HOME/usr/local/bin

if [ -d $HOME/usr/local/python ]; then
  export PYTHONPATH=$HOME/usr/local/python
  BIN=$BIN:$PYTHONPATH/bin
  if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH=$PYTHONPATH/lib
  else
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHONPATH/lib
  fi
fi

if [ -f $PYTHONPATH/bin/python3 ]; then
  alias python="$PYTHONPATH/bin/python3"
  alias pip="$PYTHONPATH/bin/pip3"
  
  function topy3 {          # python2 source is convert to python3 source (overrite)
    ret=$(find $1 -type f -exec file {} \; | grep ": Python script" | cut -d ":" -f 1 | grep -v "\.md$")
    for x in $ret; do
        2to3 -wn $x
    done
  }
fi

export PATH=$BIN:$PATH
unset BIN

# Ore option
set -o emacs

if [ $_SHELL = "bash" ]; then 
    shopt -s autocd
fi
set completion-ignore-case on

# undefine C-Q C-S
stty start undef
stty stop undef

### Ore alias ###
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias dc='cd'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if valid git; then
  alias diff='git diff --no-index'
else
  alias diff='diff -u'
fi

### Default to human readable figures ###
alias df='df -h'
alias du='du -h'
alias dusort='du -d 1 | sort -n'
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias more='less'

# Some shortcuts for different directory listings
if [ $_SHELL = "bash" -o $_SHELL = "zsh" ];then
  alias ls='ls --show-control-chars --color=always'
  #alias ls='ls -hF --color=tty'                 # classify files in colour
  alias dir='ls --color=auto --format=vertical'
  alias vdir='ls --color=auto --format=long'
fi
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lla='ls -lA'
alias lld='ls -ld'
alias llt='ls -ltr'
alias lls='ls -lSr'
alias llx='ls -lX'
alias l='ls -F'
alias p='pwd'
alias 400='chmod 400'
alias 640='chmod 640'
alias 644='chmod 644'
alias 666='chmod 666'
alias 750='chmod 750'
alias 754='chmod 754'
alias 755='chmod 755'
alias 775='chmod 775'
alias 777='chmod 777'
alias orebackup='cd ~;tar czfh portable_linux_64.tgz bin dotfile usr'
alias r='. ~/.bashrc'
alias rg='rg --no-heading'
alias find='find -L'
alias be='xxd -u -g 1'
if [ $_SHELL = "bash" -o $_SHELL = "zsh" ]; then
  alias history="fc -l -$HISTSIZE"
elif [ $_SHELL = "ksh" ]; then
  unalias fc 2>/dev/null
  alias history="fc -lN $HISTSIZE"
fi

if valid gtac; then
  alias tac="gtac"
elif ! valid tac; then
  alias tac="tail -r"
else
  :
fi
  
if valid fzf; then
  if valid fd; then
    alias fd='fd -L'
    export FZF_DEFAULT_COMMAND='fd --type f --ignore-case --follow -E .git -E .svn -E old -E bak'
  else
    export FZF_DEFAULT_COMMAND='find * -type d \( -name ".git" -o -name ".svn"  -o -name "old" -o -name "bak" \) -prune -o -type f -print'
  fi
  export FZF_DEFAULT_OPTS="--no-mouse --layout=reverse --height=70% --border --preview 'preview {}' --preview-window down:wrap"
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

### Ore function ###
function opener {       #file or directory automatic open
  if [ "$1" = "" ];then
    return 1
  fi
  typeset fn=$(readlink -f $1)
  if [ -f $fn ]; then
      $EDITOR $fn
  elif [ -d $fn ]; then
      cd $fn
  else
      echo "File or Directory Not Found.."
      retun 1
  fi
}

if valid fzf; then
  # Thanks! http://bio-eco-evo.hatenablog.com/entry/2017/04/30/044703
  function fzf_cd {
    typeset sw="1" list slct
    while [ "$sw" != "0" ]
       do
          if [ "$sw" = "1" ];then
              list=$(echo -e "---$PWD\n../\n$( /bin/ls -F | grep / )\n---Show hidden directory\n---Show files, $(echo $(/bin/ls -F | grep -v / ))\n---HOME DIRECTORY")
          elif [ "$sw" = "2" ];then
              list=$(echo -e "---$PWD\n$( /bin/ls -a -F | grep / | sed 1d )\n---Hide hidden directory\n---Show files, $(echo $(/bin/ls -F | grep -v / ))\n---HOME DIRECTORY")
          else
              list=$(echo -e "---BACK\n$( /bin/ls -F | grep -v / )")
          fi
          
          slct=$(echo -e "$list" | fzf )
          
          if [ "$slct" = "---$PWD" ];then
              sw="0"
          elif [ "$slct" = "---Hide hidden directory" ];then
              sw="1"
          elif [ "$slct" = "---Show hidden directory" ];then
              sw="2"
          elif [ "$slct" = "---Show files, $(echo $(/bin/ls -F | grep -v / ))" ];then
              sw=$(($sw+2))
          elif [ "$slct" = "---HOME DIRECTORY" ];then
              builtin cd "$HOME"
          elif [[ "$slct" =~ / ]];then
              builtin cd "$slct"
          elif [ "$slct" = "" ];then
              :
          else
              sw=$(($sw-2))
          fi
       done
  }

  alias sd='fzf_cd'
fi

if [ ! -f $HOME/.cd_history ]; then
  echo $HOME > $HOME/.cd_history
fi

if [ ! -f $HOME/.bookmark ]; then
  touch $HOME/.bookmark
fi

function cd_func { # cd with histories
  if builtin cd "$@"; then
    if ! head -n 2 $HOME/.cd_history | grep -qs ${PWD}$; then
      sed -i "1s:^:$PWD\n:" $HOME/.cd_history
    fi
    echo "Changed: " `ls -d $PWD`
    echo ""
  fi
}
alias cd=cd_func

function cleanhist { #clean .cd_history
  if [ -f $HOME/.cd_history ];then
    grep -v "^$HOME$" $HOME/.cd_history | uniq > $HOME/.cd_history.unq
    if [ $(printf "%d" $(cat .cd_history |wc -l)) -ne 0 ]; then
      mv -f $HOME/.cd_history.unq $HOME/.cd_history
    else
      rm -f $HOME/.cd_history.unq
      echo $HOME > $HOME/.cd_history
    fi
  else
    echo $HOME > $HOME/.cd_history
  fi
}

########################################
alias abspath='readlink -f'

if valid fzf; then
  function grep_goto {    # ripgrep & opener
    typeset ret pth
    
    if [ "$1" = "" ]; then
      kw=.
    else
      kw=$1
    fi
    
    if valid rg; then
      ret=$(rg --hidden --files "$kw" | fzf )
    else
      ret=$(grep -rl "$kw" * | fzf )
    fi
    
    if [ ! -z "$ret" -a "$ret" != " " ]; then
      opener "$ret"
    fi
  }
  alias gg=grep_goto
  bind '"\C-g\C-g": "grep_goto\C-m"' > /dev/null 2>&1

  function change_direcoty_goto {  # recursive directory search & jump
    if valid fd; then
      opener $(fd . -L --type d | fzf)
    else
      opener $(find . -L -type d | fzf)
    fi
  }
  alias cdgo=change_direcoty_goto
  bind '"\C-x\C-x": "change_direcoty_goto\C-m"' > /dev/null 2>&1

  function find_open {  # recursive find & open
    if valid fd; then
      opener $(fd | fzf)
    else
      opener $(find | fzf)
    fi
  }
  alias fo=find_open
  bind '"\C-o\C-o": "find_open\C-m"' > /dev/null 2>&1

  function bookmark {   #lookup bookmark
    opener $(cat $HOME/.bookmark | fzf)
  }
  alias b=bookmark

  function fzf_select_history {
    READLINE_LINE=$(HISTTIMEFORMAT= history|sort -uk 2|sort -nr|sed -E 's/^[\t0-9]+//g'| fzf --query "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
  }
  bind -x '"\C-r": fzf_select_history' > /dev/null 2>&1

  function loc {    # fzf: locate & open
    typeset pth
    if [ "$*" = "" ]; then
      pth=/
    else
      pth=$*
    fi
    opener $(locate $pth | fzf)
  }
  bind '"\C-x\C-f": "\C-aloc \C-m"' > /dev/null 2>&1

  function locbasename {  # fzf: locate basename only & open
    typeset pth
    if [ "$@" = "" ]; then
      pth=/
    else
      pth=$*
    fi
    opener $(locate -b $pth | fzf)
  }
  alias lb='locbasename'

  function histcd {  # fzf : recently Changed directory
    opener $(catuniq $HOME/.cd_history | xargs ls -d 2> /dev/null | fzf)
  }
  bind '"\C-x\C-c": "histcd\C-m"' > /dev/null 2>&1

  function histvi {  # fzf : recently vim opened file
    opener $(grep "^> " $HOME/.viminfo | cut -c 3- | tacuniq | sed "s:~:$HOME:g" | xargs ls -d 2> /dev/null | fzf)
  }
  bind '"\C-x\C-v": "histvi\C-m"' > /dev/null 2>&1

  function hist {  # fzf : recently bash cmd or Changed directory
    typeset ret
    ret=`(uniq $HOME/.cd_history && grep "^> " $HOME/.viminfo | uniq | cut -b 3- | sed "s:~:$HOME:g") | sort | uniq -c | sort -nr | cut -b 9- | xargs ls -d 2> /dev/null | fzf`
    opener $ret
  }
  bind '"\C-x\C-h": "hist\C-m"' > /dev/null 2>&1
fi

function save_bookmark {   # save bookmark
  echo $PWD >> $HOME/.bookmark
}
alias s=save_bookmark

function open_bookmark {    # open edit bookmark
  opener $HOME/.bookmark
}
alias bo=open_bookmark

function catuniq {
  cat -n "$@" | sort -uk 2 | sort | sed "s/^.*\t//g"
}

function tacuniq {
  tac "$@" | cat -n | sort -uk 2 | sort | sed "s/^.*\t//g"
}

function h {
  if [ $_SHELL = "bash" -o $_SHELL = "zsh" ];then
    (alias ; bind -s | sed 's/\C-m//g' | sed 's/^/bind /g' ; for fc in $(declare -F | sed "s/^declare -f //g"); do grep -h "^function $fc" $HOME/.bashrc $HOME/dotfile/bashrc 2>/dev/null; done) | sort -u | less
  elif [ $_SHELL = "ksh" ]; then
    (alias | sed 's/^/alias /g'; functions | grep "^function ") | sort | less
  else
    echo "Unknown shell" $_SHELL
    return 1
  fi
}

bind '"\C-t": "\C-atime "' > /dev/null 2>&1 #time command shortcut

function rep {          # firster replace function
  typeset arg
  arg="$(cat -)"
  echo "$arg" | rg "$1" -r "$2" -C 9999999999999999999
}

function between {     # between cat lines
  awk "$1<=NR && NR<=$2"
}
alias bt='between'

function extract {   # extract any archived file
  if [ -z "$1" ]; then
      # display usage if no parameters given
      echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
      echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
      for n in "$@"
      do
        if [ -f "$n" ] ; then
            case "${n%,}" in
              *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                           tar xvf "$n"       ;;
              *.lzma)      unlzma ./"$n"      ;;
              *.bz2)       bunzip2 ./"$n"     ;;
              *.rar)       unrar x -ad ./"$n" ;;
              *.gz)        gunzip ./"$n"      ;;
              *.zip)       unzip ./"$n"       ;;
              *.z)         uncompress ./"$n"  ;;
              *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                           7z x ./"$n"        ;;
              *.xz)        unxz ./"$n"        ;;
              *.exe)       cabextract ./"$n"  ;;
              *.cpio)      cpio -id < ./"$n"  ;;
              *)
                           echo "extract: '$n' - unknown archive method"
                           return 1
                           ;;
            esac
        else
            echo "'$n' - file does not exist"
            return 1
        fi
      done
  fi
}

function compress {
  typeset FILE=$1
  shift
  case $FILE in
      *.tar.bz2) tar cjfh $FILE $*  ;;
      *.tar.gz)  tar czfh $FILE $*  ;;
      *.tgz)     tar czfh $FILE $*  ;;
      *.zip)     zip -r $FILE $*      ;;
      *.rar)     rar $FILE $*      ;;
      *)         echo "Filetype not recognized" ;;
  esac
}

function lscompress {   # lscompress any archived file
  if [ -z "$1" ]; then
    echo "Usage: lscompress <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    for n in $(ls $@); do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar|*.zip) 
                          less "$n"       ;;
            *.bz2)        bzless ./"$n"     ;;
            *.gz|*.z|*.Z) zless ./"$n"      ;;
            *.xz)         xzless ./"$n"        ;;
            *)
                         echo "lscompress: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
  fi
}

function vimgrep {
  typeset ret=`rg --vimgrep $@ | fzf`
  if [ "$ret" = "" ];then
    return 1
  fi
  vim -p `echo $ret | cut -d ":" -f 1,2 | sed "s/:/ +/g"`
}
alias vg='vimgrep'
bind '"\C-x\C-g": "vimgrep\C-m"' > /dev/null 2>&1

