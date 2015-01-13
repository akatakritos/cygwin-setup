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
    colorgcc
    curl
    chere
    cygwin32-libffi
    gcc-core
    gcc-g++
    git
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
#prereq
#install-apt-cyg
#install-packages
#install-chere
