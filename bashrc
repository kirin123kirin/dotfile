#!/bin/sh
# Oresama Setting
# v0.1


### Ore View ###
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

function treesize() { # Directory Tree & sort by file size
    du -chx --max-depth=3 $@ | sort -h
}

### vi normalize
which gvim 2>/dev/null 1>/dev/null
if [ $? = 0 ]; then
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
fi

export PATH=$PATH:$BIN

# Ore option
shopt -s autocd
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

if which git &> /dev/null; then
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
    fn=`abspath $1`
    if [ -f $fn ]; then
        $EDITOR $fn
    elif [ -d $fn ]; then
        builtin cd $fn
    else
        echo "File or Directory Not Found.."
        exit 1
    fi
}


# Thanks! http://bio-eco-evo.hatenablog.com/entry/2017/04/30/044703
function fzf-cd {
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
alias sd='fzf-cd'

cd_func ()
{
    local x2 the_new_dir adir index
    local -i cnt

    if [[ $1 == "--" ]]; then
        dirs -v
        return 0
    fi

    the_new_dir=$1
    [[ -z $1 ]] && the_new_dir=$HOME

    if [[ ${the_new_dir:0:1} == '-' ]]; then
        #
        # Extract dir N from dirs
        index=${the_new_dir:1}
        [[ -z $index ]] && index=1
        adir=$(dirs +$index)
        [[ -z $adir ]] && return 1
        the_new_dir=$adir
    fi

    #
    # '~' has to be substituted by ${HOME}
    [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

    #
    # Now change to the new dir and add to the top of the stack
    pushd "${the_new_dir}" > /dev/null
    [[ $? -ne 0 ]] && return 1
    the_new_dir=$(pwd)
    echo $the_new_dir >> $HOME/.cd_history
    echo " Changed : " `ls -d $the_new_dir`
    echo ""

    #
    # Trim down everything beyond 11th entry
    popd -n +11 2>/dev/null 1>/dev/null

    #
    # Remove any other occurence of this dir, skipping the top of the stack
    for ((cnt=1; cnt <= 10; cnt++)); do
        x2=$(dirs +${cnt} 2>/dev/null)
        [[ $? -ne 0 ]] && return 0
        [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
        if [[ "${x2}" == "${the_new_dir}" ]]; then
            popd -n +$cnt 2>/dev/null 1>/dev/null
            cnt=cnt-1
        fi
    done
    return 0
}

alias cd=cd_func

########################################
function abspath() {      #abstractic path string return
    f=$@;
    if [ -d "$f" ]; then
        base="";
        dir="$f";
    else
        base="/$(basename "$f")";
        dir=$(dirname "$f");
    fi;
    dir=$(builtin cd "$dir" && /bin/pwd);
    echo "$dir$base"
}


function ripgrep_goto() {    # ripgrep & opener
    ret=$(rg --hidden --files . | fzf )
    if [ ! -z "$ret" -a "$ret" != " " ]; then
        opener "$ret"
    fi
}
alias rgg=ripgrep_goto
bind -x '"\C-g\C-g": ripgrep_goto'

function change_direcoty_goto() {  # recursive directory search & jump
    ret=$(fd . --type d | fzf)
    if [ ! -z "$ret" -a "$ret" != " " ]; then
        cd "$ret"
    fi
}
alias cdgo=change_direcoty_goto
bind -x '"\C-x\C-x": change_direcoty_goto'

function find_open() {  # recursive find & open
    ret=`normpath $(fd | fzf)`
    if [ ! -z "$ret" -a "$ret" != " " ]; then
        opener "$ret"
    fi
}
alias fo=find_open
bind -x '"\C-o\C-o": find_open'

function bookmark() {   #lookup bookmark
#    ret=`normpath $(cat $HOME/bookmark.txt | fzf | awk -F"\t" '{print $2}')`
#    if [ ! -z "$ret" -a "$ret" != " " ]; then
#        start "$ret"
#    fi
    ret=`cat $HOME/bookmark.txt | fzf`
    opener $ret
}
alias b=bookmark

function save_bookmark() {   # save bookmark
    echo $PWD >> $HOME/bookmark.txt
}
alias s=save_bookmark

function open_bookmark() {    # open edit bookmark
    $EDITOR $HOME/bookmark.txt
}
alias bo=open_bookmark

function fzf-select-history() {
    local tac
    which gtac &> /dev/null && tac="gtac" || \
        which tac &> /dev/null && tac="tac" || \
        tac="tail -r"
    READLINE_LINE=$(HISTTIMEFORMAT= history | $tac | sed -e 's/^\s*[0-9]\+\s\+//' | awk '!a[$0]++' | fzf --query "$READLINE_LINE")
    READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-r": fzf-select-history'

function loc() {    # fzf: locate & open
    ret=`locate $* | fzf`
    opener $ret
}
bind -x '"\C-x\C-f": \C-aloc \C-m'

function locbasename() {  # fzf: locate basename only & open
    ret=`locate -b $* | fzf`
    opener $ret
}
alias lb='locbasename'

function cdhist() {  # fzf : recently Changed directory
    cd `sort $HOME/.cd_history | uniq -c | sort -nr | cut -b 9- | fzf`
}
bind -x '"\C-x\C-c": cdhist'

function vihist() {  # fzf : recently vim opened file
    vim `grep "^> " $HOME/.viminfo | cut -d " " -f 2 | sort | uniq -c | sort -nr | cut -b 9- | fzf`
}
bind -x '"\C-x\C-v": vihist'

function hist() {  # fzf : recently bash cmd or Changed directory
    ret=`(cat $HOME/.cd_history && grep "^> " $HOME/.viminfo | cut -d " " -f 2) | sort | uniq -c | sort -nr | cut -b 9- | fzf`
    opener $ret
}
bind -x '"\C-x\C-h": hist'

bind '"\C-t": "\C-atime \C-m"' #time command shortcut

function topy3() {          # python2 source is convert to python3 source (overrite)
    ret=`fd $1 --type f --exec file {} \; | grep ": Python script" | cut -d ":" -f 1 | grep -v "\.md$"`
    for x in $ret; do
        2to3 -wn $x
    done
}

rep(){          # firster replace function
    arg="$(cat -)"
    echo "$arg" | rg "$1" -r "$2" -C 9999999999999999999
}

function between() {     # between cat lines
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

function compress() {
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

function lscompress() {
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

function vimgrep() {
    ret=`rg --vimgrep --no-heading $@ | fzf`
    vim -p `echo $ret | cut -d ":" -f 1,2 | sed "s/:/ +/g"`
}
alias vg='vimgrep'
#bind -x '"\C-g\C-g": vimgrep'

