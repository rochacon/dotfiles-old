#!/bin/bash -xe
# Install all this stuff. =)

# Bash and environment
cp {.,~}/.bashrc
cp {.,~}/.bash_profile
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
kennethreitz="~/dev/src/github.com/kennethreitz"
if [ ! -d "$kennethreitz/autoenv" ]; then
    mkdir -p "$kennethreitz"
    cd "$kennethreitz"
    git clone git://github.com/kennethreitz/autoenv.git
    cd -
else
    cd "$kennethreitz"
    git pull
    cd -
fi

# Powerline-bash
powerline="~/dev/src/github.com/milkbikis/powerline-bash"
if [ ! -d "$powerline" ]; then
    mkdir -p "$powerline"
    cd "$powerline"
    git clone git://github.com/milkbikis/powerline-bash.git
    cd -
else
    cd "$powerline"
    git pull
    cd -
fi

# Virtualenvwrapper
sudo pip install virtualenvwrapper

