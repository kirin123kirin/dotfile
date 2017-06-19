export PYTHONPATH=/usr/local/bin
export XDG_CONFIG_HOME=~/Dropbox/dotfiles
export XDG_CACHE_HOME=~/.cache
export XDG_RUNTIME_DIR=/usr/local/share/nvim/runtime
export EDITOR=vi
export LANG="ja_JP.UTF-8"

alias py2='sudo unlink /usr/bin/python;sudo ln -s /usr/bin/python2 /usr/bin/python'
alias py3='sudo unlink /usr/bin/python;sudo ln -s /usr/bin/python3 /usr/bin/python'
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
alias dl="sudo docker ps -l -q"

# Get container process
alias dps="sudo docker ps"

# Get process included stop container
alias dpa="sudo docker ps -a"

# Get images
alias di="sudo docker images"

# Get container IP
alias dip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="sudo docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="sudo docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="sudo docker exec -i -t"

# Stop all containers
dstop() { sudo docker stop $(docker ps -a -q); }

# Remove all containers
drm() { sudo docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { sudo docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { sudo docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { sudo docker exec -it $(docker ps -aqf "name=$1") bash; }
