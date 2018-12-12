#!/bin/bash
# Oresama Setting
# v0.1
#set -eu

### Ore View ###
_SHELL=$(ps -p $$ | tail -n 1 | sed "s/^.* //g")

if [ $_SHELL = "bash" ];then
  case ${UID} in
    0)
      PS1='\[\033[31m\]${PWD}\$\[\033[0m\] '
      PS2='\[\033[31m\]>\[\033[0m\] '
      #[ -n "${REMOTEHOST:-}${SSH_CONNECTION:-}" ] && PS1='\[\033[31m\]\u@\h'" ${PS1}"
      PS1='\[\033[31m\]\u@\h'" ${PS1}"
      ;;
    *)
      PS1='\[\033[37m\]\w:\$\[\033[0m\] '
      PS2='\[\033[37m\]$\[\033[0m\] '
      #[ -n "${REMOTEHOST:-}${SSH_CONNECTION:-}" ] && PS1='\[\033[36m\]\u@\h'" ${PS1}"
      PS1='\[\033[36m\]\u@\h'" ${PS1}"
      ;;
  esac

elif [ $_SHELL = "ksh" ]; then
  case $USER in
    root)
      export PS1="
$LOGNAME@$(hostname) \$PWD
# " ;;

    *)
      export PS1="
$LOGNAME@$(hostname) \$PWD
$ " ;;
  esac
fi

if [ -d /etc/X11 ]; then
  if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(echo $SSH_CLIENT| cut -d " " -f1):0.0
  fi
fi

# thanks. https://qiita.com/kawaz/items/1b61ee2dd4d1acc7cc94
function valid {
  type "$@" > /dev/null 2>&1
}

# thanks. https://github.com/faif/shell-utils/blob/master/shell-utils.sh
# Arguments: $@ -> message to print
function perr { # prints an error message to STDERR
    printf "ERROR: ${@}\n" >&2
}

# Arguments: $@ -> message to print
function pwarn { # print a warning nessage to STDERR
    printf "WARNING: ${@}\n" >&2
}


# Arguments: $@ -> message to print
function puse { # print a usage message and then exits
    printf "USAGE: ${@}\n" >&2
}

# Arguments: $1 -> The prompt
#            $2 -> The default answer (optional)
# Variables: yesno -> set to the user response (y for yes, n for no)
function prompt_yn { # ask a yes/no question
    if [ $# -lt 1 ]
    then
  puse "prompt_yn prompt [default answer]"
  return 1
    fi

    def_arg=""
    yesno=""

    case "${2}" in
  [yY]|[yY][eE][sS])
      def_arg=y ;;
  [nN]|[nN][oO])
      def_arg=n ;;
    esac

    while :
    do
  printf "${1} (y/n)? "
  test -n "${def_arg}" && printf "[${def_arg}] "

  read yesno
  test -z "${yesno}" && yesno="${def_arg}"

  case "${yesno}" in
      [yY]|[yY][eE][sS])
    yesno=y ; break ;;
      [nN]|[nN][oO])
    yesno=n ; break ;;
      *)
    yesno="" ;;
  esac
    done

    export yesno
    unset def_arg
}

if [ -d $HOME/usr/local/nvim ]; then
  export VIM=$HOME/usr/local/nvim/share/nvim/runtime
  export PATH=$PATH:$HOME/usr/local/nvim/bin
fi

if [ -d /usr/local/lib/neovim ]; then
  export VIM=/usr/local/lib/neovim/share/nvim/runtime
  export PATH=$PATH:/usr/local/lib/neovim/bin
fi


### vi normalize
if valid nvim; then
  alias vim='nvim'
elif valid gvim; then
  alias vim='gvim -v'
fi
alias vi='vim'

### Ore Environment ###
export TERM=xterm-256color 
export EDITOR=vim
export FCEDIT=$EDITOR
export PROMPT_DIRTRIM=2
export PAGER='less -r'
export LANG=ja_JP.UTF-8
export LC_CTYPE=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG
export LC_COLLATE=C # 重大な性能劣化起こすため最低限これだけはCにすべき
export LC_MONETARY=$LANG
export LC_MESSAGES=$LANG
export LC_PAPER=$LANG
export LC_NAME=$LANG
export LC_ADDRESS=$LANG
export LC_TELEPHONE=$LANG
export LC_MEASUREMENT=$LANG
export LC_IDENTIFICATION=$LANG
export HISTSIZE=10000
export HISTFILESIZE=10000
#export HISTCONTROL=ignoredups    #ignoredups,ignorespace,erasedups
export HISTIGNORE=cd:ls:ll:la:lla:pwd:exit  #you can use wild cart(*,?)
export TIMEFORMAT='real: %Rs  user: %Us  system: %Ss'
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export MANPATH=/usr/local/man/ja:/usr/local/share/man/ja:/usr/share/man/ja:/usr/X11R6/man/ja:$HOME/.local/share/man
alias updatemandb='mandb -uc ~/.local/share/man'
alias sort="LC_ALL=C sort"
alias uniq="LC_ALL=C uniq"
alias sed="LC_ALL=C sed"
alias tr="LC_ALL=C tr"
alias cut="LC_ALL=C cut"

BIN=$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/usr/bin:$HOME/usr/sbin:$HOME/usr/local/bin:$HOME/usr/local/sbin

if [ -d $HOME/usr/local/python ]; then
  export PYTHONPATH=$HOME/usr/local/python
  BIN=$BIN:$PYTHONPATH/bin
  if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH=$PYTHONPATH/lib
  else
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHONPATH/lib
  fi
fi


if [ -d "${1:-}" ]; then
  WORKDIR=$1
  _PATH=$BIN:$HOME/usr/bin:$HOME/usr/local/bin:$HOME/local/bin:$PATH
else
  WORKDIR=$HOME
  _PATH=$BIN:$WORKDIR/usr/bin:$WORKDIR/usr/local/bin:$WORKDIR/local/bin:$PATH
fi
export PATH=$(echo $_PATH | tr ":" "\n" | xargs \ls -d 2>/dev/null | cat -n | sort -uk 2 | sort -n | sed "s/^.*\t//g" | tr "\n" ":" | sed "s/:*$//g")
unset _PATH
unset BIN

export WORKCDHISTFILE=$WORKDIR/.cd_history
export WORKBOOKMARKFILE=$WORKDIR/.bookmark


if valid python3 && [[ ${PYTHONPATH:-} != "" ]]; then
  alias python="$PYTHONPATH/bin/python3"
  alias pip="$PYTHONPATH/bin/pip3"
  
  function topy3 {          # python2 source is convert to python3 source (overrite)
    ret=$(find $1 -type f -exec file {} \; | grep ": Python script" | cut -d ":" -f 1 | grep -v "\.md$")
    for x in $ret; do
        2to3 -wn $x
    done
  }
fi

if valid go; then
  GOBASE=$HOME/.go
  export GOWORK=$GOBASE/workspace
  export GOPATH=$GOBASE/package:$GOWORK
  export PATH=$PATH:$GOBASE/package/bin:$GOWORK/bin
  if [ ! -d $GOBASE ]; then
    mkdir -p $GOBASE/package $GOWORK
  fi
fi

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
  alias diff='LC_ALL=C git diff --color --no-index'
  
  alias gitgc='git reflog expire --expire=now --all && git gc --aggressive --prune=now'
  alias gitname='git config --global user.name'
  alias gitemail='git config --global user.email'
  alias gitpass="git config --global credential.helper 'cache --timeout=3600'"
  function gitpush {
    git add .
    git commit -m "$1"
    git push origin master
  }
else
  alias diff='LC_ALL=C diff -u'
fi

### Default to human readable figures ###
alias df='df -Th'
alias du='du -h'
alias dusort='du -d 1 | sort -n'
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='LC_ALL=C grep --color'            # show differences in colour
alias egrep='LC_ALL=C egrep --color=auto'     # show differences in colour
alias fgrep='LC_ALL=C fgrep --color=auto'     # show differences in colour
alias more='less'

# Some shortcuts for different directory listings
alias ls='ls --show-control-chars --color=always --time-style=+%Y-%m-%d\ %H:%M:%S'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lla='ll -A'
alias lld='ll -d'
alias llt='ll -tr'
alias lls='ll -Sr'
alias llx='ll -X'
alias l='ls -1'
alias p='pwd'
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"
alias 400='chmod 400'
alias 440='chmod 440'
alias 444='chmod 444'
alias 600='chmod 600'
alias 640='chmod 640'
alias 644='chmod 644'
alias 664='chmod 664'
alias 666='chmod 666'
alias 700='chmod 700'
alias 750='chmod 750'
alias 754='chmod 754'
alias 755='chmod 755'
alias 775='chmod 775'
alias 777='chmod 777'
if [ "$USER" = "yellow" ]; then
  alias backupore='\cd ~;tar czfh tmp/portable_linux_64.tgz .local dotfile usr; \cd -'
  alias backuplocal='\cd ~; tar czfh ~/dotfile/local.tar.gz .local; \cd -'
fi

if valid yum; then
  alias yum='sudo yum'
elif valid apt-get; then
  alias apt-get='sudo apt-get'
fi

if [ $_SHELL = "bash" ]; then
  alias rr='. ~/.bashrc'
elif [ $_SHELL = "ksh" ]; then
  alias rr='. ~/.kshrc'
fi

if valid rg; then
  alias rg='LC_ALL=C rg --no-heading'
fi
alias find='LC_ALL=C find -L'
alias be='xxd -u -g 1'
if [ $_SHELL = "bash" -o $_SHELL = "zsh" ]; then
  alias history="LC_ALL=C fc -l -$HISTSIZE"
elif [ $_SHELL = "ksh" ]; then
  unalias fc 2>/dev/null
  alias history="LC_ALL=C fc -lN $HISTSIZE"
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
    #alias fd='fd -L'
    export FZF_DEFAULT_COMMAND='LC_ALL=C fd -L --type f --ignore-case -E .git -E .svn -E old -E bak'
  else
    export FZF_DEFAULT_COMMAND='find * -type d \( -name ".git" -o -name ".svn"  -o -name "old" -o -name "bak" \) -prune -o -type f -print'
  fi
  export FZF_DEFAULT_OPTS="--no-mouse --layout=reverse --height=70% --border --preview 'preview {}' --preview-window down:wrap"
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

if valid docker; then
  if [ "$USER" = "root" ]; then
    alias d='docker'
  else
    alias docker='sudo docker'
    alias docker-compose='sudo docker-compose'
    alias d='docker'
    alias dcompose='docker-compose'
  fi
  alias dpa='d ps -a --format "table {{.ID}} {{.Names}}\t{{.Status}}\t{{.Command}}\t{{.Ports}}"'
  alias di='d images --format "table {{.ID}}  {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.CreatedSince}}"'
  alias drm='d rm -f'
  alias drmi='d rmi'
  alias dpl='d pull'
  alias dx='d exec -it'

  function dip {
    sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$@"
  }

  function dipa {
    for x in $(sudo docker ps -a --format "{{.Names}}:{{.ID}}");do
      echo $(dip $(echo $x | cut -d ":" -f 2)) $x
    done | sort
  }

  function dclean {
    typeset deadc=$(sudo docker ps -qf "status=exited")
    if [ -n "$deadc" ]; then
      sudo docker rm -f $deadc
    fi

    typeset deadi=$(sudo docker images -f "dangling=true" -q)
    if [ -n "$deadi" ]; then
      sudo docker rmi $deadi
    fi
  }
fi

### Ore function ###
function opener {       #file or directory automatic open
  if [ "$1" = "" ];then
    return 1
  fi
  typeset fn=$(readlink -f "$1")
  if [ -f $fn ]; then
      $EDITOR $fn
  elif [ -d $fn ]; then
      cd $fn
  else
      echo "File or Directory Not Found.."
      return 1
  fi
}

function treesize { # Directory Tree & sort by file size
    du -chx --max-depth=3 "$@" | sort -h
}

function isbinary {
  [ $(file --mime-encoding -b "$1") = "binary" ]
}

function iscompress {
  file "$1" | grep -qs "compressed data"
}

if valid fzf; then
  # Thanks! http://bio-eco-evo.hatenablog.com/entry/2017/04/30/044703
  function fzf_cd {
    typeset sw="1" list slct
    while [ "$sw" != "0" ]
      do
        if [ "$sw" = "1" ];then
          list=$(echo -e "---$PWD\n../\n$( /bin/ls -LF | grep / )\n---Show hidden directory\n---Show files, $(echo $(/bin/ls -LF | grep -v / ))\n---HOME DIRECTORY")
        elif [ "$sw" = "2" ];then
          list=$(echo -e "---$PWD\n$( /bin/ls -a -LF | grep / | sed 1d )\n---Hide hidden directory\n---Show files, $(echo $(/bin/ls -LF | grep -v / ))\n---HOME DIRECTORY")
        else
          list=$(echo -e "---BACK\n$( /bin/ls -LF | grep -v / )")
        fi
        
        slct=$(echo -e "$list" | fzf )
        
        if [ "$slct" = "---$PWD" ];then
          sw="0"
        elif [ "$slct" = "---Hide hidden directory" ];then
          sw="1"
        elif [ "$slct" = "---Show hidden directory" ];then
          sw="2"
        elif [ "$slct" = "---Show files, $(echo $(/bin/ls -LF | grep -v / ))" ];then
          sw=$(($sw+2))
        elif [ "$slct" = "---HOME DIRECTORY" ];then
          cd "$HOME"
        elif [[ "$slct" =~ / ]];then
          cd "$slct"
        elif [ "$slct" = "" ];then
          :
        else
          sw=$(($sw-2))
        fi
      done
  }

  alias cdf='fzf_cd'
fi

if [ ! -f $WORKCDHISTFILE ]; then
  echo $HOME > $WORKCDHISTFILE
fi

if [ ! -f $WORKBOOKMARKFILE ]; then
  touch $WORKBOOKMARKFILE
fi

function cd_func { # cd with histories
  if \cd "$@"; then
    if ! head -n 2 $WORKCDHISTFILE | grep -qs ${PWD}$; then
      sed -i "1s:^:$PWD\n:" $WORKCDHISTFILE
    fi
    echo "Changed: " `ls -d $PWD`
    echo ""
  else
    return 1
  fi
}
alias cd=cd_func

function cleanhist { #clean .cd_history
  if [ -f $WORKCDHISTFILE ];then
    grep -v "^$HOME$" $WORKCDHISTFILE | uniq > ${WORKCDHISTFILE}.unq
    if [ $(printf "%d" $(cat $WORKCDHISTFILE |wc -l)) -ne 0 ]; then
      mv -f ${WORKCDHISTFILE}.unq $WORKCDHISTFILE
    else
      rm -f ${WORKCDHISTFILE}.unq
      echo $HOME > $WORKCDHISTFILE
    fi
  else
    echo $HOME > $WORKCDHISTFILE
  fi
}

########################################
#alias abspath='readlink -f'
if ! valid realpath; then
  alias realpath='python -c "import sys, os.path;[sys.stdout.write(os.path.abspath(a) + \"\\n\") for a in sys.argv[1:] if not a.startswith(\"-\") ]"'
fi

function abspath {
  typeset org=$PWD
  typeset pth
  for pth in "$@"; do
    if [ -d $pth ]; then
      \cd $pth
      echo $PWD
    elif [ -f $pth ]; then
      \cd $(dirname $pth)
      echo $PWD/$(basename $pth)
    else
      realpath --no-symlinks $pth
    fi
    \cd $org
  done
  \cd $org
  return 0
}

if valid fzf; then
  function grep_goto {    # ripgrep & opener
    typeset ret pth
    
    if [ "$1" = "" ]; then
      kw=.
    else
      kw=$1
    fi
    
    if valid rg; then
      ret=$(rg --hidden "$kw" | fzf )
    else
      ret=$(grep -rl "$kw" * | fzf )
    fi
    
    if [ ! -z "$ret" -a "$ret" != " " ]; then
      opener $(echo $ret | cut -d ":" -f 1)
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
  bind '"\C-x\C-e": "change_direcoty_goto\C-m"' > /dev/null 2>&1

  function find_open {  # recursive find & open
    if valid fd; then
      opener $(fd -L | fzf)
    else
      opener $(find -L | fzf)
    fi
  }
  alias fo=find_open
  bind '"\C-o\C-o": "find_open\C-m"' > /dev/null 2>&1

  function bookmark {   #lookup bookmark
    opener $(cat $WORKBOOKMARKFILE | fzf)
  }
  alias b=bookmark

  if [ $_SHELL = "bash" ]; then
    function fzf_select_history {
      READLINE_LINE=$(HISTTIMEFORMAT= history|sort -uk 2|sort -nr|sed -E 's/^[ \t0-9]+//g'| fzf --no-sort --preview=':' --preview-window="hidden" --query "$READLINE_LINE")
      READLINE_POINT=${#READLINE_LINE}
    }
    bind -x '"\C-r": fzf_select_history'
  elif [ $_SHELL = "zsh" ]; then
    function fzf_select_history {
      BUFFER=$(HISTTIMEFORMAT= history|sort -uk 2|sort -nr|sed -E 's/^[ \t0-9]+//g'| fzf --no-sort --preview=':' --preview-window="hidden" --query "$BUFFER")
      CURSOR=${#BUFFER}
      zle reset-prompt
    }
    zle -N fzf_select_history
    bindkey '^r' fzf_select_history
  else
    function fzf_select_history {
      history |sort -uk 2|sort -nr|sed -E 's/^[ \t0-9]+//g'| fzf --no-sort --preview=':' --preview-window="hidden"
    }
  fi

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
    opener $(catuniq $WORKCDHISTFILE | xargs -n 100 \ls --sort=none -d 2> /dev/null | fzf --no-sort)
  }
  alias cdh=histcd
  bind '"\C-x\C-x": "histcd\C-m"' > /dev/null 2>&1

  function histvi {  # fzf : recently vim opened file
    opener $(grep "^> " $HOME/.viminfo | cut -c 3- | tacuniq | sed "s:~:$HOME:g" | xargs -n 100 \ls --sort=none -d 2> /dev/null | fzf --no-sort)
  }
  alias vih=histvi
  bind '"\C-x\C-v": "histvi\C-m"' > /dev/null 2>&1

  function hist {  # fzf : recently bash cmd or Changed directory
    typeset ret
    ret=`(uniq $WORKCDHISTFILE && grep "^> " $HOME/.viminfo | uniq | cut -b 3- | sed "s:~:$HOME:g") | sort | uniq -c | sort -nr | cut -b 9- | xargs -n 100 \ls --sort=none -d 2> /dev/null | fzf --no-sort`
    opener $ret
  }
  alias hh=hist
  bind '"\C-x\C-a": "hist\C-m"' > /dev/null 2>&1

  function _tips {
    typeset oneliner_f
    oneliner_f="${1:-$HOME/.local/tips.txt}"

    [[ ! -f $oneliner_f || ! -s $oneliner_f ]] && return

    typeset cmd q k res accept
    while accept=0; cmd="$(
      cat <$oneliner_f \
        | sed -e '/^#/d;/^$/d' \
        | perl -pe 's/^(\[.*?\]) (.*)$/$1\t$2/' \
        | perl -pe 's/(\[.*?\])/\033[31m$1\033[m/' \
        | perl -pe 's/^(: ?)(.*)$/$1\033[30;47;1m$2\033[m/' \
        | perl -pe 's/^(.*)([[:blank:]]#[[:blank:]]?.*)$/$1\033[30;1m$2\033[m/' \
        | perl -pe 's/(!)/\033[31;1m$1\033[m/' \
        | perl -pe 's/(\|| [A-Z]+ [A-Z]+| [A-Z]+ )/\033[35;1m$1\033[m/g' \
        | fzf --ansi --multi --no-sort --tac --query="$q" --preview='echo "[Command Example]"; echo {} | cut -d "]" -f 2- | cut -c 2-' --print-query --expect=ctrl-v --exit-0
        )"; do
      q="$(head -1 <<< "$cmd")"
      k="$(head -2 <<< "$cmd" | tail -1)"
      res="$(sed '1,2d;/^$/d;s/[[:blank:]]#.*$//' <<< "$cmd")"
      [ -z "$res" ] && continue
      if [ "$k" = "ctrl-v" ]; then
        vim "$oneliner_f" < /dev/tty > /dev/tty
      else
        cmd="$(perl -pe 's/^(\[.*?\])\t(.*)$/$2/' <<<"$res")"
        if [[ $cmd =~ "!$" || $cmd =~ "! *#.*$" ]]; then
          accept=1
          cmd="$(sed -e 's/!.*$//' <<<"$cmd")"
        fi
        break
      fi
    done
    tr -d '@' <<<"$cmd" | perl -pe 's/\n/; /' | sed -e 's/; $//'
  }

  if [ $_SHELL = "bash" ]; then
    function tips {
      READLINE_LINE=$(_tips "$@")
      READLINE_POINT=${#READLINE_LINE}
    }
    bind -x '"\C-b\C-b": tips'
  elif [ $_SHELL = "zsh" ]; then
    function tips {
      BUFFER=$(_tips "$@")
      CURSOR=${#BUFFER}
      zle reset-prompt
    }
    zle -N tips
    bindkey '^b^b' tips
  else
    alias tips=_tips
  fi

fi

function save_bookmark {   # save bookmark
  abspath $PWD >> $WORKBOOKMARKFILE
}
alias s=save_bookmark

function open_bookmark {    # open edit bookmark
  opener $WORKBOOKMARKFILE
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

function rep {          # replace function
  sed -Ei "s%$1%$2%g" $3
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
      *.tar.bz2|*.tbz2) tar cjfh $FILE $*  ;;
      *.tar.gz|*.tgz)   tar czfh $FILE $*  ;;
      *.tar)            tar cfh $FILE $*   ;;
      *.zip)            zip -r $FILE $*    ;;
      *.rar)            rar $FILE $*       ;;
      *.gz)             gzip $FILE         ;;
      *.bz2)            bzip2 $FILE        ;;
      *.xz)             xz $FILE           ;;
      *)    echo "Filetype not recognized"
            return 1 ;;
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

#thanks https://github.com/faif/shell-utils/blob/master/shell-utils.sh

# Arguments: $1 -> the file
function bak { # simple way to keep a backup of a file
    if [ $# -ne 1 ]
    then
        puse "bkup file"
        return 1
    fi

    file_copy=${1}.$(date +%Y%m%d.%H%M.ORIG)
    mv -f ${1} ${file_copy}
    printf "Backing up ${1} to ${file_copy}\n"
    cp -p "${file_copy}" "${1}"

    unset file_copy
}


function os_name { # print the system's name
    case $(uname -s) in
        *BSD)
            printf BSD ;;
        Darwin)
            printf macOS ;;
        SunOS)
            case $(uname -r) in
                5.*) printf Solaris ;;
                *) printf SunOS ;;
            esac
            ;;
        Linux)
            printf GNU/Linux ;;
        MINIX*)
            printf MINIX ;;
        HP-UX)
            echo HPUX ;;
        AIX)
            echo AIX ;;
        *) echo unknown ;;
    esac
    printf "\n"
}

alias os_version='\cd /etc; cat redhat-release lsb-release debian_version fedora-release 2>/dev/null; uname -or; \cd -'

# Arguments: $1 -> the process name to search for
function get_pid { # print a list of process id(s) matching $1
    if [ $# -lt 1 ]
    then
  perr "Insufficient Arguments."
        return 1
    fi

    ps -ef | grep "${1}" | grep -v grep | awk '{ print $2; }'

    unset psopts
}


# Arguments: $1 -> the user name
function get_uid { # print the numeric user id
    if [ $# -lt 1 ]
    then
  perr "Insufficient Arguments."
        return 1
    fi

    user_id=$(id ${1} 2>/dev/null)

    if [ $? -ne 0 ]
    then
  perr "No such user: ${1}"
  return 1
    fi

    printf "${user_id}\n" | sed -e 's/(.*$//' -e 's/^uid=//'

    unset user_id
}


# Arguments: $@ -> the string
function to_lower { # print an input string to lower case
    printf "${@}\n" | tr '[A-Z]' '[a-z]'
}


# Arguments: $@ -> the string
function to_upper { # print an input string to upper case
    printf "${@}\n" | tr '[a-z]' '[A-Z]'
}


# Arguments: $@ -> files to convert
function file_to_lower { # convert the input files to lower case
    for file in "${@}"
    do
  mv -f "${file}" "$(printf "${file}\n" | tr '[A-Z]' '[a-z]')" \
      2>/dev/null || perr "File ${file} does not exist"
    done
}


# Arguments: $@ -> files to convert
function file_to_upper { # convert the input files to upper case
    for file in "${@}"
    do
  mv -f "${file}" "$(printf "${file}\n" | tr '[a-z]' '[A-Z]')" \
      2>/dev/null || perr "File ${file} does not exist"
    done
}

alias delblankline="sed '/^$/d'"
alias tolf='tr -d "\r"'
alias tocrlf='sed "s/$/\r/g"'
alias encoding='iconv -t'
if valid xsv; then
  alias totsv='xsv fmt -t "\t"'
  alias tocsv='xsv fmt -t ","'
  alias csvtable='xsv table'
fi

alias uniqcount='sort | uniq -c | sort -n'
alias pings='xargs -P30 -n1 ping -s1 -c1 -W1 | grep ttl'
alias psls='ps auxwwf'
alias free='free -mt'
alias netstatp='sudo netstat -ap | grep -E "(SYN|ESTABLISHED)"'
valid nslookup && alias nslookup='nslookup -query=any'
alias killzombie="sudo kill -9 $(ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}')"

# vim: set ft=sh ff=unix fileencoding=utf-8 expandtab ts=2 sw=2 :
