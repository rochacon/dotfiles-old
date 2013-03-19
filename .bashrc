### Bash profile for Rodrigo Chacon
# Bash options
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Patch the PATH =)
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin";

# VIM to rule them all!!
export EDITOR="vim"

# Dumb check for system
if [ `uname -s` = "Darwin" ]; then
    ISMAC="1"
else
    ISMAC="0"
fi

# Virtualenvwrapper
venvwrapper_linux="/usr/local/bin/virtualenvwrapper_lazy.sh"
venvwrapper_mac="/usr/local/share/python/virtualenvwrapper_lazy.sh"
if [ "$ISMAC" ]; then
    [ -x "$venvwrapper_mac" ] && source "$venvwrapper_mac"
else
    [ -x "$venvwrapper_linux" ] && source "$venvwrapper_linux"
fi

# aliases
if [ "$ISMAC" ]; then
    alias ls='ls -shG'
else
    alias ls='ls -sh --group-directories-first --color=auto'
fi

alias l='ls -1s'
alias la='ls -la'
alias ll='ls -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias flv2mp3='ffmpeg -ar 44100 -ab 128k -i'
alias djgrep="grep --exclude=.svn --exclude=.git --exclude=*.pyc --color -n"

function random_pass {
    python -c "import string, random ; print ''.join(random.choice(string.letters + string.digits) for x in range($1))"
}

#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Dropbox inotify watcher limit fix (best place to put this code is in /etc/rc.local)
alias dropbox-inotify-fix="dropbox stop && echo 100000 | sudo tee /proc/sys/fs/inotify/max_user_watches ; dropbox start"

# Mount MySQL in ram
function mysql-ram {
    mkdir -p /tmp/mysqlfs
    sudo mount -t tmpfs -o size=1024m tmpfs /tmp/mysqlfs
    sudo -u mysql -- cp -rf /var/lib/mysql /tmp/mysqlfs
    sudo chown -R mysql:mysql /tmp/mysqlfs
    sudo service mysql restart
}

# Autoenv
source "$HOME/dev/src/github.com/kennethreitz/autoenv/activate.sh"

# Powerline-Bash
function _update_ps1()
{
    export PS1="$($HOME/dev/src/github.com/milkbikis/powerline-shell/powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

# Homebrew Bash completion
[ -d "/usr/local/etc/bash_completion.d" ] && source /usr/local/etc/bash_completion.d/*

