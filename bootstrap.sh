#!/bin/bash
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
autoenv="~/dev/src/github.com/kennethreitz"
if [ ! -d "$autoenv/autoenv/.git" ]; then
    mkdir -p "$autoenv"
    cd "$autoenv"
    git clone git://github.com/kennethreitz/autoenv.git
    cd -
fi

# Powerline-bash
powerline="~/dev/src/github.com/milkbikis/powerline-bash"
if [ ! -d "$powerline" ]; then
    mkdir -p "$powerline"
    cd "$powerline"
    git clone git://github.com/milkbikis/powerline-bash.git
    cd -
fi

# Virtualenvwrapper
sudo pip install virtualenvwrapper

