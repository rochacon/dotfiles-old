### Bash profile for Rodrigo Chacon

#Bash options
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Globals
export PATH="~/bin:$PATH";
export EDITOR="vim"

PS1=' $(date +'%H:%M:%S') | \[\033[01;32m\]\u\[\033[00m\] \w \$ '
#PS1='\[\033[G\]\[\033[01;32m\]\u\[\033[00m\] \h > `uptime`\n \w \$ ' 
#PS1='\[\033[G\]\w \$ ' 

# Virtualenvwrapper
source /usr/local/bin/virtualenvwrapper_lazy.sh

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

