PS1="\n\e[0;37muser:    \e[1;32m\u\n\e[0;37mhost:    \e[1;33m\h\n\e[0;37mtime:    \e[1;37m\@\n\e[0;37mbranch:\e[1;37m \$(parse_git_branch) \e[0m\n\e[0;37mcommand: \e[39m"
PATH="/usr/local/sbin:$PATH"
export PATH='/usr/local/bin':$PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

complete -C aws_completer aws

parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
     }
LSCOLORS='Hxfxcxdxgxegedabagacad'; export LSCOLORS
export LS_OPTIONS='-G'
alias ls='ls $LS_OPTIONS'
