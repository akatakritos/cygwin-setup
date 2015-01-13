#!/bin/bash
# dependencies from initial install:
#  - wget

set -e             #exit on error
set -x             #print all commands

CHRUBY_VERSION="0.3.9"
RUBYINSTALL_VERSION="0.5.0"

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

function install-chruby {
  go-to-setup
  wget -O chruby-$CHRUBY_VERSION.tar.gz "https://github.com/postmodern/chruby/archive/v$CHRUBY_VERSION.tar.gz"
  tar -xzvf chruby-$CHRUBY_VERSION.tar.gz
  cd chruby-$CHRUBY_VERSION/
  make install
}

function install-ruby-install {
  go-to-setup
  wget -O ruby-install-$RUBYINSTALL_VERSION.tar.gz https://github.com/postmodern/ruby-install/archive/v$RUBYINSTALL_VERSION.tar.gz
  tar -xzvf ruby-install-$RUBYINSTALL_VERSION.tar.gz
  cd ruby-install-$RUBYINSTALL_VERSION/
  make install
}

# Begin Setup
install-apt-cyg
install-packages
install-chere
install-ag
install-chruby
install-ruby-install
