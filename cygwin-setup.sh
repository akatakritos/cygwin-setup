#!/bin/bash
# dependencies from initial install:
#  - wget

set -e             #exit on error
set -x             #print all commands

function prereq() {
  mkdir -p $HOME/setup
  cd $HOME/setup
}

function install-apt-cyg {
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
    git
    git-completion
    grep
    libcrypt-devel
    libffi-devel
    libiconv-devel
    libncurses-devel
    libtool
    libyaml-devel
    make
    openssh
    openssl
    openssl-devel
    patch
    patchutils
    perl
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

# Begin Setup
prereq
install-apt-cyg
install-packages
install-chere
