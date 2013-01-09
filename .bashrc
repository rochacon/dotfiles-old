### Bash profile for Rodrigo Chacon
[ -e "$HOME/.profile" ] && source $HOME/.profile

#Bash options
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# VIM to rule them all!!
export EDITOR="vim"

# Virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# aliases
alias ls='ls -sh --group-directories-first --color=auto'
alias l='ls -1s'
alias la='ls -la'
alias ll='ls -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias flv2mp3='ffmpeg -ar 44100 -ab 128k -i'
alias random_pass="python -c \"import string, random ; print ''.join(random.choice(string.letters + string.digits) for x in range(10))\""
alias djgrep="grep --exclude=.svn --exclude=.git --exclude=*.pyc --color -n"

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
source /home/rochacon/dev/src/github.com/kennethreitz/autoenv/activate.sh

# Powerline-Bash
function _update_ps1()
{
    export PS1="$($HOME/dev/src/github.com/milkbikis/powerline-bash/powerline-bash.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

