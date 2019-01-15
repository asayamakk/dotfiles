[ -f ~/dotfiles/alias.sh ] && . ~/dotfiles/alias.sh

export EDITOR=vim
export LESS='-R'
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export HISTTIMEFORMAT='%Y-%m-%dT%T%z '
export HISTSIZE=50000
export XDG_CONFIG_HOME=~/.config


# Go
export GOPATH=$HOME/go

export FIGNORE=$FIGNORE:DS_Store
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

eval "$(goenv init -)"
eval "$(hub alias -s)"

export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:$HOME/src/google-cloud-sdk/bin
export PATH=$HOME/bin:$PATH

# bash-completion
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f ~/.bashrc ] && source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
eval "$(rbenv init -)"

# gcloud
## The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/usr0200557/src/google-cloud-sdk/path.bash.inc' ]; then . '/Users/usr0200557/src/google-cloud-sdk/path.bash.inc'; fi
## The next line enables shell command completion for gcloud.
if [ -f '/Users/usr0200557/src/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/usr0200557/src/google-cloud-sdk/completion.bash.inc'; fi

# enable direnv hook
## https://github.com/zimbatm/direnv
eval "$(direnv hook bash)"
