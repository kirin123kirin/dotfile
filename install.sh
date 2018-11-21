#!/bin/bash

OWNDIR=$(cd $(dirname $0); pwd)

#.local/bin making
if [ ! -e ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi
tar zxf $OWNDIR/local.tar.gz -C ~/
chmod -R a+x ~/.local/bin

# dotfiles linking
~/.local/bin/dotfiles clean $OWNDIR
~/.local/bin/dotfiles link $OWNDIR
#ret=$(~/.local/bin/dotfiles link $OWNDIR|grep Exist | sed -E "s/Exist: '(.+)' -> '(.+)'/\1\t\2/g")

exit 0

# .bashrc linking
if [ -f ~/.bashrc ]; then
  if grep -qs ". $OWNDIR/bashrc" ~/.bashrc; then
    :
  elif [ -L ~/.bashrc ]; then
    :
  else
    echo "" >> ~/.bashrc
    echo ". $OWNDIR/bashrc" >> ~/.bashrc
  fi
else
  ln -s $OWNDIR/bashrc ~/.bashrc
fi

# .vimrc linking
if [ -f ~/.vimrc ]; then
  if grep -qs "   execute 'source $OWNDIR/vimrc'" ~/.vimrc; then
    :
  elif [ -L ~/.vimrc ]; then
    :
  else
    echo "" >> ~/.vimrc
    echo if 1 >> ~/.vimrc
    echo "   execute 'source $OWNDIR/vimrc'" >> ~/.vimrc
    echo endif >> ~/.vimrc
  fi
else
  ln -s $OWNDIR/vimrc ~/.vimrc
fi

#.vim linking
if [ -d ~/.vim ]; then
  mv ~/.vim ~/vim.bak
  ln -s $OWNDIR/vim ~/.vim
  cp -pRbv ~/vim.bak/* ~/.vim/
else
  ln -s $OWNDIR/vim ~/.vim
fi


# .ctags linking
if [ -f ~/.ctags ]; then
  if [ -L ~/.ctags ]; then
    :
  else
    echo "" >> ~/.ctags
    cat $OWNDIR/ctags >> ~/.ctags
  fi
else
  ln -s $OWNDIR/ctags ~/.ctags
fi

cd $OWNDIR
