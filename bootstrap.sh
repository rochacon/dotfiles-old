#!/bin/bash -xe
# Install all this stuff. =)

# Bash and environment
cp {.,~}/.bashrc
#cp {.,~}/.bash_profile
cp {.,~}/.profile

# Mercurial
cp {.,~}/.hgrc

# Git
cp {.,~}/.gitconfig

# Vim
cp {.,~}/.vimrc
cp -r {.,~}/.vim

# External dependencies

# Autoenv
autoenv="$HOME/dev/src/github.com/kennethreitz/autoenv"
if [ ! -d "$autoenv" ]; then
    mkdir -p "$autoenv"
    cd "$autoenv"
    git clone git://github.com/kennethreitz/autoenv.git .
    cd -
else
    cd "$autoenv"
    git pull
    cd -
fi

# Powerline-bash
powerline="$HOME/dev/src/github.com/milkbikis/powerline-shell"
if [ ! -d "$powerline" ]; then
    mkdir -p "$powerline"
    cd "$powerline"
    git clone git://github.com/milkbikis/powerline-shell.git .
    cd -
else
    cd "$powerline"
    git pull
    cd -
fi

# Virtualenvwrapper
pip install virtualenvwrapper

