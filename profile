export PYTHONPATH=/usr/local/bin
export XDG_CONFIG_HOME=~/Dropbox/dotfiles
export XDG_CACHE_HOME=~/.cache
export XDG_RUNTIME_DIR=/usr/local/share/nvim/runtime
export EDITOR=vi
export LANG="ja_JP.UTF-8"

alias py2='unlink /usr/bin/python;ln -s /usr/bin/python2 /usr/bin/python'
alias py3='unlink /usr/bin/python;ln -s /usr/bin/python3 /usr/bin/python'
alias dropbox='python2.6 ~/bin/dropbox.py'

alias du="du -h"
alias df="df -h"

# Improve od for hexdump
alias od='od -Ax -tx1z'
alias hexdump='hexdump -C'

alias nvim='DISPLAY=none nvim'

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

cid() {docker ps -aqf "name=$1"}

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias drd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dri="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstopa() { docker stop $(docker ps -a -q); }

# Remove all containers
drma() { docker rm $(docker ps -a -q); }

# Stop all containers
dstop() { docker stop $(cid $1); }

# Remove all containers
drm() { docker rm $(cid $1); }

# Stop and Remove all containers
drmf() { docker rm -f $(cid $1); }

# Stop and Remove all containers
alias drmfa='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
drmia() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbuild() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(cid $1) bash; }

dcommit() {docker commit $(cid $1); }

dsave() {docker save $1 > `basename $1`.tar.gz }

alias dload='docker load -i'

usermake () {
    USERNAME=$1
    PASSWORD=$2
    GROUP=admin
    useradd -m -p $PASSWORD -G $GROUP $USERNANME
    echo -e "${PASSWORD}\n${PASSWORD}" | pdbedit -a -t -u $USERNAME
}
