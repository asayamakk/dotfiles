[ -f ~/dotfiles/alias.sh ] && . ~/dotfiles/alias.sh

export LESS='-R'
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export HISTTIMEFORMAT='%Y-%m-%dT%T%z '
export HISTSIZE=50000


# Go
export GOPATH=$HOME/go

export FIGNORE=$FIGNORE:DS_Store
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

eval "$(goenv init -)"
eval "$(hub alias -s)"

export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/bin:$PATH

# bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.bashrc ] ; then
    source ~/.bashrc
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
eval "$(rbenv init -)"
