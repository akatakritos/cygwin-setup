#!/bin/bash
# dependencies from initial install:
#  - wget

set -e             #exit on error
set -x             #print all commands

function go-to-setup() {
  mkdir -p $HOME/setup
  cd $HOME/setup
}

function install-apt-cyg {
  go-to-setup
  wget "http://rawgit.com/transcode-open/apt-cyg/master/apt-cyg"
  install apt-cyg /bin
}

function install-packages {
  packages=(
    autoconf
    automake
    bzip2
    chere
    clang
    colorgcc
    ctags
    curl
    cygwin32-libffi
    diffutils
    gcc-core
    gcc-g++
    gettext-devel
    git
    git-completion
    grep
    libcrypt-devel
    libffi-devel
    libiconv-devel
    liblzma-devel
    libncurses-devel
    libpcre-devel
    libtool
    libyaml-devel
    make
    mingw-gcc-g++
    mingw-zlib-devel
    openssh
    openssl
    openssl-devel
    patch
    patchutils
    perl
    pkg-config
    pv
    python
    rsync
    tree
    unzip
    zlib
    zlib-devel
  )

  apt-cyg install ${packages[@]}
}

function install-chere {
  # requires admin
  chere -i -c -t mintty
}

function install-ag {
  go-to-setup
  git clone https://github.com/ggreer/the_silver_searcher.git
  cd the_silver_searcher && ./build.sh && make install

}

# Begin Setup
install-apt-cyg
install-packages
install-chere
install-ag
