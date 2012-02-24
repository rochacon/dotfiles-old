### Bash profile for Rodrigo Chacon
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/pgsql/bin:$PATH";
export EDITOR="vim"

PS1='\[\033[01;32m\]\u\[\033[00m\] \h > `uptime`\n \w \$ ' 
#PS1='\w \$ ' 

# Git bash completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Virtualenvwrapper
source /usr/local/share/python/virtualenvwrapper.sh

# aliases
alias l='ls -1shG'
alias la='ls -lahG'
alias ll='ls -lhG'
alias ls='ls -shG'
alias flv2mp3='ffmpeg -ar 44100 -ab 128k -i'
alias svn.diff='svn diff >~/Desktop/ted.diff && mvim ~/Desktop/ted.diff'
alias gdiff='git diff >/tmp/git.diff ; mvim /tmp/git.diff'
alias pymanage='python manage.py'
alias random_pass="python -c \"import string, random ; print ''.join(random.choice(string.letters + string.digits) for x in range(10))\""
alias pgctl='pg_ctl -D /usr/local/pgsql/data' 
alias djgrep="grep --exclude=.svn --exclude=.git --exclude=*.pyc --color -n"

