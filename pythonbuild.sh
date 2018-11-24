#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 (version numver)"
  echo "Example: $0 3.7.1"
  exit 1
fi

sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel uuid-devel

version=$1
minerversion=${version:3}

mkdir ~/src
cd ~/src
if [ -d Python-${version} ]; then
  rm -rf Python-${version}
fi

wget https://www.python.org/ftp/python/${version}/Python-${version}.tgz
tar zxf Python-${version}.tgz
cd Python-${version}

pybasename=$(basename $PWD | sed "s/[-\.]//g" | tr [A-Z] [a-z])

./configure --prefix=/usr/local/lib/${pybasename} --enable-shared --enable-optimizations --with-openssl=/usr/local/ssl

sed -Ei "s/^BLDLIBRARY=.*/BLDLIBRARY=     libpython\$\(LDVERSION\)\.a/g" Makefile

make -s
make altinstall

cd /usr/local/lib/${pybasename}/lib
ln -s python${minerversion}/config-${minerversion}m-x86_64-linux-gnu/libpython${minerversion}m.a libpython${minerversion}m.a

if echo $LD_LIBRARY_PATH |grep -qs "$PYTHONPATH/lib"; then
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PYTHONPATH/lib
fi
