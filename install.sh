#!/bin/bash

OWNDIR=$(cd $(dirname $0); pwd)

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

#.local/bin making
if [ ! -e ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi
cp -R $OWNDIR/local/bin/* ~/.local/bin/
cd ~/.local/bin
tar zxf *.tar.gz && rm -f *.tar.gz
chmod -R a+x ~/.local/bin/*

cd $OWNDIR
