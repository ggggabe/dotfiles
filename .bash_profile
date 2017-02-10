PS1="\n\e[1;38;5;241mpath:    \w\n\e[1;38;5;244muser:    \u\n\e[1;38;5;248mhost:    \h\n\e[1;38;5;251mtime:    \@\n\e[0;37m\e[1;38;5;248memail:   \$(git_user) \n\e[1;38;5;244mbranch:  \$(parse_git_branch) \n\e[1;38;5;241mcommand: \e[39m"
PATH="/usr/local/sbin:$PATH"

export PATH='/usr/local/bin':$PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

complete -C aws_completer aws

parse_git_branch() {
         git branch 2> /dev/null | awk '{ if ( $1 == "*" ) {print $2}}'
}
git_user() {
    git config user.email | awk '{print $0}'
}

LSCOLORS='Hxfxcxdxgxegedabagacad'; export LSCOLORS
export LS_OPTIONS='-G'
alias ls='ls $LS_OPTIONS'
