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

### vi normalize
if which gvim >/dev/null 2>&1; then
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
export HISTIGNORE=cd:ls	#you can use wild cart(*,?)
export TIMEFORMAT='real: %Rs  user: %Us  system: %Ss'
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

BIN=$HOME/bin:$HOME/usr/bin:$HOME/usr/local/bin

if [ -d $HOME/usr/local/python ]; then
  export PYTHONPATH=$HOME/usr/local/python
  export PATH=$PYTHONPATH/bin:$PATH
  if [ -z "$LD_LIBRARY_PATH" ]; then
    export LD_LIBRARY_PATH=$PYTHONPATH/lib
  else
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHONPATH/lib
  fi
fi

export PATH=$PATH:$BIN

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
alias python="$PYTHONPATH/bin/python3"
alias pip="$PYTHONPATH/bin/pip3"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if which git > /dev/null 2>&1; then
  alias diff='git diff --no-index'
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
alias ls='ls --show-control-chars --color=always'
#alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias lla='ls -lA'
alias lld='ls -ld'
alias llt='ls -ltr'
alias lls='ls -lSr'
alias llx='ls -lX'
alias l='ls -F'                              #
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
alias h='grep -E "^(function|alias|bind).*" ~/dotfile/bashrc | sort | less'
alias rg='rg --no-heading'
alias be='xxd -u -g 1'

export FZF_DEFAULT_COMMAND='fd --no-mouse --type f --ignore-case --follow -E .git -E .svn -E old -E bak'
export FZF_DEFAULT_OPTS="--no-mouse --layout=reverse --height=40% --border --preview 'echo {};echo ---; ls -l {} 2>/dev/null' --preview-window down:wrap"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

### Ore function ###
function opener {       #file or directory automatic open
    fn=`readlink -f $1`
    if [ -f $fn ]; then
        $EDITOR $fn
    elif [ -d $fn ]; then
        cd $fn
    else
        echo "File or Directory Not Found.."
        exit 1
    fi
}

# Thanks! http://bio-eco-evo.hatenablog.com/entry/2017/04/30/044703
function fzf_cd {
  local sw="1"
  while [ "$sw" != "0" ]
     do
        if [ "$sw" = "1" ];then
            local list=$(echo -e "---$PWD\n../\n$( /bin/ls -F | grep / )\n---Show hidden directory\n---Show files, $(echo $(/bin/ls -F | grep -v / ))\n---HOME DIRECTORY")
        elif [ "$sw" = "2" ];then
            local list=$(echo -e "---$PWD\n$( /bin/ls -a -F | grep / | sed 1d )\n---Hide hidden directory\n---Show files, $(echo $(/bin/ls -F | grep -v / ))\n---HOME DIRECTORY")
        else
            local list=$(echo -e "---BACK\n$( /bin/ls -F | grep -v / )")
        fi
        
        local slct=$(echo -e "$list" | fzf )
        
        if [ "$slct" = "---$PWD" ];then
            local sw="0"
        elif [ "$slct" = "---Hide hidden directory" ];then
            local sw="1"
        elif [ "$slct" = "---Show hidden directory" ];then
            local sw="2"
        elif [ "$slct" = "---Show files, $(echo $(/bin/ls -F | grep -v / ))" ];then
            local sw=$(($sw+2))
        elif [ "$slct" = "---HOME DIRECTORY" ];then
            builtin cd "$HOME"
        elif [[ "$slct" =~ / ]];then
            builtin cd "$slct"
        elif [ "$slct" = "" ];then
            :
        else
            local sw=$(($sw-2))
        fi
     done
}
alias sd='fzf_cd'

function cd_func {
  if cd "$@"; then
    if [ ! $(head -n 2 $HOME/.cd_history | grep -qs ${PWD}$) ]; then
      sed -i "1s:^:$PWD\n:" $HOME/.cd_history
    fi
    echo "Changed: " `ls -d $PWD`
    echo ""
  fi
}

alias cd=cd_func

########################################
alias abspath='readlink -f'

function ripgrep_goto {    # ripgrep & opener
    ret=$(rg --hidden --files . | fzf )
    if [ ! -z "$ret" -a "$ret" != " " ]; then
        opener "$ret"
    fi
}
alias rgg=ripgrep_goto
bind -x '"\C-g\C-g": ripgrep_goto' > /dev/null 2>&1

function change_direcoty_goto {  # recursive directory search & jump
    ret=$(fd . --type d | fzf)
    if [ ! -z "$ret" -a "$ret" != " " ]; then
        cd "$ret"
    fi
}
alias cdgo=change_direcoty_goto
bind -x '"\C-x\C-x": change_direcoty_goto' > /dev/null 2>&1

function find_open {  # recursive find & open
    ret=`normpath $(fd | fzf)`
    if [ ! -z "$ret" -a "$ret" != " " ]; then
        opener "$ret"
    fi
}
alias fo=find_open
bind -x '"\C-o\C-o": find_open' > /dev/null 2>&1

function bookmark {   #lookup bookmark
#    ret=`normpath $(cat $HOME/bookmark.txt | fzf | awk -F"\t" '{print $2}')`
#    if [ ! -z "$ret" -a "$ret" != " " ]; then
#        start "$ret"
#    fi
    ret=`cat $HOME/bookmark.txt | fzf`
    opener $ret
}
alias b=bookmark

function save_bookmark {   # save bookmark
    echo $PWD >> $HOME/bookmark.txt
}
alias s=save_bookmark

function open_bookmark {    # open edit bookmark
    $EDITOR $HOME/bookmark.txt
}
alias bo=open_bookmark

function fzf_select_history {
    local tac
    which gtac &> /dev/null && tac="gtac" || \
        which tac &> /dev/null && tac="tac" || \
        tac="tail -r"
    READLINE_LINE=$(HISTTIMEFORMAT= history | $tac | sed -e 's/^\s*[0-9]\+\s\+//' | awk '!a[$0]++' | fzf --query "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-r": fzf_select_history' > /dev/null 2>&1

function loc {    # fzf: locate & open
    ret=`locate $* | fzf`
    opener $ret
}
bind -x '"\C-x\C-f": \C-aloc \C-m' > /dev/null 2>&1

function locbasename {  # fzf: locate basename only & open
    ret=`locate -b $* | fzf`
    opener $ret
}
alias lb='locbasename'

function catuniq {
  cat -n "$@" | sort -uk 2 | sort | sed "s/^.*\t//g"
}

function tacuniq {
  tac "$@" | cat -n | sort -uk 2 | sort | sed "s/^.*\t//g"
}

function cdhist {  # fzf : recently Changed directory
    cd `catuniq $HOME/.cd_history | xargs ls -d 2> /dev/null | fzf`
}
bind -x '"\C-x\C-c": cdhist' > /dev/null 2>&1

function vihist {  # fzf : recently vim opened file
    vim `grep "^> " $HOME/.viminfo | cut -c 3- | tacuniq | sed "s:~:$HOME:g" | xargs ls -d 2> /dev/null | fzf`
}
bind -x '"\C-x\C-v": vihist' > /dev/null 2>&1

function hist {  # fzf : recently bash cmd or Changed directory
    ret=`(cat $HOME/.cd_history && grep "^> " $HOME/.viminfo | cut -b 3- | sed "s:~:$HOME:g") | sort | uniq -c | sort -nr | cut -b 9- | xargs ls -d 2> /dev/null | fzf`
    opener $ret
}
bind -x '"\C-x\C-h": hist' > /dev/null 2>&1

bind '"\C-t": "\C-atime \C-m"' > /dev/null 2>&1 #time command shortcut

function topy3 {          # python2 source is convert to python3 source (overrite)
    ret=`fd $1 --type f --exec file {} \; | grep ": Python script" | cut -d ":" -f 1 | grep -v "\.md$"`
    for x in $ret; do
        2to3 -wn $x
    done
}

function rep {          # firster replace function
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
    FILE=$1
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

function lscompress {
if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
    if [ -f "$n" ] ; then
        shift
        case $FILE in
            *.tar.bz2) tar tjf $n ;;
            *.tar.gz)  tar tzf $n ;;
            *.tgz)     tar tzf $n ;;
            *.zip)     unzip -t $n ;;
            *.rar)     rar l $n ;;
            *)         echo "Filetype not recognized" ;;
        esac
    else
        echo "'$n' - file does not exist"
        return 1
    fi
    done
fi
}

function vimgrep {
    ret=`rg --vimgrep --no-heading $@ | fzf`
    vim -p `echo $ret | cut -d ":" -f 1,2 | sed "s/:/ +/g"`
}
alias vg='vimgrep'
#bind -x '"\C-g\C-g": vimgrep' > /dev/null 2>&1

