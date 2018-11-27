#!/bin/bash
OWNDIR=$(cd $(dirname $0); pwd)
cd $OWNDIR

git lfs install
git lfs pull

tar zxfp $OWNDIR/local.tar.gz
chmod -R a+x $OWNDIR/.local/bin

# dotfiles linking
$OWNDIR/.local/bin/dotfiles clean
$OWNDIR/.local/bin/dotfiles link

